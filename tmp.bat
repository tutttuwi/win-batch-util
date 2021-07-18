@echo off
setlocal

rem ******************************************************************
rem * tmp.bat: 本日日付の一時作業用ディレクトリを作成する
rem *
rem * [説明]
rem *   いづれ削除しても差し支えないファイルなどを一時的に管理するためのディレクトリを作成します。
rem *   デスクトップなどに一旦保持することの無いように、閲覧するためだけのファイルなどはこのディレクトリで管理することで
rem *   PCのファイル管理を容易にするために作成しました。
rem * 
rem * [引数]
rem *   なし
rem * 
rem * [バージョン]
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
