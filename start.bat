@echo off
echo Starting your dev environment (frontend, backend, database)...
docker compose up -d --build

echo Waiting for servers to come online...
timeout /t 8 /nobreak >nul

echo Opening frontend and backend in your browser...
start http://localhost:5173
start http://localhost:8000

echo.
echo All set. Containers are running in the background.
echo To stop everything later, double-click stop.bat
pause
