@echo off
setlocal

rem ******************************************************************
rem * LOGGER.bat: ���O�o�͏���
rem *
rem * [����]
rem *   ���߂�l��
rem *   �E�Ȃ�
rem * 
rem * [����]
rem *    %1: ���O���x��
rem *    %2: ���b�Z�[�W�e�L�X�g
rem * 
rem * [�o�[�W����]
rem *   1.0.0
rem ******************************************************************
rem call LOGGER [INFO|ERROR|WARN] ["MESSAGE TEXT"]

set "FILE_NAME=batch"
set "LL=%0"
set "MSG=%~2"
set D=%DATE%
set T=%TIME:~0,8%
set T=%T: =0%
set "DATE_STR=%date:~0,4%%date:~5,2%%date:~8,2%"
set "CURRENT_DIR=%~dp0"
set "LOG_FILE=%CURRENT_DIR%%DATE_STR%_%FILE_NAME%.log"

echo %D% %T% %LL% %MSG%
echo %D% %T% %LL% %MSG% >> %LOG_FILE%

endlocal
