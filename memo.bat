@echo off
setlocal

rem ******************************************************************
rem * memo.bat: �{�����t�̃����Ǘ��t�@�C�����쐬���܂�
rem *
rem * [����]
rem *   �����ȃ������������X�������钆�ň�ӏ��ɂ܂Ƃ߂Ă������ƂŐ������ڂ̎菕�������邽�߂ɍ쐬���܂����B
rem *   �f�t�H���g��md�`���ł����ύX���������܂��B
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
set "MEMO_DIR=%CURRENT_DIR%data\memo"
set "DATE_STR=%date:~0,4%%date:~5,2%%date:~8,2%"
set "SUFFIX_NAME=MEMO"
set "MK_MEMO=%MEMO_DIR%\%DATE_STR%_%SUFFIX_NAME%.md"
set "MEMO_TMPL=%MEMO_DIR%\YYYYMMDD_TEMPLATE.md"

rem echo %CURRENT_DIR%

call FileExists.bat %MK_MEMO%

if %errorlevel% == 1 (
    rem NOT FOUND FILE 
    rem �e���v���[�g�t�@�C�������݂���΃R�s�[���č쐬
    rem call FileExists.bat "%MEMO_TMPL%"
    rem if %errorlevel% == 1 (
    rem   call LOGGER INFO "NOT FOUND TEMPLATE FILE : %MEMO_TMPL%"
    rem   type nul > %MK_MEMO%
    rem ) else (
    rem   copy %MEMO_TMPL% %MK_MEMO%
    rem )
    copy %MEMO_TMPL% %MK_MEMO%
    call LOGGER INFO "MAKE MEMO : %MK_MEMO%"
) else (
    rem EXIST FILE 
    call LOGGER INFO "EXIST MEMO : %MK_MEMO%"
)
start %MK_MEMO%
rem exit
