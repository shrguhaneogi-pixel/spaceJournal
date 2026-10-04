@echo off
netstat -o -n -a | findstr /C:":11434 " >nul 2>&1
if %ERRORLEVEL% neq 0 (
    start /min "" ollama serve
    timeout /t 3 /nobreak >nul 2>&1
)
streamlit run app.py
