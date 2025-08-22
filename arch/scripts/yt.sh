#!/bin/bash

STATE_FILE="$HOME/.counter_state"

# Initialize state file if not exists
if [[ ! -f "$STATE_FILE" ]]; then
    echo "DATE=$(date +%Y-%m-%d)" > "$STATE_FILE"
    echo "COUNT=0" >> "$STATE_FILE"
fi

# Load state
source "$STATE_FILE"

# Input validation
if [[ "$1" != "0" && "$1" != "1" ]]; then
    echo "Usage: $0 [0|1]"
    exit 1
fi

if [[ "$1" == "1" ]]; then
    COUNT=$((COUNT + 1))
elif [[ "$1" == "0" ]]; then
    COUNT=0
    DATE=$(date +%Y-%m-%d)
fi

# Save new state
{
    echo "DATE=$DATE"
    echo "COUNT=$COUNT"
} > "$STATE_FILE"

echo "Date: $DATE | Count: $COUNT"
