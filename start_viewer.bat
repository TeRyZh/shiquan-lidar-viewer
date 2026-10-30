@echo off
REM Serves this folder locally and opens the fused LiDAR viewer in the default browser.
REM Needs Python 3 on PATH (Anaconda prompt works). Close this window to stop the server.
cd /d "%~dp0"
start "" http://localhost:8765/index.html
python -m http.server 8765
