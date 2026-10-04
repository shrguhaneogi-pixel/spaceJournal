#!/usr/bin/env bash

# Check if port 11434 is in use
if ! curl -s http://localhost:11434/ >/dev/null 2>&1 && ! lsof -i :11434 >/dev/null 2>&1 && ! nc -z localhost 11434 >/dev/null 2>&1; then
    ollama serve >/dev/null 2>&1 &
    sleep 3
fi

streamlit run app.py
