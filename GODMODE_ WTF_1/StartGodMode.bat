@echo off
title GODMODE LAUNCHER
color 0a
cls

:: 1. Stop any existing servers
taskkill /f /im node.exe >nul 2>&1
timeout /t 2 >nul

:: 2. Start backend (in visible window)
start "GODMODE BACKEND" cmd /k "cd /d "%~dp0" && node server.js"

:: 3. Start frontend (in visible window)
start "GODMODE FRONTEND" cmd /k "cd /d "%~dp0" && http-server -p 61453 --cors"

:: 4. Wait for servers to initialize
timeout /t 5 >nul

:: 5. Open browser
start "" "http://localhost:61453/launch.html"

:: 6. Keep this window open
echo LAUNCHER STARTED SUCCESSFULLY
echo - Backend running on port 3000
echo - Frontend running on port 61453
pause