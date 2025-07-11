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

:: Routing
IF "%ChoosedLanguage%"=="0" GOTO ExitApp
IF "%ChoosedLanguage%"=="1" GOTO InstallCutePDF
IF "%ChoosedLanguage%"=="2" GOTO InstallAdobeReader
IF "%ChoosedLanguage%"=="3" GOTO InstallCisco
IF "%ChoosedLanguage%"=="4" GOTO InstallChrome
IF "%ChoosedLanguage%"=="5" GOTO InstallDotNet
IF "%ChoosedLanguage%"=="6" GOTO InstallFirefox
IF "%ChoosedLanguage%"=="7" GOTO InstallNotepadPP
IF "%ChoosedLanguage%"=="8" GOTO InstallOpera
IF "%ChoosedLanguage%"=="9" GOTO InstallJava
IF "%ChoosedLanguage%"=="10" GOTO InstallSurePDF
IF "%ChoosedLanguage%"=="11" GOTO InstallVLC
IF "%ChoosedLanguage%"=="12" GOTO InstallZoom
IF "%ChoosedLanguage%"=="13" GOTO InstallOffice
IF "%ChoosedLanguage%"=="20" GOTO InstallAll

ECHO Invalid selection. Please enter a valid option.
TIMEOUT /T 2 >NUL
GOTO SELECT

:: Installers
:InstallCutePDF
ECHO Launching CutePDF...
"Apps\CuteWriter.exe"
GOTO Done

:InstallAdobeReader
ECHO Launching Adobe Reader DC...
"Apps\readerdc.exe"
GOTO Done

:InstallCisco
ECHO Launching Cisco AnyConnect Installer...
"Apps\anyconnect.msi"
GOTO Done

:InstallChrome
ECHO Launching Google Chrome Installer...
"Apps\ChromeSetup.exe"
GOTO Done

:InstallDotNet
ECHO Launching Microsoft .NET Framework Installer...
"Apps\dotnetfx35.exe"
REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP"
GOTO Done

:InstallFirefox
ECHO Launching Mozilla Firefox Installer...
"Apps\Firefox Installer.exe"
GOTO Done

:InstallNotepadPP
ECHO Launching Notepad++...
"Apps\npp.exe"
GOTO Done

:InstallOpera
ECHO Launching Opera Browser Installer...
"Apps\OperaSetup.exe"
GOTO Done

:InstallJava
ECHO Launching Oracle Java 6 & 7 Installers...
"Apps\jre-6u25-windows-i586-s.exe"
"Apps\jre-7-windows-x64.exe"
GOTO Done

:InstallSurePDF
ECHO Launching RSA SurePDF Installer...
"Apps\essex_SurePDF.msi"
GOTO Done

:InstallVLC
ECHO Launching VLC Media Player Installer...
"Apps\vlc.exe"
GOTO Done

:InstallZoom
ECHO Launching Zoom Client Installer...
"Apps\ZoomInstallerFull.exe"
GOTO Done

:InstallOffice
ECHO Launching Microsoft Office Installer (MOPPI)...
CALL MOPPI.cmd
GOTO Done

:InstallAll
ECHO Running all installers in sequence...
CALL :InstallCutePDF
CALL :InstallAdobeReader
CALL :InstallCisco
CALL :InstallChrome
CALL :InstallDotNet
CALL :InstallFirefox
CALL :InstallNotepadPP
CALL :InstallOpera
CALL :InstallJava
CALL :InstallSurePDF
CALL :InstallVLC
CALL :InstallZoom
CALL :InstallOffice
GOTO Done

:Done
ECHO.
ECHO Returning to main menu...
TIMEOUT /T 3 >NUL
GOTO SELECT

:ExitApp
ECHO Exiting GHOST...
TIMEOUT /T 1 >NUL
EXIT
