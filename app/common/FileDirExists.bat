@setlocal
@echo off

rem ******************************************************************
rem * FileDirExists.bat: �w�肳�ꂽ�p�X�����݂��邩�ǂ��������؂���
rem *
rem * [����]
rem *   ���߂�l��
rem *   �E�t�@�C�������݂���ꍇ�A0��Ԃ�
rem *   �E�t�@�C�������݂��Ȃ��ꍇ�A1��Ԃ�
rem * 
rem * [����]
rem *   %1: �t�@�C���A�܂��̓f�B���N�g���p�X
rem *
rem * [�g����]
rem *   FileDirExists.bat c:\backup
rem *   FileDirExists.bat c:\backup\file.txt
rem * 
rem * [�o�[�W����]
rem *   1.0.0
rem ******************************************************************

rem �萔��`
set "CURRENT_DIR=%~dp0"
set "BATCH_FUNC_NAME=�t�@�C���E�f�B���N�g�����݃`�F�b�N"
set "BATCH_FILE_NAME=%~n0"

rem ��ƃf�B���N�g���ݒ�
cd %CURRENT_DIR%

rem �����ݒ�
set FILE_PATH=%1

rem �����J�n
echo [START] %BATCH_FUNC_NAME% %BATCH_FILE_NAME%

rem �����`�F�b�N
if not "%2"=="" (
    echo �^����ꂽ�������s���ł��B
    call :usage
    endlocal
    exit /b 1
)

rem �t�@�C�������݂��Ȃ��ꍇ�A1��Ԃ�
if not exist %FILE_PATH% (
    echo �t�@�C���܂��̓f�B���N�g�������݂��܂���B �t�@�C���p�X�F%FILE_PATH%
    endlocal
    exit /b 1
)

echo �t�@�C���܂��̓f�B���N�g�������݂��܂����B �t�@�C���p�X�F%FILE_PATH%

rem �����I��
echo [ END ] %BATCH_FUNC_NAME% %BATCH_FILE_NAME% 

endlocal
exit /b 0

rem ------------------------------
rem         �T�u���[�`��
rem ------------------------------
:usage
echo.
echo [usage]
echo Ex)
echo FileDirExists.bat c:\backup
echo FileDirExists.bat c:\backup\file.txt
echo.
pause
exit /b 0
