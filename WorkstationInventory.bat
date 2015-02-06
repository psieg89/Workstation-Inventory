@echo off


FOR /F "usebackq" %%i IN (`hostname`) DO SET STATION=%%i


FOR /F "tokens=2 delims==" %%A IN ('WMIC csproduct GET Name /VALUE ^| FIND /I "Name="') DO SET model=%%A


for /F "skip=2 tokens=2 delims=," %%A in ('wmic systemenclosure get serialnumber /FORMAT:csv') do (set "serial=%%A")


for /f "tokens=3 delims=\" %%i in ("%USERPROFILE%") do (set user=%%i) 2>&1


set mydate=%date:~4,2%/%date:~7,2%/%date:~10,4%   %time:~0,2%:%time:~3,2%:%time:~6,2%


find /v /i "%serial%" < "Serial Numbers".csv > 2.txt
copy 2.txt "Serial Numbers".csv >NUL & del 2.txt >NUL


echo %STATION%, %serial%, %model%, %mydate%, %user%  >> "Serial Numbers".csv