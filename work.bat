@echo off
setlocal

set "CURRENT_DIR=%~dp0"
set "LIB_DIR=%CURRENT_DIR%lib"
set "PATH=%PATH%;%LIB_DIR%"
set "TMP_DIR=D:\tmp"
set "DATE_STR=%date:~0,4%%date:~5,2%%date:~8,2%"
set "SUFFIX_NAME=work"
set "MK_DIR=%TMP_DIR%\%DATE_STR%_%SUFFIX_NAME%"

rem echo %CURRENT_DIR%

call DirectoryExists.bat %MK_DIR%

if %errorlevel% == 1 (
    : NOT FOUND DIR 
    mkdir %MK_DIR%
    call LOGGER INFO "MAKE DIR -> %MK_DIR%"
) else (
    : EXIST DIR 
    call LOGGER INFO "EXIST DIR -> %MK_DIR%"
)
start %MK_DIR%
exit
