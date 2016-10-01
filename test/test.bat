@echo off

echo Running Tests...
echo.

setlocal
rem Initialization
rem check if we have s_which
rem echo s_which test
start "" /wait cmd /c s_which s_which.bat ^&^& exit 0 ^|^| exit 1
if ERRORLEVEL 1 (
	echo FAIL: s_which not found
) else (
	echo PASS: s_which found
	
)
cls

rem check for batch tester
call s_which mod_SelfTest.bat
if not "%_path%" == "" (
	call mod_SelfTest %0
) else (
	echo Initialization failed because modSelfTest wasn't found
	pause
	exit 1
)