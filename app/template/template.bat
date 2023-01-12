@echo off
rem 「@echo off」はコマンドプロンプト画面にバッチファイルに書いたコマンドを復唱させないようにするための指示
rem 「@」をつけることで[echo off]自体を画面出力しないようにしている

rem ローカル変数開始の定義 WidnowsBatファイルはすべてグローバル変数で定義されてしまうため、
rem 明示的に [setlocal] [endlocal]を宣言しなければいけないため、決まりごととしてバッチファイルの先頭で宣言します。
rem setlocal

rem バッチ処理内で遅延環境変数を使う場合は以下の記述にする　変数利用時は!（エクスクラメーションマーク）で囲う
setlocal enabledelayedexpansion

rem ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
rem ■
rem ■　【WidnowsBatファイル テンプレート】
rem ■　＜はじめに＞
rem ■　・テンプレート用の説明コメントを入れていますが、利用時は適宜削除して利用してください。
rem ■　＜コーディングルール＞
rem ■　・コメント行は rem を利用すること。 [:]や[::]も利用できますが、[:]ラベル行と混同してしまう可能性が高いため避けます。
rem ■
rem ■
rem ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

rem バッチ処理開始時の標準出力を必要に応じて利用する
echo ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
echo ■
echo ■　バッチ処理 [START]
echo ■
echo ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

rem ##################################################
rem #
rem # メイン処理セクション
rem #
rem ##################################################
rem バッチメイン処理の記述

rem 定数定義
set "CURRENT_DIR=%~dp0"
set "WK_DIR=%CURRENT_DIR%work"
set "BATCH_FUNC_NAME=バッチ機能名"
set "BATCH_FILE_NAME=%~n0"

rem 外部ファイル読み込み
set "LIB_DIR=%CURRENT_DIR%lib"
set "PATH=%PATH%;%LIB_DIR%"

rem 作業ディレクトリをバッチファイルが存在するディレクトリに変更
cd %CURRENT_DIR%

rem ログファイル設定(必要に応じて外部ファイルに抜き出して利用する)
set "LOG_FILE_NAME=%BATCH_NAME%"
rem ログファイル書き込み
call :logger "%LOG_FILE_NAME%" "INFO" "ログテスト"


rem ************************************************************
rem                      スニペット記述
rem ************************************************************

rem ■バッチ利用可能な環境変数
rem ○日時
rem echo %date% 
rem -> yyyy/MM/dd 
rem echo %time%
rem -> hh:mm:ss.ss

rem ■変数の置換方法
rem %[変数名]:[置換元]=[置換先]%
rem %date:/=%
rem -> /を空文字に置換するため yyyyMMdd になる

rem ■変数の切り出し方法（substring）
rem %[変数名]:~[切り取り開始位置],[切り取り文字数]%
rem set hoge=123456
rem %hoge:~0,4%
rem -> 1234

rem ■日時変換
rem ○yyyyMMdd
rem set yyyyMMdd=%date:/=%
rem ○hhmmss
rem set hhmmss=%time::=%
rem set hhmmss=%hhmmss:~0,6%
rem ○yyyyMMddhhmmss
rem set yyyyMMdd_hhmmss=%yyyyMMdd%_%hhmmss%

rem ■空ファイル作成方法
rem break > hoge.txt

rem ■条件分岐 if演算子
rem ○文字列比較
rem if ［not］文字列1==文字列2 ＜コマンド＞
rem ※文字列代入時にダブルクォーテーションで囲うと、ダブルクォーテーションも文字列として認識されてしまう
rem AND/OR文字が利用できないので、入れ子で表現するしか無い
set ifstr=hoge hoge
if "hoge hoge"=="%ifstr%" (
  echo if演算子 文字列条件比較 true
) else (
  echo if演算子 文字列条件比較 false
)

rem ○数値比較
rem if 文字列1 ＜演算子＞ 文字列2 ＜コマンド＞
rem 「EQU（等しい）」「NEQ（等しくない）」「LSS（より小さい）」「LEQ（以下）」「GTR（より大きい）」「GEQ（以上）」
set ifnum=1
if 1 EQU %ifnum% (
  echo if演算子 数値条件比較 true
) else (
  echo if演算子 数値条件比較 false
)

rem ○フォルダ/ファイル存在確認
rem if ［not］exist ＜パス名＞ ＜コマンド＞
rem ※ファイルかフォルダかの区別はできない
set ifpath="c:\\"
rem set ifpath="c:\notfound"
if exist %ifpath% (
  echo if演算子 フォルダ/ファイル存在確認 true
) else (
  echo if演算子 フォルダ/ファイル存在確認 false
)

rem ○コマンドのエラーレベル検出
rem if ［not］errorlevel ＜数値＞ ＜コマンド＞
rem dir c:\
if errorlevel 0 (
  echo if演算子 エラーレベル検出 0
) else (
  echo if演算子 エラーレベル検出 0以外
)

rem ○コマンドのエラーレベル検出 数値比較
if %errorlevel% == 0 (
  echo if演算子 エラーレベル検出 数値比較 0
) else (
  echo if演算子 エラーレベル検出 数値比較 0以外
)

rem ■繰り返し処理 for文
rem for （オプション） %%アルファベット１文字 in (ループ処理の対象) do コマンド 

rem ※オプション※
rem (オプション無し) ディレクトリ内を対象にとる
rem /d ディレクトリ（フォルダ）名を対象にとる
rem /r ディレクトリ名及びそのサブディレクトリ内（そのフォルダの中のファイル名やフォルダ名）を対象にとる
rem /l 値を指定して代入する
rem /f テキストファイル内の文章に対してトークンを取り出して代入する

