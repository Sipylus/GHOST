@ECHO OFF && COLOR 0A && TITLE GHOST v2024.06

:SELECT
CLS

ECHO ---------------------------------------------------------------
ECHO          GHOST v2024.06 - Getting Here Once Saves Time
ECHO ---------------------------------------------------------------
ECHO.
ECHO    Please make sure that you are connected to the Internet.
ECHO.
ECHO     Looking for older instances of Office in the Control Panel
ECHO             If found, the installation will fail.
ECHO.
ECHO ---------------------------------------------------------------
ECHO    Copyright (c) 2013-%DATE:~6,4% Stephan Pringle. All rights reserved.
ECHO                Licensed to Essex County College
ECHO ---------------------------------------------------------------
ECHO.
ECHO  1. Acro Software CutePDF
ECHO  2. Adobe Reader DC
ECHO  3. Cisco AnyConnect
ECHO  4. Google Chrome
ECHO  5. Microsoft .NET Framework
ECHO  6. Mozilla Firefox
ECHO  7. Notepad^++
ECHO  8. Opera Browser
ECHO  9. Oracle Java 6 ^& 7
ECHO 10. RSA SurePDF
ECHO 11. VideoLAN VLC media player
ECHO 12. Zoom Client for Meetings
ECHO 13. Microsoft Office 2019/2021/365
ECHO. 
ECHO 20. All Options
ECHO  0. Quit
ECHO.
SET /p ChoosedLanguage=Enter a number and press ENTER key or 0 to quit: 

IF %ChoosedLanguage% == 0 GOTO E
IF %ChoosedLanguage% GEQ 1 IF %ChoosedLanguage% LEQ 187 GOTO %ChoosedLanguage%

GOTO SELECT

:1
"Apps\CuteWriter.exe"&GOTO DONE
:2
"Apps\readerdc.exe"&GOTO DONE
:3
"Apps\anyconnect.msi"&GOTO DONE
:4
"Apps\ChromeSetup.exe"&GOTO DONE
:5
"Apps\dotnetfx35.exe"&REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP"&GOTO DONE
:6
"Apps\Firefox Installer.exe"&GOTO DONE
:7
"Apps\npp.exe"&GOTO DONE
:8
"Apps\OperaSetup.exe"&GOTO DONE
:9
"Apps\jre-6u25-windows-i586-s.exe"&"jre-7-windows-x64.exe"&GOTO DONE
:10
"Apps\essex_SurePDF.msi"&GOTO DONE
:11
"Apps\vlc-3.0.20-win64.exe"&GOTO DONE
:12
"Apps\ZoomInstallerFull.exe"&GOTO DONE
:13
"MOPPI.cmd"&GOTO DONE
:20
"Apps\Essex.cmd"&PAUSE&GOTO DONE

:DONE
GOTO SELECT
:E
