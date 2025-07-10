@ECHO OFF
COLOR 1F
TITLE MOPPI v2025.06

:: Get current year reliably using PowerShell
FOR /F %%i IN ('powershell -NoProfile -Command "Get-Date -Format yyyy"') DO SET Year=%%i

:SELECT
CLS

ECHO ---------------------------------------------------------------
ECHO    M.O.P.P.I. - Microsoft Office Professional Plus Installer
ECHO ---------------------------------------------------------------
ECHO.
ECHO    Please make sure that you are connected to the Internet.
ECHO.
ECHO     Looking for older instances of Office in the Control Panel
ECHO               If found, the install will fail.
ECHO.
ECHO ---------------------------------------------------------------
ECHO    Copyright (c) 2013-%Year% Stephan Pringle. All rights reserved.
ECHO                Licensed to Essex County College
ECHO ---------------------------------------------------------------
ECHO.
ECHO  Install:
ECHO  1. Microsoft Office Professional Plus 2019
ECHO  2. Microsoft Office Professional Plus 2019 ^+ Projects ^& Visio
ECHO  3. Microsoft Office LTSC Professional Plus 2021
ECHO  4. Microsoft Office LTSC Professional Plus 2021 ^+ Projects ^& Visio
ECHO  5. Microsoft Office LTSC Professional Plus 2024
ECHO  6. Microsoft Office LTSC Professional Plus 2024 ^+ Projects ^& Visio
ECHO  7. Microsoft Office 365
ECHO.
ECHO 10. Office Removal Tool (The system will reboot)
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

:: Check valid range (1-7, or 10)
IF "%ChoosedLanguage%"=="10" GOTO %ChoosedLanguage%
IF %ChoosedLanguage% GEQ 1 IF %ChoosedLanguage% LEQ 7 GOTO %ChoosedLanguage%

ECHO Invalid selection. Please enter a valid option.
TIMEOUT /T 2 >NUL
GOTO SELECT

:1
ECHO Installing Office 2019...
"Office\2019.exe" /configure "Configuration\2019.xml"
GOTO DONE

:2
ECHO Installing Office 2019 + Projects & Visio...
"Office\2019.exe" /configure "Configuration\2019plus.xml"
GOTO DONE

:3
ECHO Installing Office 2021...
"Office\2021.exe" /configure "Configuration\2021.xml"
GOTO DONE

:4
ECHO Installing Office 2021 + Projects & Visio...
"Office\2021.exe" /configure "Configuration\2021plus.xml"
GOTO DONE

:5
ECHO Installing Office 2024...
"Office\2024.exe" /configure "Configuration\2024.xml"
GOTO DONE

:6
ECHO Installing Office 2024 + Projects & Visio...
"Office\2024.exe" /configure "Configuration\2024plus.xml"
GOTO DONE

:7
ECHO Installing Office 365...
"Office\365.exe"
GOTO DONE

:10
ECHO Running Office Removal Tool...
"Office\SetupProd_OffScrub.exe"
GOTO DONE

:DONE
ECHO Returning to menu...
TIMEOUT /T 3 >NUL
GOTO SELECT

:E
ECHO Exiting...
EXIT