rem ※ワイルドカード※
rem ループ処理の対象に指定できるワイルドカード
rem * 1文字以上
rem ? 1文字

rem ○オプション無 カレントディレクトリ内のファイルを対象
rem カレントディレクトリ内の [対象ファイル] が繰り返し処理の対象
for %%i in (*.bat) do (
  echo ファイル名:%%i
)

rem ○ディレクトリが対象
for /d %%i in (*) do (
  echo フォルダ名:%%i
)

rem ○指定されたディレクトリを再帰的に見た、ディレクトリ内のファイルが対象
for /r c:\work %%i in (*.txt) do (
  echo ファイルパス（フルパス）:%%i
)

rem ○指定した値で実行する
rem for /l %%i in (開始値、増分、終了値) do コマンド
for /l %%i in (1,2,10) do (
  echo %%i
)

rem ○トークンを代入する
rem for /f "トークンオプション" %%i in (処理の対象) do コマンド
rem ※トークンオプション一覧※
rem tokens= 何番目のトークンを指定するか？
rem delims= トークンの区切り文字を指定
rem eol= この文字から始まる行を無視
rem skip= 先頭から指定された行数、スキップする。
rem usebackq コマンドの出力を対象にする

rem [tokens] スペース(タブ)区切りで1番目と3番目を取得
for /f "tokens=1,3" %%i in (hogehoge.txt) do echo %%i %%j

rem [delims] トークンの区切り文字を [:] に変更　スペースとタブは区切り文字として扱われなくなる
for /f "tokens=1,3 delims=:" %%i in (hogehoge.txt) do echo %%i %%j
rem ※スペースとタブも区切り文字にしたい場合、:のあとにスペースを入れる
for /f "tokens=1,3 delims=: " %%i in (hogehoge.txt) do echo %%i %%j

rem eolで指定した文字から始まる行を無視
for /f "tokens=1,3 eol=a" %%i in (hogehoge.txt) do echo %%i %%j
rem skipで指定した行数分先頭から無視
for /f "tokens=1,3 skip=2" %%i in (hogehoge.txt) do echo %%i %%j

rem コマンドプロンプト上で使用できるMSDOSコマンドの出力を対象とする
for /f "usebackq tokens=1 delims==" %%i in (`set`) do echo %%i


echo ##### for文 遅延初期化処理サンプル
set /a latenum=0
for /l %%i in (1,1,5) do (
  set /a latenum=latenum+1
  echo !latenum!
)

echo ##### ファイル行数取得
rem for文中のコマンドでパイプを利用する場合は^でエスケープする必要あり
set linefile=hogehoge.txt
rem type %linefile% | find /v /c "" > line.log
rem for /f "usebackq tokens=*" %%i IN (`type line.log`) DO @set line=%%i
for /f "usebackq tokens=*" %%i IN (`type %linefile% ^| find /v /c ""`) DO @set line_cnt=%%i
echo ファイル行数: %line_cnt%

echo ##### ファイルリネーム

echo ##### 指定フォルダ配下のファイルリネーム

echo ##### テンプレ他にもあれば記載していく

echo ##### echoで空行を差し込む方法
echo "echoコマンドのあとに.をスペースを開けずに差し込む（記号ならなんでもよい）"
echo.
echo 空行差し込み
echo.


rem ************************************************************








rem 外部バッチファイル呼び出し
rem ※call [バッチファイル名]で呼び出すこと（callをつけないと処理が本ファイルに戻らず終了してしまう）
rem 外部共通ファイル名

rem サブルーチン化したい場合の呼び出し
rem 適切なサブルーチン名を定義して実装
call :subroutine1

call :subroutine2

pause

rem ##################################################
rem #
rem # エンドセクション
rem #
rem ##################################################

rem バッチ処理終了時の標準出力を必要に応じて利用する
echo ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
echo ■
echo ■　バッチ処理 [END]
echo ■
echo ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

rem 明示的に変数定義の終了を宣言します。
endlocal

rem 処理終了時に戻り値を返せるように [/b] を付与して処理を終了します。
exit /b 
rem ジョブスケジューラからの起動などの場合、戻り値を指定して処理を終了させてください。
rem exit /b 0




rem ##################################################
rem #
rem # サブルーチンセクション
rem #
rem ##################################################

:subroutine1
rem [START] subroutine1 ------------------------------

rem バッチ処理記述
exit /b 0

rem [ END ] subroutine1 ------------------------------


:subroutine2
rem [START] subroutine1 ------------------------------

rem バッチ処理記述
exit /b 0

rem [ END ] subroutine1 ------------------------------


:logger
rem [START] logger ------------------------------
setlocal
rem ******************************************************************
rem * logger.bat: ログ出力処理
rem *
rem * [説明]
rem *   ＜戻り値＞
rem *   ・なし
rem * 
rem * [引数]
rem *    %1: ログファイル名
rem *    %2: ログレベル
rem *    %3: メッセージテキスト
rem * 
rem * [バージョン]
rem *   1.0.0
rem ******************************************************************
rem call logger ["LOG_FILE_NAME"] ["INFO|ERROR|WARN"] ["MESSAGE TEXT"]

set "LOG_FILE_NAME=%~1"
set "LL=%~2"
set "MSG=%~3"
set D=%DATE%
set T=%TIME:~0,8%
set T=%T: =0%
set "DATE_STR=%date:~0,4%%date:~5,2%%date:~8,2%"
set "CURRENT_DIR=%~dp0"
set "LOG_FILE=%CURRENT_DIR%%DATE_STR%_%LOG_FILE_NAME%.log"

echo %D% %T% %LL% %MSG%
echo %D% %T% %LL% %MSG% >> %LOG_FILE%

endlocal

exit /b
rem [ END ] logger ------------------------------


