@echo off
:: creator:teamlet
:: date:2021-07-20

::===================================================================
:: 第一处修改：修改目标文件夹路径，结尾不要加斜杠。
set destFolder=D:/dev-envs

if not exist %destFolder% md %destFolder%

::===================================================================
:: 第二处修改：根据实际情况修改数组长度和移动的文件夹名称，结尾需要加斜杠。
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

set CURRENT_FOLDER="%CD%\%objCurrent%"
echo Current directory ==> %CURRENT_FOLDER%

if exist "%CURRENT_FOLDER%"{
    xcopy /s /e /q "%CURRENT_FOLDER%" "%destFolder%/%objCurrent%"
    rd /s /q "%CURRENT_FOLDER%"
    mklink /j "%CURRENT_FOLDER%" "%destFolder%/%objCurrent%"
} else{
    echo Current directory --> %CURRENT_FOLDER% is not exist !
}


set /a objIndex=%objIndex% + 1

goto loopStart

:end

echo Done!

pause>nul
