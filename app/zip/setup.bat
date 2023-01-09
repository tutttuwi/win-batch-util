@echo off
setlocal
cd %~dp0

set CURDIR=%~dp0

echo ■□■□■□■□■□■□■□■□■□■□■□■
echo □  環境変数チェック
echo ■□■□■□■□■□■□■□■□■□■□■□■

path > %CURDIR%\path.tmp
findstr /c:"C:\Program Files (x86)\Lhaplus" path.tmp > NUL

echo 【チェック結果】
IF %ERRORLEVEL% EQU 0 (
   echo.
   echo 「既にパスが設定されています」
   echo 処理を終了します...
   pause
   exit

) ELSE (
   echo.
   echo #----------------------------------------------#
   echo # 環境変数が未設定の為セットアップを開始します #
   echo #----------------------------------------------#

   rem 環境変数設定
   setx /M path "%path%;C:\Program Files (x86)\Lhaplus"
)
echo.
echo *-----------------------------------------------*
echo * セットアップが完了しました！
echo *-----------------------------------------------*

pause

exit
