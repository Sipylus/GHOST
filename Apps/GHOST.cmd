@ECHO OFF
COLOR 0A
TITLE GHOST v2025.07

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

SET /P ChoosedLanguage=Enter a number and press ENTER key or 0 to quit: 

:: Validate numeric input
SETLOCAL ENABLEDELAYEDEXPANSION
SET /A Dummy=%ChoosedLanguage% >NUL 2>&1
IF ERRORLEVEL 1 (
    ENDLOCAL
    ECHO Invalid selection. Please enter a valid number.
    TIMEOUT /T 2 >NUL
    GOTO SELECT
)
ENDLOCAL

IF "%ChoosedLanguage%"=="0" GOTO E

:: Check valid range for individual options or all options (20)
IF "%ChoosedLanguage%"=="20" GOTO 20
IF %ChoosedLanguage% GEQ 1 IF %ChoosedLanguage% LEQ 13 GOTO %ChoosedLanguage%

ECHO Invalid selection. Please enter a valid option.
TIMEOUT /T 2 >NUL
GOTO SELECT

:1
ECHO Launching CutePDF...
"Apps\CuteWriter.exe"
GOTO DONE

:2
ECHO Launching Adobe Reader DC...
"Apps\readerdc.exe"
GOTO DONE

:3
ECHO Launching Cisco AnyConnect Installer...
"Apps\anyconnect.msi"
GOTO DONE

:4
ECHO Launching Google Chrome Installer...
"Apps\ChromeSetup.exe"
GOTO DONE

:5
ECHO Launching Microsoft .NET Framework Installer...
"Apps\dotnetfx35.exe"
REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP"
GOTO DONE

:6
ECHO Launching Mozilla Firefox Installer...
"Apps\Firefox Installer.exe"
GOTO DONE

:7
ECHO Launching Notepad++...
"Apps\npp.exe"
GOTO DONE

:8
ECHO Launching Opera Browser Installer...
"Apps\OperaSetup.exe"
GOTO DONE

:9
ECHO Launching Oracle Java 6 ^& 7 Installers...
"Apps\jre-6u25-windows-i586-s.exe"
"Apps\jre-7-windows-x64.exe"
GOTO DONE

:10
ECHO Launching RSA SurePDF Installer...
"Apps\essex_SurePDF.msi"
GOTO DONE

:11
ECHO Launching VLC Media Player Installer...
"Apps\vlc.exe"
GOTO DONE

:12
ECHO Launching Zoom Client Installer...
"Apps\ZoomInstallerFull.exe"
GOTO DONE

:13
ECHO Launching Microsoft Office Installer (MOPPI)...
CALL MOPPI.cmd
GOTO DONE

:20
ECHO Running all installers in sequence...
CALL :1
CALL :2
CALL :3
CALL :4
CALL :5
CALL :6
CALL :7
CALL :8
CALL :9
CALL :10
CALL :11
CALL :12
GOTO 13
PAUSE
GOTO DONE

:DONE
ECHO.
ECHO Returning to main menu...
TIMEOUT /T 3 >NUL
GOTO SELECT

:E
ECHO Exiting...
EXIT
