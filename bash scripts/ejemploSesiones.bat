@ECHO OFF
setlocal EnableDelayedExpansion

echo.
SET /P host_name="HostName: "
echo Puerto para probar: 
echo.
set num=0
:Loop
set /a num=num+1
SET /P mwa_port%num%=""
if "!mwa_port%num%!"=="" (goto Start)
goto Loop
:Start
set /a num=num-1
for /L %%i in (1,1,%num%) do (
 echo Probando con !mwa_port%%i! de %host_name%
 start /min "" "C:\Windows\System32\telnet.exe" %host_name% !mwa_port%%i!
 echo Respuesta de %host_name% : %errorlevel%
 IF %ERRORLEVEL% NEQ 0 Echo Se encontro un error
    IF %ERRORLEVEL% EQU 0 Echo No ocurrieron errores
)
:End
endlocal
echo.
SET /P leave="presiona cualquier tecla..."