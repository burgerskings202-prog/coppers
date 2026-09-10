@echo off
title CopperS Buhgalt - build
echo.
echo ================================================
echo   Building CopperS Buhgalt desktop app
echo ================================================
echo.

where node >nul 2>nul
if errorlevel 1 (
    echo [ERROR] Node.js was not found on this computer.
    echo.
    echo Install it from https://nodejs.org (the LTS button),
    echo then run this file again.
    echo.
    pause
    exit /b 1
)

echo [1/3] Node.js found:
node -v
echo.

echo [2/3] Installing dependencies, this can take a few minutes...
call npm install
if errorlevel 1 (
    echo.
    echo [ERROR] npm install failed. Scroll up to see the error text.
    echo.
    pause
    exit /b 1
)
echo.

echo [3/3] Building the Windows installer...
call npm run build:win
if errorlevel 1 (
    echo.
    echo [ERROR] Build failed. Scroll up to see the error text.
    echo.
    pause
    exit /b 1
)

echo.
echo ================================================
echo   Done. Opening the "dist" folder with your .exe
echo ================================================
echo.
if exist dist (
    explorer dist
) else (
    echo [WARNING] dist folder was not created, something went wrong above.
)
pause
