@echo off
setlocal

rem ******************************************************************
rem * tmp.bat: �{�����t�̈ꎞ��Ɨp�f�B���N�g�����쐬����
rem *
rem * [����]
rem *   ���Â�폜���Ă������x���Ȃ��t�@�C���Ȃǂ��ꎞ�I�ɊǗ����邽�߂̃f�B���N�g�����쐬���܂��B
rem *   �f�X�N�g�b�v�ȂǂɈ�U�ێ����邱�Ƃ̖����悤�ɁA�{�����邽�߂����̃t�@�C���Ȃǂ͂��̃f�B���N�g���ŊǗ����邱�Ƃ�
rem *   PC�̃t�@�C���Ǘ���e�Ղɂ��邽�߂ɍ쐬���܂����B
rem * 
rem * [����]
rem *   �Ȃ�
rem * 
rem * [�o�[�W����]
rem *   1.0.0
rem ******************************************************************

set "CURRENT_DIR=%~dp0"
set "LIB_DIR=%CURRENT_DIR%lib"
set "PATH=%PATH%;%LIB_DIR%"
set "TMP_DIR=%CURRENT_DIR%data\tmp"
set "DATE_STR=%date:~0,4%%date:~5,2%%date:~8,2%"
set "SUFFIX_NAME=work"
set "MK_DIR=%TMP_DIR%\%DATE_STR%_%SUFFIX_NAME%"

rem echo %CURRENT_DIR%

call DirectoryExists.bat %MK_DIR%

if %errorlevel% == 1 (
    : NOT FOUND DIR 
    mkdir %MK_DIR%
    call LOGGER INFO "MAKE DIR : %MK_DIR%"
) else (
    : EXIST DIR 
    call LOGGER INFO "EXIST DIR : %MK_DIR%"
)
start %MK_DIR%
exit
