#!/usr/bin/env bash

# Check for changes in repo
if [ -n "$(git status --porcelain app.py requirements.txt README.md .gitignore start_journal.sh start_journal.bat sync_codebase.sh sync_codebase.bat 2>/dev/null)" ]; then
    git add -u
    git add app.py requirements.txt README.md .gitignore start_journal.sh start_journal.bat sync_codebase.sh sync_codebase.bat 2>/dev/null
    DATE_STR=$(date +%Y-%m-%d)
    git commit -m "chore: automated infrastructure sync [${DATE_STR}]"
    git push origin main
fi
