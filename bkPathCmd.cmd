@echo off

set YMDHMS=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%
set path >"F:\backup\env\path_%YMDHMS%.txt"

exit