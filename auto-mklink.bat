@echo off
:: creator:teamlet
:: date:2021-07-20
:: version 1.0.2
::===================================================================
set destFolder=D:/dev-envs

::===================================================================
SET objLength=8
SET Obj[0]=.android\
SET Obj[1]=.cargo\
SET Obj[2]=.gradle\
SET Obj[3]=.m2\
SET Obj[4]=.rustup\
SET Obj[5]=.vscode\
SET Obj[6]=go\
:: visual studio folder
SET Obj[7]=source\

::==================================================================
if not exist "%destFolder%" (
     md "%destFolder%"
     echo "mkdir %destFolder%"
)

cd %HOMEPATH%
set objIndex=0

:loopStart

if %objIndex% equ %objLength% goto end

set objCurrent=0

for /f "usebackq delims== tokens=1-2" %%i in (`set obj[%objIndex%]`) do (
    set objCurrent=%%j
)
echo "Current directory ==> %CD%/%objCurrent%"

if exist "%CD%/%objCurrent%" (
    if not exist "%destFolder%/%objCurrent%" (
        xcopy /s /e /q "%CD%/%objCurrent%" "%destFolder%/%objCurrent%"
        rd /s /q "%CD%/%objCurrent%"
        mklink /j "%CD%/%objCurrent%" "%destFolder%/%objCurrent%"
    ) else (
        echo "Target directory --> %destFolder%/%objCurrent% is exist !"
    )
) else (
    echo "Current directory --> %CD%/%objCurrent% is not exist !"
)


set /a objIndex=%objIndex% + 1

goto loopStart

:end

echo Done!

pause>nul
