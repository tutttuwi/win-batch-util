@setlocal
@echo off

rem ******************************************************************
rem * ExecSqlsUnderDirectory.bat: 指定されたディレクトリ直下のSQLファイルをファイル名の昇順ですべて実行します。
rem *
rem * [説明]
rem *   ＜戻り値＞
rem *   ・処理成功の場合、0を返す
rem *   ・処理失敗の場合、1を返す
rem * 
rem * [引数]
rem *   %1: 環境変数設定ファイル
rem *   %2: SQLファイルが格納されたディレクトリ
rem *   %3: 対象ファイル名（正規表現）※指定がない場合は(*.sql)
rem *
rem * [使い方]
rem *   ExecSqlsUnderDirectory.bat c:\conf.ini c:\sql sample_*.sql
rem * 
rem * [バージョン]
rem *   1.0.0
rem ******************************************************************

rem 定数定義
set "CURRENT_DIR=%~dp0"
set "BATCH_FUNC_NAME=ディレクトリ直下SQLファイル実行"
set "BATCH_FILE_NAME=%~n0"

rem 作業ディレクトリ設定
cd %CURRENT_DIR%

rem 引数設定
set INI_FILE_PATH=%1
set DIR_PATH=%2
set TAR_FILE_REG=%3

echo 対象ディレクトリ：%DIR_PATH%
echo 対象ファイル名：%TAR_FILE_REG%

rem 処理開始
echo [START] %BATCH_FUNC_NAME% %BATCH_FILE_NAME%

rem 引数チェック
if not "%4"=="" (
    echo 与えられた引数が不正です。
    call :usage
    endlocal
    exit /b 1
)

rem ファイル存在確認
if not exist %INI_FILE_PATH% (
    echo 指定されたファイルが存在しません。 ファイル：%INI_FILE_PATH%
    endlocal
    exit /b 1
)

rem ディレクトリ存在確認
if not exist %DIR_PATH% (
    echo 指定されたディレクトリが存在しません。 ディレクトリ：%DIR_PATH%
    endlocal
    exit /b 1
)

rem 対象ファイルチェック(指定がない場合はデフォルト値設定）
if %TAR_FILE_REG%=="" (
    set %TAR_FILE_REG%=*.sql
)

rem 環境変数ファイル読み込み
for /f "delims== tokens=1,2" %%i in (%INI_FILE_PATH%) do (
    if not %%i=="" if not %%j=="" (
        set %%i=%%j
    )
)

rem SQLファイル実行
rem for /f %%a in (%DIR_PATH%\%TAR_FILE_REG%) do (
for /f "usebackq" %%a in (`dir /S /B %DIR_PATH%\%TAR_FILE_REG%`) do (
    echo 実行SQLファイル：%%a
    sqlcmd -U %USER% -P %PASSWORD% -S %HOST% -i %%a
    
    if not errorlevel 0 (
        echo SQLファイルでエラーが発生しました。 ファイル名：%%a
    ) else (
        echo SQLファイルの実行が完了しました。 ファイル名：%%a
    )
)

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
echo ExecSqlsUnderDirectory.bat c:\conf.ini c:\sql sample_*.sql
echo.
pause
exit /b 0

