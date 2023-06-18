@setlocal
@echo off
setlocal enabledelayedexpansion

rem ******************************************************************
rem * AddFileNameHeadLine.bat: 指定されたディレクトリ配下に存在するファイル内の先頭に付与します。
rem *
rem * [説明]
rem *   ＜戻り値＞
rem *   ・処理成功の場合、0を返す
rem *   ・処理失敗の場合、1を返す
rem * 
rem * [引数]
rem *   %1: 対象ディレクトリ
rem *   %2: 対象ファイル（正規表現）
rem *   %3: 区切り文字
rem *
rem * [使い方]
rem *   AddFileNameHeadLine.bat c:\data\sample *.log ","
rem * 
rem * [バージョン]
rem *   1.0.0
rem ******************************************************************

rem 定数定義
set "CURRENT_DIR=%~dp0"
set "BATCH_FUNC_NAME=ファイル名付与処理"
set "BATCH_FILE_NAME=%~n0"

rem 作業ディレクトリ設定
cd %CURRENT_DIR%

rem 引数設定
set DIR_PATH=%1
set DIR_ADDHEAD_PATH=%DIR_PATH%\addhead
set TAR_FILE_REGEX=%2
set SPLIT_STR=%~3

echo 対象ディレクトリ：%DIR_PATH%
echo 対象ファイル（正規表現）：%TAR_FILE_REGEX%
echo 区切り文字：%SPLIT_STR%

rem 処理開始
echo [START] %BATCH_FUNC_NAME% %BATCH_FILE_NAME%

rem 引数チェック
if "%~3"=="" (
    echo 与えられた引数が不正です。
    call :usage
    endlocal
    exit /b 1
)

rem ディレクトリ存在確認
if not exist %DIR_PATH% (
    echo 指定されたディレクトリが存在しません。
    endlocal
    exit /b 1
)

rem ヘッダ付与後ファイル出力先
mkdir %DIR_ADDHEAD_PATH%

rem ヘッダ情報付与ファイル出力
for %%a in (%DIR_PATH%\%TAR_FILE_REGEX%) do (
    echo %%a
    echo %%~na
    dir %%a
    rem set /a FILE_NAME=%%~na%%~xa
    for /f "delims=" %%b in (%%a) do (
        echo %%~na%%~xa%SPLIT_STR%%%b
        echo %DIR_ADDHEAD_PATH%\%%~na%%~xa_addhead.txt
        echo %%~na%%~xa%SPLIT_STR%%%b >> %DIR_ADDHEAD_PATH%\%%~na%%~xa_addhead.txt
    )
)

if not errorlevel 0 (
    echo %BATCH_FUNC_NAME% 処理が失敗しました..
    endlocal
    exit /b 1
)

echo %BATCH_FUNC_NAME% 処理が完了しました。

rem 処理終了
echo [ END ] %BATCH_FUNC_NAME% %BATCH_FILE_NAME% 

pause
endlocal
exit /b 0

rem ------------------------------
rem         サブルーチン
rem ------------------------------
:usage
echo.
echo [usage]
echo Ex)
echo AddFileNameHeadLine.bat c:\data\sample *.log ","
echo.
pause
exit /b 0

