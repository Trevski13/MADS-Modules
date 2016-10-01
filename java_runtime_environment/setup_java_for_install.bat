@echo off
set filepath=%~dp0
echo Please download the newest version of java
echo by clicking the link in the folder
echo.
echo or, go here: http://java.com/en/download/manual.jsp
echo.
echo once downloaded, continue
pause

echo.
echo.
echo Please run the download but do NOT click install
echo once you have done this continue
pause

rem cd /d %appdata%\..\LocalLow\Sun\Java\
cd /d %appdata%\..\LocalLow\Oracle\Java\
FOR /F "delims=|" %%I IN ('DIR "jre*" /B /A:D /O:D') DO SET NewestFolder=%%I
echo %NewestFolder%
cd %NewestFolder%

FOR /F "delims=|" %%I IN ('DIR "*jre*.msi" /B /O:D') DO SET NewestFile=%%I
echo %NewestFile%

echo Control-C if these are not the correct files
pause
echo -----------
del /q "%filepath%data1.cab"
del /q "%filepath%%NewestFile%"
echo -----------
echo ^^ignore any errors above^^


copy "%NewestFile%" "%filepath%%NewestFile%"
copy "data1.cab" "%filepath%data1.cab"

echo done
echo.
echo you may now exit the java installer
pause
exit