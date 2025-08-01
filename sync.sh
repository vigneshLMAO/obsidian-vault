#!/bin/bash

# Obsidian Vault Sync Script
# This script automatically commits and pushes changes to your remote repository

VAULT_PATH="/home/vignesh/Documents/Obsidian Vault"
cd "$VAULT_PATH"

echo "🔄 Starting Obsidian Vault sync..."

# Add all changes
git add .

# Check if there are any changes to commit
if git diff --staged --quiet; then
    echo "✅ No changes to sync"
    exit 0
fi

# Commit with timestamp
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
git commit -m "Auto sync: $TIMESTAMP"

# Pull any remote changes first
echo "📥 Pulling remote changes..."
git pull origin main --rebase

# Push changes
echo "📤 Pushing changes..."
git push origin main

echo "✅ Sync completed successfully!"
