@setlocal
@echo off

rem ******************************************************************
rem * FileExists.bat: 指定されたパスがファイルであるか検証する
rem *
rem * [説明]
rem *   ＜戻り値＞
rem *   ・ファイルの場合、0を返す
rem *   ・ファイル以外の場合、1を返す
rem * 
rem * [引数]
rem *   %1: ファイルパス
rem * 
rem * [バージョン]
rem *   1.0.0
rem ******************************************************************
rem echo FileExists.bat %1

set FILE_PATH=%1

rem NULLの場合、1を返す
if not defined FILE_PATH (
    rem echo FileExists.bat NULL
    rem echo %FILE_PATH%
    pause
    endlocal
    exit /b 1
)

rem ファイルが存在しない場合、1を返す
if not exist %FILE_PATH% (
    rem echo FileExists.bat NOT FOUND
    rem echo %FILE_PATH%
    pause
    endlocal
    exit /b 1
)

endlocal
exit /b 0