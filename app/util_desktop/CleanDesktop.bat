@echo off
setlocal

rem �f�X�N�g�b�v�ɓ������t�Ńt�H���_���쐬���ĕ����t�@�C�����i�[���邾���̏���
set DATE_STR="%date:~0,4%-%date:~5,2%-%date:~8,2%"
mkdir "C:\Users\%username%\Desktop\%DATE_STR%"
ROBOCOPY "C:\Users\%username%\Desktop" "C:\Users\%username%\Desktop\\%DATE_STR%" * /MOV /XF *.lnk

exit /b 0
