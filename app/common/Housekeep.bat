@setlocal
@echo off

rem ******************************************************************
rem * Housekeep.bat: �w�肳�ꂽ�f�B���N�g���̍X�V�������Â��t�@�C�����폜���܂��B
rem *
rem * [����]
rem *   ���߂�l��
rem *   �E���������̏ꍇ�A0��Ԃ�
rem *   �E�������s�̏ꍇ�A1��Ԃ�
rem * 
rem * [����]
rem *   %1: �Ώۃf�B���N�g��
rem *   %2: �Ώۃt�@�C�����i���K�\���j
rem *   %3: N���O�w�� �X�V������N���O���폜�ΏۂƂ��邩
rem *
rem * [�g����]
rem *   Housekeep.bat c:\backup\ *.log 7
rem * 
rem * [�o�[�W����]
rem *   1.0.0
rem ******************************************************************

rem �萔��`
set "CURRENT_DIR=%~dp0"
set "BATCH_FUNC_NAME=�n�E�X�L�[�v����"
set "BATCH_FILE_NAME=%~n0"

rem ��ƃf�B���N�g���ݒ�
cd %CURRENT_DIR%

rem �����ݒ�
set DIR_PATH=%1
set TAR_FILE_REG=%2
set TAR_DATE_BEFORE=%3

echo �Ώۃf�B���N�g���F%DIR_PATH%
echo �Ώۃt�@�C�����F%TAR_FILE_REG%
echo �Ώۓ��t(N���O)�F%TAR_DATE_BEFORE%

rem �����J�n
echo [START] %BATCH_FUNC_NAME% %BATCH_FILE_NAME%

rem �����`�F�b�N
if not "%4"=="" (
    echo �^����ꂽ�������s���ł��B
    call :usage
    endlocal
    exit /b 1
)

rem �f�B���N�g�����݊m�F
if not exist %DIR_PATH% (
    echo �w�肳�ꂽ�f�B���N�g�������݂��܂���B
    endlocal
    exit /b 1
)

rem �Ώۃt�@�C���폜
rem forfiles /p %DIR_PATH% /d -%TAR_DATE_BEFORE% /m "%TAR_FILE_REG%" /c "cmd /c echo @file"
rem forfiles /p %DIR_PATH% /d -%TAR_DATE_BEFORE% /m "%TAR_FILE_REG%" /c "cmd /c del @file"

for /f "usebackq" %%a in (`forfiles /p %DIR_PATH% /d -%TAR_DATE_BEFORE% /m %TAR_FILE_REG%`) do (
    echo �폜�Ώۃt�@�C��: %DIR_PATH%%%a
    del %DIR_PATH%%%a
)

if not errorlevel 0 (
    echo �n�E�X�L�[�v�����Ɏ��s���܂����B
    endlocal
    exit /b 1
)

echo �n�E�X�L�[�v�������������܂����B

rem �����I��
echo [ END ] %BATCH_FUNC_NAME% %BATCH_FILE_NAME% 

pause
endlocal
exit /b 0

rem ------------------------------
rem         �T�u���[�`��
rem ------------------------------
:usage
echo.
echo [usage]
echo Ex)
echo Housekeep.bat c:\backup\ *.log 7
echo.
pause
exit /b 0

