@setlocal
@echo off

rem ******************************************************************
rem * ExecSqlsUnderDirectory.bat: �w�肳�ꂽ�f�B���N�g��������SQL�t�@�C�����t�@�C�����̏����ł��ׂĎ��s���܂��B
rem *
rem * [����]
rem *   ���߂�l��
rem *   �E���������̏ꍇ�A0��Ԃ�
rem *   �E�������s�̏ꍇ�A1��Ԃ�
rem * 
rem * [����]
rem *   %1: ���ϐ��ݒ�t�@�C��
rem *   %2: SQL�t�@�C�����i�[���ꂽ�f�B���N�g��
rem *   %3: �Ώۃt�@�C�����i���K�\���j���w�肪�Ȃ��ꍇ��(*.sql)
rem *
rem * [�g����]
rem *   ExecSqlsUnderDirectory.bat c:\conf.ini c:\sql sample_*.sql
rem * 
rem * [�o�[�W����]
rem *   1.0.0
rem ******************************************************************

rem �萔��`
set "CURRENT_DIR=%~dp0"
set "BATCH_FUNC_NAME=�f�B���N�g������SQL�t�@�C�����s"
set "BATCH_FILE_NAME=%~n0"

rem ��ƃf�B���N�g���ݒ�
cd %CURRENT_DIR%

rem �����ݒ�
set INI_FILE_PATH=%1
set DIR_PATH=%2
set TAR_FILE_REG=%3

echo �Ώۃf�B���N�g���F%DIR_PATH%
echo �Ώۃt�@�C�����F%TAR_FILE_REG%

rem �����J�n
echo [START] %BATCH_FUNC_NAME% %BATCH_FILE_NAME%

rem �����`�F�b�N
if not "%4"=="" (
    echo �^����ꂽ�������s���ł��B
    call :usage
    endlocal
    exit /b 1
)

rem �t�@�C�����݊m�F
if not exist %INI_FILE_PATH% (
    echo �w�肳�ꂽ�t�@�C�������݂��܂���B �t�@�C���F%INI_FILE_PATH%
    endlocal
    exit /b 1
)

rem �f�B���N�g�����݊m�F
if not exist %DIR_PATH% (
    echo �w�肳�ꂽ�f�B���N�g�������݂��܂���B �f�B���N�g���F%DIR_PATH%
    endlocal
    exit /b 1
)

rem �Ώۃt�@�C���`�F�b�N(�w�肪�Ȃ��ꍇ�̓f�t�H���g�l�ݒ�j
if %TAR_FILE_REG%=="" (
    set %TAR_FILE_REG%=*.sql
)

rem ���ϐ��t�@�C���ǂݍ���
for /f "delims== tokens=1,2" %%i in (%INI_FILE_PATH%) do (
    if not %%i=="" if not %%j=="" (
        set %%i=%%j
    )
)

rem SQL�t�@�C�����s
rem for /f %%a in (%DIR_PATH%\%TAR_FILE_REG%) do (
for /f "usebackq" %%a in (`dir /S /B %DIR_PATH%\%TAR_FILE_REG%`) do (
    echo ���sSQL�t�@�C���F%%a
    sqlcmd -U %USER% -P %PASSWORD% -S %HOST% -i %%a
    
    if not errorlevel 0 (
        echo SQL�t�@�C���ŃG���[���������܂����B �t�@�C�����F%%a
    ) else (
        echo SQL�t�@�C���̎��s���������܂����B �t�@�C�����F%%a
    )
)

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
echo ExecSqlsUnderDirectory.bat c:\conf.ini c:\sql sample_*.sql
echo.
pause
exit /b 0

