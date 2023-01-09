@setlocal
@echo off

rem ******************************************************************
rem * Housekeep.bat: 指定されたディレクトリの更新日時が古いファイルを削除します。
rem *
rem * [説明]
rem *   ＜戻り値＞
rem *   ・処理成功の場合、0を返す
rem *   ・処理失敗の場合、1を返す
rem * 
rem * [引数]
rem *   %1: 対象ディレクトリ
rem *   %2: 対象ファイル名（正規表現）
rem *   %3: N日前指定 更新日時がN日前を削除対象とするか
rem *
rem * [使い方]
rem *   Housekeep.bat c:\backup\ *.log 7
rem * 
rem * [バージョン]
rem *   1.0.0
rem ******************************************************************

rem 定数定義
set "CURRENT_DIR=%~dp0"
set "BATCH_FUNC_NAME=ハウスキープ処理"
set "BATCH_FILE_NAME=%~n0"

rem 作業ディレクトリ設定
cd %CURRENT_DIR%

rem 引数設定
set DIR_PATH=%1
set TAR_FILE_REG=%2
set TAR_DATE_BEFORE=%3

echo 対象ディレクトリ：%DIR_PATH%
echo 対象ファイル名：%TAR_FILE_REG%
echo 対象日付(N日前)：%TAR_DATE_BEFORE%

rem 処理開始
echo [START] %BATCH_FUNC_NAME% %BATCH_FILE_NAME%

rem 引数チェック
if not "%4"=="" (
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

rem 対象ファイル削除
rem forfiles /p %DIR_PATH% /d -%TAR_DATE_BEFORE% /m "%TAR_FILE_REG%" /c "cmd /c echo @file"
rem forfiles /p %DIR_PATH% /d -%TAR_DATE_BEFORE% /m "%TAR_FILE_REG%" /c "cmd /c del @file"

for /f "usebackq" %%a in (`forfiles /p %DIR_PATH% /d -%TAR_DATE_BEFORE% /m %TAR_FILE_REG%`) do (
    echo 削除対象ファイル: %DIR_PATH%%%a
    del %DIR_PATH%%%a
)

if not errorlevel 0 (
    echo ハウスキープ処理に失敗しました。
    endlocal
    exit /b 1
)

echo ハウスキープ処理が完了しました。

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
echo Housekeep.bat c:\backup\ *.log 7
echo.
pause
exit /b 0

