@echo off
setlocal

rem ******************************************************************
rem * CreateMemo.bat: 当日日付メモ管理ファイル作成
rem *
rem * [説明]
rem *   いろんなメモ書きが日々発生する中で一箇所にまとめておくことで整理整頓の手助けをするために作成しました。
rem *   デフォルトはmd形式ですが変更いただけます。
rem *   ※事前準備※
rem *   メモ管理するテキストを作成するためのテンプレートファイルを、
rem *   引数に指定するメモ管理するディレクトリ直下に「YYYYMMDD_TEMPLATE.md」の名前で作成してください
rem *
rem * [引数]
rem *   %1:メモ管理するディレクトリ
rem *
rem * [使い方]
rem *   CreateMemo.bat c:\memo
rem *
rem * [バージョン]
rem *   1.0.0
rem ******************************************************************

rem 定数定義
set "CURRENT_DIR=%~dp0"
set "BATCH_FUNC_NAME=当日日付メモ管理ファイル作成"
set "BATCH_FILE_NAME=%~n0"

rem 作業ディレクトリ設定
cd %CURRENT_DIR%

rem 引数設定
set "MEMO_DIR=%1"
set "DATE_STR=%date:~0,4%%date:~5,2%%date:~8,2%"
set "SUFFIX_NAME=MEMO"
set "MK_MEMO=%MEMO_DIR%\%DATE_STR%_%SUFFIX_NAME%.md"
set "MEMO_TMPL=%MEMO_DIR%\YYYYMMDD_TEMPLATE.md"

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
if "%MEMO_DIR%"=="" (
    set "MEMO_DIR=%CURRENT_DIR%\\..\\..\data\memo\\"
)

rem 指定されたディレクトリの存在確認
if not exist %MEMO_DIR% (
    echo 指定されたディレクトリが存在しません。 ディレクトリパス：%MEMO_DIR%
    endlocal
    exit /b 1
)

rem 当日用ファイルをすでに作成しているかどうかを判定
if not exist %MK_MEMO% (
    echo 当日用ファイルが存在しません。 ファイルパス：%MK_MEMO%
    copy %MEMO_TMPL% %MK_MEMO%
) else (
    echo 当日用ファイルが存在しました。 ファイルパス：%MK_MEMO%
)

rem メモファイルを開く
start %MK_MEMO%

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
