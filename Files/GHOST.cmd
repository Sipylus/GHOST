@ECHO OFF && COLOR 0A && TITLE GHOST v2025.07

:: Get current year reliably using PowerShell
FOR /F %%i IN ('powershell -NoProfile -Command "Get-Date -Format yyyy"') DO SET Year=%%i

:SELECT
CLS

ECHO ---------------------------------------------------------------
ECHO          GHOST v2025.07 - Getting Here Once Saves Time
ECHO ---------------------------------------------------------------
ECHO.
ECHO    Please make sure that you are connected to the Internet.
ECHO.
ECHO ---------------------------------------------------------------
ECHO    Copyright (c) 2013-%Year% Stephan Pringle. All rights reserved.
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
"Apps\CuteWriter.exe"
GOTO DONE

:2
"Apps\readerdc.exe"
GOTO DONE

:3
"Apps\anyconnect.msi"
GOTO DONE

:4
"Apps\ChromeSetup.exe"
GOTO DONE

:5
"Apps\dotnetfx35.exe"
REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP"
GOTO DONE

:6
"Apps\Firefox Installer.exe"
GOTO DONE

:7
"Apps\npp.exe"
GOTO DONE

:8
"Apps\OperaSetup.exe"
GOTO DONE

:9
"Apps\jre-6u25-windows-i586-s.exe"
"Apps\jre-7-windows-x64.exe"
GOTO DONE

:10
"Apps\essex_SurePDF.msi"
GOTO DONE

:11
"Apps\vlc-3.0.20-win64.exe"
GOTO DONE

:12
"Apps\ZoomInstallerFull.exe"
GOTO DONE

:13
CALL MOPPI.cmd
GOTO DONE

:13
CALL MOPPI.cmd
GOTO DONE

:20
CALL :1 & CALL :2 & CALL :3 & CALL :4 & CALL :5 & CALL :6 & CALL :7 & CALL :8 & CALL :9 & CALL :10 & CALL :11 & CALL :12
PAUSE
GOTO DONE

:DONE
GOTO SELECT
:E
