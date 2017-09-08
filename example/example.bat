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
call mod_tee "This is the Test script"
call mod_newline
call mod_echo "This text is only showed live"
call mod_log "This text is only showed in the log"
call mod_tee "this text is showed both live and in the log"
call mod_pause
call mod_newline
call mod_make_directory /directory "%temp%\testdir"
call mod_newline
call mod_make_directory /directory "%temp%\testdir"
call mod_newline
call mod_delete /directory %temp%\testdir\ /file file that doesn't exist.txt /name file that doesn't exist
echo hello > "%temp%\testdir\file that does exist.txt"
call mod_newline
call mod_delete /directory %temp%\testdir\ /file file that does exist.txt /name file that does exist
call mod_newline
call mod_rmdir /folder %temp%\testdir\
call mod_pause Press any key (or not) to continue. . . (or not. . .)
call mod_msi_install /file "not-an-msi.msi" /name not-an-msi.msi /passive
call mod_msi_uninstall /file totally-not-a-guid /name not-a-guid /passive
call mod_echo Fast Spinner
for /l %%i in (1,1,100) do (
	call mod_spinner /speedhack
)
call mod_spinner /clear
call mod_echo Slow Spinner
for /l %%i in (1,1,100) do (
	call mod_spinner /inline /title
)
call mod_spinner /clear
rem End Script
call mod_footer
echo The Script did not terminate correctly
endlocal
exit 1
