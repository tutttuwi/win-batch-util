@setlocal
@echo off

rem ******************************************************************
rem * FileExists.bat: �w�肳�ꂽ�p�X���t�@�C���ł��邩���؂���
rem *
rem * [����]
rem *   ���߂�l��
rem *   �E�t�@�C���̏ꍇ�A0��Ԃ�
rem *   �E�t�@�C���ȊO�̏ꍇ�A1��Ԃ�
rem * 
rem * [����]
rem *   %1: �t�@�C���p�X
rem * 
rem * [�o�[�W����]
rem *   1.0.0
rem ******************************************************************
rem echo FileExists.bat %1

set FILE_PATH=%1

rem NULL�̏ꍇ�A1��Ԃ�
if not defined FILE_PATH (
    rem echo FileExists.bat NULL
    rem echo %FILE_PATH%
    pause
    endlocal
    exit /b 1
)

rem �t�@�C�������݂��Ȃ��ꍇ�A1��Ԃ�
if not exist %FILE_PATH% (
    rem echo FileExists.bat NOT FOUND
    rem echo %FILE_PATH%
    pause
    endlocal
    exit /b 1
)

endlocal
exit /b 0