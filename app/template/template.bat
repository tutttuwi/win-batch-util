@echo off
rem �u@echo off�v�̓R�}���h�v�����v�g��ʂɃo�b�`�t�@�C���ɏ������R�}���h�𕜏������Ȃ��悤�ɂ��邽�߂̎w��
rem �u@�v�����邱�Ƃ�[echo off]���̂���ʏo�͂��Ȃ��悤�ɂ��Ă���

rem ���[�J���ϐ��J�n�̒�` WidnowsBat�t�@�C���͂��ׂăO���[�o���ϐ��Œ�`����Ă��܂����߁A
rem �����I�� [setlocal] [endlocal]��錾���Ȃ���΂����Ȃ����߁A���܂育�ƂƂ��ăo�b�`�t�@�C���̐擪�Ő錾���܂��B
rem setlocal

rem �o�b�`�������Œx�����ϐ����g���ꍇ�͈ȉ��̋L�q�ɂ���@�ϐ����p����!�i�G�N�X�N�����[�V�����}�[�N�j�ň͂�
setlocal enabledelayedexpansion

rem ������������������������������������������������������������
rem ��
rem ���@�yWidnowsBat�t�@�C�� �e���v���[�g�z
rem ���@���͂��߂Ɂ�
rem ���@�E�e���v���[�g�p�̐����R�����g�����Ă��܂����A���p���͓K�X�폜���ė��p���Ă��������B
rem ���@���R�[�f�B���O���[����
rem ���@�E�R�����g�s�� rem �𗘗p���邱�ƁB [:]��[::]�����p�ł��܂����A[:]���x���s�ƍ������Ă��܂��\�����������ߔ����܂��B
rem ��
rem ��
rem ������������������������������������������������������������

rem �o�b�`�����J�n���̕W���o�͂�K�v�ɉ����ė��p����
echo ������������������������������������������������������������
echo ��
echo ���@�o�b�`���� [START]
echo ��
echo ������������������������������������������������������������

rem ##################################################
rem #
rem # ���C�������Z�N�V����
rem #
rem ##################################################
rem �o�b�`���C�������̋L�q

rem �萔��`
set "CURRENT_DIR=%~dp0"
set "WK_DIR=%CURRENT_DIR%work"
set "BATCH_FUNC_NAME=�o�b�`�@�\��"
set "BATCH_FILE_NAME=%~n0"

rem �O���t�@�C���ǂݍ���
set "LIB_DIR=%CURRENT_DIR%lib"
set "PATH=%PATH%;%LIB_DIR%"

rem ��ƃf�B���N�g�����o�b�`�t�@�C�������݂���f�B���N�g���ɕύX
cd %CURRENT_DIR%

rem ���O�t�@�C���ݒ�(�K�v�ɉ����ĊO���t�@�C���ɔ����o���ė��p����)
set "LOG_FILE_NAME=%BATCH_NAME%"
rem ���O�t�@�C����������
call :logger "%LOG_FILE_NAME%" "INFO" "���O�e�X�g"


rem ************************************************************
rem                      �X�j�y�b�g�L�q
rem ************************************************************

rem ���o�b�`���p�\�Ȋ��ϐ�
rem ������
rem echo %date% 
rem -> yyyy/MM/dd 
rem echo %time%
rem -> hh:mm:ss.ss

rem ���ϐ��̒u�����@
rem %[�ϐ���]:[�u����]=[�u����]%
rem %date:/=%
rem -> /���󕶎��ɒu�����邽�� yyyyMMdd �ɂȂ�

rem ���ϐ��̐؂�o�����@�isubstring�j
rem %[�ϐ���]:~[�؂���J�n�ʒu],[�؂��蕶����]%
rem set hoge=123456
rem %hoge:~0,4%
rem -> 1234

rem �������ϊ�
rem ��yyyyMMdd
rem set yyyyMMdd=%date:/=%
rem ��hhmmss
rem set hhmmss=%time::=%
rem set hhmmss=%hhmmss:~0,6%
rem ��yyyyMMddhhmmss
rem set yyyyMMdd_hhmmss=%yyyyMMdd%_%hhmmss%

rem ����t�@�C���쐬���@
rem break > hoge.txt

rem ���������� if���Z�q
rem ���������r
rem if �mnot�n������1==������2 ���R�}���h��
rem �������������Ƀ_�u���N�H�[�e�[�V�����ň͂��ƁA�_�u���N�H�[�e�[�V������������Ƃ��ĔF������Ă��܂�
rem AND/OR���������p�ł��Ȃ��̂ŁA����q�ŕ\�����邵������
set ifstr=hoge hoge
if "hoge hoge"=="%ifstr%" (
  echo if���Z�q �����������r true
) else (
  echo if���Z�q �����������r false
)

rem �����l��r
rem if ������1 �����Z�q�� ������2 ���R�}���h��
rem �uEQU�i�������j�v�uNEQ�i�������Ȃ��j�v�uLSS�i��菬�����j�v�uLEQ�i�ȉ��j�v�uGTR�i���傫���j�v�uGEQ�i�ȏ�j�v
set ifnum=1
if 1 EQU %ifnum% (
  echo if���Z�q ���l������r true
) else (
  echo if���Z�q ���l������r false
)

rem ���t�H���_/�t�@�C�����݊m�F
rem if �mnot�nexist ���p�X���� ���R�}���h��
rem ���t�@�C�����t�H���_���̋�ʂ͂ł��Ȃ�
set ifpath="c:\\"
rem set ifpath="c:\notfound"
if exist %ifpath% (
  echo if���Z�q �t�H���_/�t�@�C�����݊m�F true
) else (
  echo if���Z�q �t�H���_/�t�@�C�����݊m�F false
)

rem ���R�}���h�̃G���[���x�����o
rem if �mnot�nerrorlevel �����l�� ���R�}���h��
rem dir c:\
if errorlevel 0 (
  echo if���Z�q �G���[���x�����o 0
) else (
  echo if���Z�q �G���[���x�����o 0�ȊO
)

rem ���R�}���h�̃G���[���x�����o ���l��r
if %errorlevel% == 0 (
  echo if���Z�q �G���[���x�����o ���l��r 0
) else (
  echo if���Z�q �G���[���x�����o ���l��r 0�ȊO
)

rem ���J��Ԃ����� for��
rem for �i�I�v�V�����j %%�A���t�@�x�b�g�P���� in (���[�v�����̑Ώ�) do �R�}���h 

rem ���I�v�V������
rem (�I�v�V��������) �f�B���N�g������ΏۂɂƂ�
rem /d �f�B���N�g���i�t�H���_�j����ΏۂɂƂ�
rem /r �f�B���N�g�����y�т��̃T�u�f�B���N�g�����i���̃t�H���_�̒��̃t�@�C������t�H���_���j��ΏۂɂƂ�
rem /l �l���w�肵�đ������
rem /f �e�L�X�g�t�@�C�����̕��͂ɑ΂��ăg�[�N�������o���đ������

rem �����C���h�J�[�h��
rem ���[�v�����̑ΏۂɎw��ł��郏�C���h�J�[�h
rem * 1�����ȏ�
rem ? 1����

rem ���I�v�V������ �J�����g�f�B���N�g�����̃t�@�C����Ώ�
rem �J�����g�f�B���N�g������ [�Ώۃt�@�C��] ���J��Ԃ������̑Ώ�
for %%i in (*.bat) do (
  echo �t�@�C����:%%i
)

rem ���f�B���N�g�����Ώ�
for /d %%i in (*) do (
  echo �t�H���_��:%%i
)

rem ���w�肳�ꂽ�f�B���N�g�����ċA�I�Ɍ����A�f�B���N�g�����̃t�@�C�����Ώ�
for /r c:\work %%i in (*.txt) do (
  echo �t�@�C���p�X�i�t���p�X�j:%%i
)

rem ���w�肵���l�Ŏ��s����
rem for /l %%i in (�J�n�l�A�����A�I���l) do �R�}���h
for /l %%i in (1,2,10) do (
  echo %%i
)

rem ���g�[�N����������
rem for /f "�g�[�N���I�v�V����" %%i in (�����̑Ώ�) do �R�}���h
rem ���g�[�N���I�v�V�����ꗗ��
rem tokens= ���Ԗڂ̃g�[�N�����w�肷�邩�H
rem delims= �g�[�N���̋�؂蕶�����w��
rem eol= ���̕�������n�܂�s�𖳎�
rem skip= �擪����w�肳�ꂽ�s���A�X�L�b�v����B
rem usebackq �R�}���h�̏o�͂�Ώۂɂ���

rem [tokens] �X�y�[�X(�^�u)��؂��1�Ԗڂ�3�Ԗڂ��擾
for /f "tokens=1,3" %%i in (hogehoge.txt) do echo %%i %%j

rem [delims] �g�[�N���̋�؂蕶���� [:] �ɕύX�@�X�y�[�X�ƃ^�u�͋�؂蕶���Ƃ��Ĉ����Ȃ��Ȃ�
for /f "tokens=1,3 delims=:" %%i in (hogehoge.txt) do echo %%i %%j
rem ���X�y�[�X�ƃ^�u����؂蕶���ɂ������ꍇ�A:�̂��ƂɃX�y�[�X������
for /f "tokens=1,3 delims=: " %%i in (hogehoge.txt) do echo %%i %%j

rem eol�Ŏw�肵����������n�܂�s�𖳎�
for /f "tokens=1,3 eol=a" %%i in (hogehoge.txt) do echo %%i %%j
rem skip�Ŏw�肵���s�����擪���疳��
for /f "tokens=1,3 skip=2" %%i in (hogehoge.txt) do echo %%i %%j

rem �R�}���h�v�����v�g��Ŏg�p�ł���MSDOS�R�}���h�̏o�͂�ΏۂƂ���
for /f "usebackq tokens=1 delims==" %%i in (`set`) do echo %%i


echo ##### for�� �x�������������T���v��
set /a latenum=0
for /l %%i in (1,1,5) do (
  set /a latenum=latenum+1
  echo !latenum!
)

echo ##### �t�@�C���s���擾
rem for�����̃R�}���h�Ńp�C�v�𗘗p����ꍇ��^�ŃG�X�P�[�v����K�v����
set linefile=hogehoge.txt
rem type %linefile% | find /v /c "" > line.log
rem for /f "usebackq tokens=*" %%i IN (`type line.log`) DO @set line=%%i
for /f "usebackq tokens=*" %%i IN (`type %linefile% ^| find /v /c ""`) DO @set line_cnt=%%i
echo �t�@�C���s��: %line_cnt%

echo ##### �t�@�C�����l�[��

echo ##### �w��t�H���_�z���̃t�@�C�����l�[��

echo ##### �e���v�����ɂ�����΋L�ڂ��Ă���

echo ##### echo�ŋ�s���������ޕ��@
echo "echo�R�}���h�̂��Ƃ�.���X�y�[�X���J�����ɍ������ށi�L���Ȃ�Ȃ�ł��悢�j"
echo.
echo ��s��������
echo.


rem ************************************************************








rem �O���o�b�`�t�@�C���Ăяo��
rem ��call [�o�b�`�t�@�C����]�ŌĂяo�����Ɓicall�����Ȃ��Ə������{�t�@�C���ɖ߂炸�I�����Ă��܂��j
rem �O�����ʃt�@�C����

rem �T�u���[�`�����������ꍇ�̌Ăяo��
rem �K�؂ȃT�u���[�`�������`���Ď���
call :subroutine1

call :subroutine2

pause

rem ##################################################
rem #
rem # �G���h�Z�N�V����
rem #
rem ##################################################

rem �o�b�`�����I�����̕W���o�͂�K�v�ɉ����ė��p����
echo ������������������������������������������������������������
echo ��
echo ���@�o�b�`���� [END]
echo ��
echo ������������������������������������������������������������

rem �����I�ɕϐ���`�̏I����錾���܂��B
endlocal

rem �����I�����ɖ߂�l��Ԃ���悤�� [/b] ��t�^���ď������I�����܂��B
exit /b 
rem �W���u�X�P�W���[������̋N���Ȃǂ̏ꍇ�A�߂�l���w�肵�ď������I�������Ă��������B
rem exit /b 0




rem ##################################################
rem #
rem # �T�u���[�`���Z�N�V����
rem #
rem ##################################################

:subroutine1
rem [START] subroutine1 ------------------------------

rem �o�b�`�����L�q
exit /b 0

rem [ END ] subroutine1 ------------------------------


:subroutine2
rem [START] subroutine1 ------------------------------

rem �o�b�`�����L�q
exit /b 0

rem [ END ] subroutine1 ------------------------------


:logger
rem [START] logger ------------------------------
setlocal
rem ******************************************************************
rem * logger.bat: ���O�o�͏���
rem *
rem * [����]
rem *   ���߂�l��
rem *   �E�Ȃ�
rem * 
rem * [����]
rem *    %1: ���O�t�@�C����
rem *    %2: ���O���x��
rem *    %3: ���b�Z�[�W�e�L�X�g
rem * 
rem * [�o�[�W����]
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


