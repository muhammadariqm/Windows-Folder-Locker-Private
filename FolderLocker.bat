
@echo off
setlocal
title Folder Locker - Security Lab
color 0A

:: ==============================
:: CONFIGURATION
:: ==============================

set "PASSWORD=ARIQ123"
set "FOLDER=Private"
set "LOCKED=Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"

:: ==============================
:: CHECK FOLDER STATUS
:: ==============================

if exist "%LOCKED%" goto UNLOCK
if not exist "%FOLDER%" goto CREATE

goto MENU

:: ==============================
:: CREATE PRIVATE FOLDER
:: ==============================

:CREATE
mkdir "%FOLDER%"
echo.
echo [SUCCESS] Private folder created.
pause
goto MENU

:: ==============================
:: MAIN MENU
:: ==============================

:MENU
cls
echo ==================================
echo       FOLDER LOCKER
echo ==================================
echo.
echo [1] Lock Folder
echo [2] Exit
echo.
set /p "choice=Select option: "

if "%choice%"=="1" goto LOCK
if "%choice%"=="2" exit /b

echo Invalid choice!
pause
goto MENU

:: ==============================
:: LOCK FOLDER
:: ==============================

:LOCK
if not exist "%FOLDER%" (
    echo Folder not found!
    pause
    goto MENU
)

ren "%FOLDER%" "%LOCKED%"
attrib +h +s "%LOCKED%"

echo.
echo [SUCCESS] Folder locked.
pause
exit /b

:: ==============================
:: UNLOCK FOLDER
:: ==============================

:UNLOCK
cls
echo ==================================
echo          UNLOCK FOLDER
echo ==================================
echo.

set /p "PASS=Enter password: "

if not "%PASS%"=="%PASSWORD%" goto FAIL

attrib -h -s "%LOCKED%"
ren "%LOCKED%" "%FOLDER%"

echo.
echo [SUCCESS] Folder unlocked!
pause
exit /b

:: ==============================
:: WRONG PASSWORD
:: ==============================

:FAIL
echo.
echo [ERROR] Invalid password!
pause
exit /b
