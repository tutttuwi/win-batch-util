@echo off
setlocal
cd %~dp0

set CURDIR=%~dp0

echo.
echo ��======================================================��
echo ��  Zip�t�@�C���̉𓀂��J�n���܂��I
echo ��======================================================��

echo.
echo #-------------------------------------------------------#
set /p ZIPRES=�𓀂��܂��B��낵���ł����H...  Y/N?
echo #-------------------------------------------------------#

if /i {"%ZIPRES%"}=={"N"} (
   rem �𓀏������X�L�b�v����
   goto SKIP
   
   ) else (
   echo �J�����g�f�B���N�g���́u*.zip�v�t�@�C����S���𓀂��܂��B
   for %%i in (*.zip) do (
      echo �Ώۃt�@�C���F�@�u%%i�v
      call :SUB %%i
      )
   )
   
   
goto END

:SUB
echo �𓀒�...
set INPUT_FILE=%1

lhaplus /o:"%CURDIR%" %INPUT_FILE%
exit /b

:END
echo.
echo *-------------------------------------------------------*
echo *  zip�t�@�C���̉𓀂��������܂����I
echo *-------------------------------------------------------*
goto FIN

:SKIP
echo.
echo *-------------------------------------------------------*
echo *  zip�t�@�C���̉𓀂��������܂����I
echo *-------------------------------------------------------*
goto FIN

:FIN
rem �I������
exit