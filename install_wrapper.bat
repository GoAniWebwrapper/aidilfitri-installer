:: Wrapper: Offline ^(Aidilfitri^) Installer
:: Author: octanuary#6596
:: benson made most of this shit since a lot of this was taken from the launcher
:: License: MIT
title Wrapper: Offline ^(Aidilfitri^) Installer [Initializing...]

::::::::::::::::::::
:: Initialization ::
::::::::::::::::::::

:: Stop commands from spamming stuff, cleans up the screen
@echo off && cls

:: Lets variables work or something idk im not a nerd
SETLOCAL ENABLEDELAYEDEXPANSION

:: Make sure we're starting in the correct folder, and that it worked (otherwise things would go horribly wrong)
pushd "%~dp0"

:: Check *again* because it seems like sometimes it doesn't go into dp0 the first time???
pushd "%~dp0"

::::::::::::::::::::::
:: Dependency Check ::
::::::::::::::::::::::

title Wrapper: Offline ^(Aidilfitri^) Installer [Checking for Git...]
echo Checking for Git installation...

:: Preload variables
set GIT_DETECTED=n

:: Git check
for /f "delims=" %%i in ('git --version 2^>nul') do set output=%%i
IF "!output!" EQU "" (
	echo Git could not be found.
) else (
	echo Git is installed.
	echo:
	set GIT_DETECTED=y
)
popd

::::::::::::::::::::::::
:: Dependency Install ::
::::::::::::::::::::::::

if !GIT_DETECTED!==n (
	title Wrapper: Offline ^(Aidilfitri^) Installer [Installing Git...]
	echo:
	echo Installing Git...
	echo:
	fsutil dirty query !systemdrive! >NUL 2>&1
	if /i not !ERRORLEVEL!==0 (
		color cf
		cls
		echo:
		echo ERROR
		echo:
		echo Wrapper: Offline ^(Aidilfitri^) needs to install Git.
		echo To do this, the installer must be started with Admin rights.
		echo:
		echo Close this window and re-open the installer as an Admin.
		echo ^(right-click install_wrapper_offline.bat and click "Run as Administrator"^)
		pause
		exit
		)
	)
)
:postadmincheck

if !GIT_DETECTED!==n (
	:: Install Git
	if not exist "git_installer.exe" (
		echo We have a problem. The Git installer doesn't exist.
		echo A normal copy of the Wrapper: Offline ^(Aidilfitri^) installer
		echo should come with one.
		echo You should be able to find a copy on this website:
		echo https://git-scm.com/downloads
		pause & exit
	)
	echo Proper Git installation doesn't seem possible to do automatically.
	echo You can just keep clicking next until it finishes,
	echo and the Revision installer will continue once it closes.
	git_installer.exe
	goto git_installed
	
	:git_installed
	echo Git has been installed.
	set GIT_DETECTED=y
)

:: Alert user to restart the installer without running as Admin
if !ADMINREQUIRED!==y (
	color 20
	cls
	echo:
	echo Wrapper: Offline ^(Aidilfitri^) no longer needs Admin rights,
	echo please restart normally by double-clicking.
	echo:
	pause
	exit
)

:::::::::::::::::::::::::
:: Post-Initialization ::
:::::::::::::::::::::::::

title Wrapper: Offline ^(Aidilfitri^) Installer
:cls
cls

echo:
echo Wrapper: Offline ^(Aidilfitri^) Installer
echo Project lead by octanuary
echo:
echo Enter 1 to install Wrapper: Offline ^(Aidilfitri^)
echo Enter 0 to close the installer
:wrapperidle
echo:

:::::::::::::
:: Choices ::
:::::::::::::

set /p CHOICE=Choice:
if "!choice!"=="0" goto exit
if "!choice!"=="1" goto download
:: funni options
if "!choice!"=="2" echo
if "!choice!"=="43" echo OH MY GOD. FOURTY THREE CHARS. NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO & goto wrapperidle
if "!choice!"=="69" echo nice & goto wrapperidle
if /i "!choice!"=="benson" echo watch benson on youtube & goto wrapperidle
if /i "!choice!"=="ford" echo what up son & goto wrapperidle
if /i "!choice!"=="no" echo stahp & goto wrapperidle
if /i "!choice!"=="yes" echo Alright. & goto wrapperidle
if /i "!choice!"=="fuck you" echo No, fuck you. & goto wrapperidle
if /i "!choice!"=="sex" echo that's fake & goto wrapperidle
if /i "!choice!"=="watch benson on youtube" goto w_a_t_c_h
if /i "!choice!"=="die" echo die please & goto wrapperidle
if /i "!choice!"=="spark" echo WHY DID SOMEONE FUCK UP THE LAUNCHER? & goto wrapperidle
if /i "!choice!"=="l33t" echo nice l33t video & goto wrapperidle
echo Time to choose. && goto wrapperidle

:download
cls
pushd "%~dp0..\"
echo Cloning repository from GitHub...
git clone https://github.com/goaniwebwrapper/wrapper-offline-aidilfitri.git
cls
echo Wrapper: Offline ^(Aidilfitri^) has been installed^^!
echo Feel free to move it wherever you want.
start "" "%~dp0..\wrapper-offline-aidilfitri"
pause & exit

:w_a_t_c_h
echo watch benson on youtube
echo watch benson on youtube
echo watch benson on youtube
echo watch benson on youtube
echo watch benson on youtube
echo wa
goto wrapperidle

:exit
pause & exit
