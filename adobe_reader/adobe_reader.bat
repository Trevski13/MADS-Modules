@echo off
setlocal
rem Initialization
rem check if we have s_which
set s_which=false
call s_which s_which.bat
cls
if %s_which%==false (
	echo Initialization failed because s_which wasn't found
	pause
	exit 1
)
rem check for batch tester
call s_which mod_SelfTest.bat
if not "%_path%" == "" (
	call mod_SelfTest %0
) else (
	echo Initialization failed because modSelfTest wasn't found
	pause
	exit 1
)
call mod_header %0 %*
rem Begin Script
call mod_tee Installing Adobe Reader
call mod_newline
call mod_run_newest /file "*Rdr*en_US.exe" /name Adobe Reader Installer /args:/sPB /args:/rs /args:/msi /args:/norestart /args "ALLUSERS=1 EULA_ACCEPT=YES" /args:/qn
call mod_newline
call mod_delete /directory "c:\Users\Public\Desktop\" /file "*Reader*.lnk" /name Adobe Reader Desktop Shortcuts
rem End Script
call mod_footer
echo The Script did not terminate correctly
endlocal
exit 1
