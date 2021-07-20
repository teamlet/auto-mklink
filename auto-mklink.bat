@echo off
:: creator:teamlet
:: date:2021-07-20
::  
:: You should change this value for your folders first 
::===================================================================
set destFolder=D:/dev-envs

:: You should change this value to fit your computer's enviroments 
::===================================================================
SET objLength=6
SET Obj[0]=.gradle\
SET Obj[1]=go\
SET Obj[2]=.android\
SET Obj[3]=.m2\
SET Obj[4]=.vscode\
SET Obj[5]=.rustup\

::==================================================================

cd %HOMEPATH%
set objIndex=0

:loopStart

if %objIndex% equ %objLength% goto end

set objCurrent=.rustup

for /f "usebackq delims== tokens=1-2" %%i in (`set obj[%objIndex%]`) do (
    set objCurrent=%%j
)

echo Current directory : "%CD%\%objCurrent%"

xcopy /s /e /q "%CD%\%objCurrent%" "%destFolder%/%objCurrent%"
rd /s /q "%CD%\%objCurrent%"
mklink /j "%CD%\%objCurrent%" "%destFolder%/%objCurrent%"

set /a objIndex=%objIndex% + 1

goto loopStart

:end

echo Done!

pause>nul
