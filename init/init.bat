@echo off

echo ■■■■■■■■■■■■■■■■■■■■
echo ■
echo ■ コマンドプロンプト
echo ■
echo ■ 現在日時：%DATE% %TIME%
echo ■
echo ■
echo ■■■■■■■■■■■■■■■■■■■■

rem コマンドプロンプトバージョン出力
ver

rem プロンプト表示形式変更
prompt [%USERNAME%@%COMPUTERNAME% $P]$$$S

exit /b 0

