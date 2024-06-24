@ECHO OFF
SETLOCAL
PUSHD %~dp0
FOR /R %%G in (*.PDF *.TIF *.TIFF) DO (
 SET FileName=%%~nG
 SETLOCAL ENABLEDELAYEDEXPANSION
 FOR /l %%L IN (2048,-1,0) DO IF NOT DEFINED CH (
 SET CH=!FileName:~%%L,1!
 IF DEFINED CH SET /a CH=1+%%L & ECHO !FileName!: !CH! Characters
 )
 ENDLOCAL
)
POPD
ECHO:
ECHO Total Number of Characters: %Total%
REM Not yet sure where to put Set /a Total=%Total%+%CH%
ECHO:
PAUSE
GOTO :EOF
