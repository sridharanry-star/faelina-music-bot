@echo off
title Faelina Music Bot
color 0D
cd /d "%~dp0"

echo ========================================================
echo        🌸 FAELINA DISCORD MUSIC BOT LAUNCHER 🌸
echo ========================================================
echo.

:: Check Node.js installation
where node >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Node.js is not installed or not in PATH!
    echo Please download and install Node.js v18+ from https://nodejs.org
    echo.
    pause
    exit /b 1
)

:: Check if node_modules exists
if not exist "node_modules\" (
    echo [INFO] Installing required dependencies...
    call npm install
    if %ERRORLEVEL% neq 0 (
        echo [ERROR] Failed to install dependencies.
        pause
        exit /b 1
    )
)

:: Check if .env exists
if not exist ".env" (
    if exist ".env.example" (
        echo [WARN] .env not found! Copying .env.example to .env...
        copy ".env.example" ".env" >nul
        echo [INFO] Please edit .env with your Discord Bot TOKEN before starting.
        notepad .env
    )
)

echo [INFO] Launching Faelina Music Bot...
echo.
node index.js
if %ERRORLEVEL% neq 0 (
    echo.
    echo [CRASH] Bot process exited with code %ERRORLEVEL%.
    pause
)
