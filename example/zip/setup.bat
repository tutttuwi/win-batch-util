@echo off
setlocal
cd %~dp0

set CURDIR=%~dp0

echo ����������������������������������������������
echo ��  ���ϐ��`�F�b�N
echo ����������������������������������������������

path > %CURDIR%\path.tmp
findstr /c:"C:\Program Files (x86)\Lhaplus" path.tmp > NUL

echo �y�`�F�b�N���ʁz
IF %ERRORLEVEL% EQU 0 (
   echo.
   echo �u���Ƀp�X���ݒ肳��Ă��܂��v
   echo �������I�����܂�...
   pause
   exit

) ELSE (
   echo.
   echo #----------------------------------------------#
   echo # ���ϐ������ݒ�̈׃Z�b�g�A�b�v���J�n���܂� #
   echo #----------------------------------------------#

   rem ���ϐ��ݒ�
   setx /M path "%path%;C:\Program Files (x86)\Lhaplus"
)
echo.
echo *-----------------------------------------------*
echo * �Z�b�g�A�b�v���������܂����I
echo *-----------------------------------------------*

pause

exit
