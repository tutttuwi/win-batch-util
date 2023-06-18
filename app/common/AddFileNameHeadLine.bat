@setlocal
@echo off
setlocal enabledelayedexpansion

rem ******************************************************************
rem * AddFileNameHeadLine.bat: �w�肳�ꂽ�f�B���N�g���z���ɑ��݂���t�@�C�����̐擪�ɕt�^���܂��B
rem *
rem * [����]
rem *   ���߂�l��
rem *   �E���������̏ꍇ�A0��Ԃ�
rem *   �E�������s�̏ꍇ�A1��Ԃ�
rem * 
rem * [����]
rem *   %1: �Ώۃf�B���N�g��
rem *   %2: �Ώۃt�@�C���i���K�\���j
rem *   %3: ��؂蕶��
rem *
rem * [�g����]
rem *   AddFileNameHeadLine.bat c:\data\sample *.log ","
rem * 
rem * [�o�[�W����]
rem *   1.0.0
rem ******************************************************************

rem �萔��`
set "CURRENT_DIR=%~dp0"
set "BATCH_FUNC_NAME=�t�@�C�����t�^����"
set "BATCH_FILE_NAME=%~n0"

rem ��ƃf�B���N�g���ݒ�
cd %CURRENT_DIR%

rem �����ݒ�
set DIR_PATH=%1
set DIR_ADDHEAD_PATH=%DIR_PATH%\addhead
set TAR_FILE_REGEX=%2
set SPLIT_STR=%~3

echo �Ώۃf�B���N�g���F%DIR_PATH%
echo �Ώۃt�@�C���i���K�\���j�F%TAR_FILE_REGEX%
echo ��؂蕶���F%SPLIT_STR%

rem �����J�n
echo [START] %BATCH_FUNC_NAME% %BATCH_FILE_NAME%

rem �����`�F�b�N
if "%~3"=="" (
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

rem �w�b�_�t�^��t�@�C���o�͐�
mkdir %DIR_ADDHEAD_PATH%

rem �w�b�_���t�^�t�@�C���o��
for %%a in (%DIR_PATH%\%TAR_FILE_REGEX%) do (
    echo %%a
    echo %%~na
    dir %%a
    rem set /a FILE_NAME=%%~na%%~xa
    for /f "delims=" %%b in (%%a) do (
        echo %%~na%%~xa%SPLIT_STR%%%b
        echo %DIR_ADDHEAD_PATH%\%%~na%%~xa_addhead.txt
        echo %%~na%%~xa%SPLIT_STR%%%b >> %DIR_ADDHEAD_PATH%\%%~na%%~xa_addhead.txt
    )
)

if not errorlevel 0 (
    echo %BATCH_FUNC_NAME% ���������s���܂���..
    endlocal
    exit /b 1
)

echo %BATCH_FUNC_NAME% �������������܂����B

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
echo AddFileNameHeadLine.bat c:\data\sample *.log ","
echo.
pause
exit /b 0

