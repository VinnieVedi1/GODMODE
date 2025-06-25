@echo off
title GODMODE DEBUGGER
color 0a
cls

:: Clear previous instances
echo STOPPING OLD SERVERS...
taskkill /f /im node.exe >nul 2>&1
timeout /t 3

:: Start backend with logging
echo STARTING BACKEND...
start "GODMODE BACKEND" cmd /k "cd /d "%~dp0" && echo LAUNCHING SERVER... && node server.js || (echo SERVER CRASHED! && pause)"

:: Start frontend with logging
echo STARTING FRONTEND...
start "GODMODE FRONTEND" cmd /k "cd /d "%~dp0" && echo LAUNCHING HTTP-SERVER... && http-server -p 61453 --cors || (echo HTTP-SERVER FAILED! && pause)"

:: Wait and open browser
timeout /t 10
echo OPENING BROWSER...
start "" "http://127.0.0.1:61453/launch.html"

echo.
echo TROUBLESHOOTING:
echo 1. Two CMD windows should stay open
echo 2. Browser should open automatically
echo 3. If not, manually try: http://localhost:61453/launch.html
pause