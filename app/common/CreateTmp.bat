@echo off
setlocal

rem ******************************************************************
rem * CreateTmp.bat: 本日日付の一時作業用ディレクトリを作成する
rem *
rem * [説明]
rem *   いづれ削除しても差し支えないファイルなどを一時的に管理するためのディレクトリを作成します。
rem *   デスクトップなどに一旦保持することの無いように、閲覧するためだけのファイルなどはこのディレクトリで管理することで
rem *   PCのファイル管理を容易にするために作成しました。
rem * 
rem * [引数]
rem *   %1:作業フォルダを作成するディレクトリ
rem *
rem * [使い方]
rem *   CreateTmp.bat c:\memo
rem * 
rem * [バージョン]
rem *   1.0.0
rem ******************************************************************


rem 定数定義
set "CURRENT_DIR=%~dp0"
set "BATCH_FUNC_NAME=当日日付作業ディレクトリ作成"
set "BATCH_FILE_NAME=%~n0"

rem 作業ディレクトリ設定
cd %CURRENT_DIR%

rem 引数設定
set "TMP_DIR=%1"
set "DATE_STR=%date:~0,4%%date:~5,2%%date:~8,2%"
set "SUFFIX_NAME=work"
set "MK_DIR=%TMP_DIR%\%DATE_STR%_%SUFFIX_NAME%"

rem 処理開始
echo [START] %BATCH_FUNC_NAME% %BATCH_FILE_NAME%

rem 引数チェック
if not "%2"=="" (
    echo 与えられた引数が不正です。
    call :usage
    endlocal
    exit /b 1
)

rem ディレクトリデフォルト設定 引数なしの場合デフォルト設定
if "%TMP_DIR%"=="" (
    set "TMP_DIR=%CURRENT_DIR%\\..\\..\data\tmp\\"
)

rem 指定されたディレクトリの存在確認
if not exist %TMP_DIR% (
    echo 指定されたディレクトリが存在しません。 ディレクトリパス：%TMP_DIR%
    endlocal
    exit /b 1
)

rem 当日用ディレクトリの存在確認
if not exist %MK_DIR% (
    echo 当日用ディレクトリが存在しません。 ディレクトリパス：%MK_DIR%
    mkdir %MK_DIR%
) else (
    echo 当日用ディレクトリが存在しました。 ディレクトリパス：%MK_DIR%
)

rem 当日用ディレクトリを開く
start %MK_DIR%

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
echo CreateMemo.bat c:\memo
echo.
exit /b 0

