@setlocal
@echo off

rem ******************************************************************
rem * FileDirExists.bat: 指定されたパスが存在するかどうかを検証する
rem *
rem * [説明]
rem *   ＜戻り値＞
rem *   ・ファイルが存在する場合、0を返す
rem *   ・ファイルが存在しない場合、1を返す
rem * 
rem * [引数]
rem *   %1: ファイル、またはディレクトリパス
rem *
rem * [使い方]
rem *   FileDirExists.bat c:\backup
rem *   FileDirExists.bat c:\backup\file.txt
rem * 
rem * [バージョン]
rem *   1.0.0
rem ******************************************************************

rem 定数定義
set "CURRENT_DIR=%~dp0"
set "BATCH_FUNC_NAME=ファイル・ディレクトリ存在チェック"
set "BATCH_FILE_NAME=%~n0"

rem 作業ディレクトリ設定
cd %CURRENT_DIR%

rem 引数設定
set FILE_PATH=%1

rem 処理開始
echo [START] %BATCH_FUNC_NAME% %BATCH_FILE_NAME%

rem 引数チェック
if not "%2"=="" (
    echo 与えられた引数が不正です。
    call :usage
    endlocal
    exit /b 1
)

rem ファイルが存在しない場合、1を返す
if not exist %FILE_PATH% (
    echo ファイルまたはディレクトリが存在しません。 ファイルパス：%FILE_PATH%
    endlocal
    exit /b 1
)

echo ファイルまたはディレクトリが存在しました。 ファイルパス：%FILE_PATH%

rem 処理終了
echo [ END ] %BATCH_FUNC_NAME% %BATCH_FILE_NAME% 

endlocal
exit /b 0

rem ------------------------------
rem         サブルーチン
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
