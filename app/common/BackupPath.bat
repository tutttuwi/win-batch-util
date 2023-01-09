@setlocal
@echo off

rem ******************************************************************
rem * BackupPath.bat: 実行サーバ(Windows)のpath設定をファイルにバックアップする
rem *
rem * [説明]
rem *   ＜戻り値＞
rem *   ・バックアップ完了の場合、0を返す
rem *   ・バックアップ失敗の場合、1を返す
rem * 
rem * [引数]
rem *   %1: バックアップファイル配置ディレクトリ
rem *
rem * [使い方]
rem *   BackupPath.bat c:\backup
rem * 
rem * [バージョン]
rem *   1.0.0
rem ******************************************************************

rem 定数定義
set "CURRENT_DIR=%~dp0"
set "BATCH_FUNC_NAME=path設定バックアップ"
set "BATCH_FILE_NAME=%~n0"

rem 作業ディレクトリ設定
cd %CURRENT_DIR%

rem 引数設定
set DIR_PATH=%1

rem 処理開始
echo [START] %BATCH_FUNC_NAME% %BATCH_FILE_NAME%

rem 引数チェック
if not "%2"=="" (
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

set YMDHMS=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%
set path >"%DIR_PATH%\path_%YMDHMS%.log"

if not errorlevel 0 (
    echo パス設定のバックアップに失敗しました。
    endlocal
    exit /b 1
)

echo パス設定のバックアップが完了しました。

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
echo BackupPath.bat c:\backup
echo.
pause
exit /b 0

