@setlocal
@echo off

rem ******************************************************************
rem * BackupPath.bat: ���s�T�[�o(Windows)��path�ݒ���t�@�C���Ƀo�b�N�A�b�v����
rem *
rem * [����]
rem *   ���߂�l��
rem *   �E�o�b�N�A�b�v�����̏ꍇ�A0��Ԃ�
rem *   �E�o�b�N�A�b�v���s�̏ꍇ�A1��Ԃ�
rem * 
rem * [����]
rem *   %1: �o�b�N�A�b�v�t�@�C���z�u�f�B���N�g��
rem *
rem * [�g����]
rem *   BackupPath.bat c:\backup
rem * 
rem * [�o�[�W����]
rem *   1.0.0
rem ******************************************************************

rem �萔��`
set "CURRENT_DIR=%~dp0"
set "BATCH_FUNC_NAME=path�ݒ�o�b�N�A�b�v"
set "BATCH_FILE_NAME=%~n0"

rem ��ƃf�B���N�g���ݒ�
cd %CURRENT_DIR%

rem �����ݒ�
set DIR_PATH=%1

rem �����J�n
echo [START] %BATCH_FUNC_NAME% %BATCH_FILE_NAME%

rem �����`�F�b�N
if not "%2"=="" (
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

set YMDHMS=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%
set path >"%DIR_PATH%\path_%YMDHMS%.log"

if not errorlevel 0 (
    echo �p�X�ݒ�̃o�b�N�A�b�v�Ɏ��s���܂����B
    endlocal
    exit /b 1
)

echo �p�X�ݒ�̃o�b�N�A�b�v���������܂����B

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
echo BackupPath.bat c:\backup
echo.
pause
exit /b 0

