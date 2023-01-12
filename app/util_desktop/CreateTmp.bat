@echo off
setlocal

rem ******************************************************************
rem * CreateTmp.bat: �{�����t�̈ꎞ��Ɨp�f�B���N�g�����쐬����
rem *
rem * [����]
rem *   ���Â�폜���Ă������x���Ȃ��t�@�C���Ȃǂ��ꎞ�I�ɊǗ����邽�߂̃f�B���N�g�����쐬���܂��B
rem *   �f�X�N�g�b�v�ȂǂɈ�U�ێ����邱�Ƃ̖����悤�ɁA�{�����邽�߂����̃t�@�C���Ȃǂ͂��̃f�B���N�g���ŊǗ����邱�Ƃ�
rem *   PC�̃t�@�C���Ǘ���e�Ղɂ��邽�߂ɍ쐬���܂����B
rem * 
rem * [����]
rem *   %1:��ƃt�H���_���쐬����f�B���N�g��
rem *
rem * [�g����]
rem *   CreateTmp.bat c:\memo
rem * 
rem * [�o�[�W����]
rem *   1.0.0
rem ******************************************************************


rem �萔��`
set "CURRENT_DIR=%~dp0"
set "BATCH_FUNC_NAME=�������t��ƃf�B���N�g���쐬"
set "BATCH_FILE_NAME=%~n0"

rem ��ƃf�B���N�g���ݒ�
cd %CURRENT_DIR%

rem �����ݒ�
set "TMP_DIR=%1"
set "DATE_STR=%date:~0,4%%date:~5,2%%date:~8,2%"
set "SUFFIX_NAME=work"
set "MK_DIR=%TMP_DIR%\%DATE_STR%_%SUFFIX_NAME%"

rem �����J�n
echo [START] %BATCH_FUNC_NAME% %BATCH_FILE_NAME%

rem �����`�F�b�N
if not "%2"=="" (
    echo �^����ꂽ�������s���ł��B
    call :usage
    endlocal
    exit /b 1
)

rem �f�B���N�g���f�t�H���g�ݒ� �����Ȃ��̏ꍇ�f�t�H���g�ݒ�
if "%TMP_DIR%"=="" (
    set "TMP_DIR=%CURRENT_DIR%\\..\\..\data\tmp\\"
)

rem �w�肳�ꂽ�f�B���N�g���̑��݊m�F
if not exist %TMP_DIR% (
    echo �w�肳�ꂽ�f�B���N�g�������݂��܂���B �f�B���N�g���p�X�F%TMP_DIR%
    endlocal
    exit /b 1
)

rem �����p�f�B���N�g���̑��݊m�F
if not exist %MK_DIR% (
    echo �����p�f�B���N�g�������݂��܂���B �f�B���N�g���p�X�F%MK_DIR%
    mkdir %MK_DIR%
) else (
    echo �����p�f�B���N�g�������݂��܂����B �f�B���N�g���p�X�F%MK_DIR%
)

rem �����p�f�B���N�g�����J��
start %MK_DIR%

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
echo CreateMemo.bat c:\memo
echo.
exit /b 0

