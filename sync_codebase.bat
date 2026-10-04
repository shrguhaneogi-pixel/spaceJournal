@echo off
setlocal EnableDelayedExpansion
set CHANGED=
for /f "tokens=*" %%i in ('git status --porcelain') do (
    set CHANGED=1
)

if defined CHANGED (
    for /f "usebackq tokens=*" %%a in (`powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"`) do set "DATE_STR=%%a"
    git add -u
    git add app.py requirements.txt README.md .gitignore start_journal.sh start_journal.bat sync_codebase.sh sync_codebase.bat 2>nul
    git commit -m "chore: automated infrastructure sync [!DATE_STR!]"
    git push origin main
)
