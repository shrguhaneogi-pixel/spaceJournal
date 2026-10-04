# Offline Safe-Space Journal Analyzer

A privacy-first, 100% offline desktop application designed for safe, personal journal reflection using an open-weight model running entirely on your own machine.

---

## Quick Start (3 Easy Steps)

### Step 1: Install Ollama & Pull Model
1. Download and install [Ollama](https://ollama.com/) for your operating system.
2. Open your terminal / command prompt and download the local AI model:
   ```bash
   ollama pull gemma2:2b
   ```

### Step 2: Install Python Dependencies
Open your terminal in this directory and install the dependencies:
```bash
pip install -r requirements.txt
```

### Step 3: Launch the Application
Start the application with a single click or command:
- **Windows:** Double-click `start_journal.bat` (or run `start_journal.bat` in Command Prompt).
- **Mac / Linux:** Execute `./start_journal.sh` (run `chmod +x start_journal.sh` first if necessary).

---

## Automated Infrastructure Sync

To schedule daily background backups of application code changes (excluding all private user data):

### Windows (Task Scheduler)
Run this command in an Administrator Command Prompt (update directory path if needed):
```cmd
schtasks /create /tn "SafeSpaceJournalSync" /tr "%CD%\sync_codebase.bat" /sc daily /st 02:00
```

### Mac / Linux (Cron)
Add the following job to your crontab using `crontab -e` (runs daily at 2:00 AM):
```cron
0 2 * * * /bin/bash /path/to/spaceJournal/sync_codebase.sh
```

---

## Privacy Guarantee
All text analysis happens locally on your computer. No data is ever sent over the internet or to external cloud APIs.
