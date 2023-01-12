@echo off
setlocal

rem デスクトップに当日日付でフォルダを作成して物理ファイルを格納するだけの処理
set DATE_STR="%date:~0,4%-%date:~5,2%-%date:~8,2%"
mkdir "C:\Users\%username%\Desktop\%DATE_STR%"
ROBOCOPY "C:\Users\%username%\Desktop" "C:\Users\%username%\Desktop\\%DATE_STR%" * /MOV /XF *.lnk

exit /b 0
