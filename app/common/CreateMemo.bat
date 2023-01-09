@echo off
setlocal

rem ******************************************************************
rem * CreateMemo.bat: �������t�����Ǘ��t�@�C���쐬
rem *
rem * [����]
rem *   �����ȃ������������X�������钆�ň�ӏ��ɂ܂Ƃ߂Ă������ƂŐ������ڂ̎菕�������邽�߂ɍ쐬���܂����B
rem *   �f�t�H���g��md�`���ł����ύX���������܂��B
rem *   �����O������
rem *   �����Ǘ�����e�L�X�g���쐬���邽�߂̃e���v���[�g�t�@�C�����A
rem *   �����Ɏw�肷�郁���Ǘ�����f�B���N�g�������ɁuYYYYMMDD_TEMPLATE.md�v�̖��O�ō쐬���Ă�������
rem *
rem * [����]
rem *   %1:�����Ǘ�����f�B���N�g��
rem *
rem * [�g����]
rem *   CreateMemo.bat c:\memo
rem *
rem * [�o�[�W����]
rem *   1.0.0
rem ******************************************************************

rem �萔��`
set "CURRENT_DIR=%~dp0"
set "BATCH_FUNC_NAME=�������t�����Ǘ��t�@�C���쐬"
set "BATCH_FILE_NAME=%~n0"

rem ��ƃf�B���N�g���ݒ�
cd %CURRENT_DIR%

rem �����ݒ�
set "MEMO_DIR=%1"
set "DATE_STR=%date:~0,4%%date:~5,2%%date:~8,2%"
set "SUFFIX_NAME=MEMO"
set "MK_MEMO=%MEMO_DIR%\%DATE_STR%_%SUFFIX_NAME%.md"
set "MEMO_TMPL=%MEMO_DIR%\YYYYMMDD_TEMPLATE.md"

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
if "%MEMO_DIR%"=="" (
    set "MEMO_DIR=%CURRENT_DIR%\\..\\..\data\memo\\"
)

rem �w�肳�ꂽ�f�B���N�g���̑��݊m�F
if not exist %MEMO_DIR% (
    echo �w�肳�ꂽ�f�B���N�g�������݂��܂���B �f�B���N�g���p�X�F%MEMO_DIR%
    endlocal
    exit /b 1
)

rem �����p�t�@�C�������łɍ쐬���Ă��邩�ǂ����𔻒�
if not exist %MK_MEMO% (
    echo �����p�t�@�C�������݂��܂���B �t�@�C���p�X�F%MK_MEMO%
    copy %MEMO_TMPL% %MK_MEMO%
) else (
    echo �����p�t�@�C�������݂��܂����B �t�@�C���p�X�F%MK_MEMO%
)

rem �����t�@�C�����J��
start %MK_MEMO%

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
