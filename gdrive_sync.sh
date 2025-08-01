#!/bin/bash

# Google Drive Sync Script for Obsidian Vault
# This script syncs your vault with Google Drive

VAULT_PATH="/home/vignesh/Documents/Obsidian Vault"
GDRIVE_REMOTE="gdrive:Obsidian-Vault"  # Change after rclone config

echo "🌐 Starting Google Drive sync..."

# Check if rclone is configured
if ! rclone listremotes | grep -q "gdrive:"; then
    echo "❌ Google Drive not configured yet!"
    echo "Please run: rclone config"
    echo "Then set up Google Drive remote named 'gdrive'"
    exit 1
fi

cd "$VAULT_PATH"

# Sync UP (PC → Google Drive)
echo "📤 Uploading changes to Google Drive..."
rclone sync . "$GDRIVE_REMOTE" \
    --exclude ".git/**" \
    --exclude "*.tmp" \
    --exclude "*.temp" \
    --exclude ".obsidian/workspace*" \
    --exclude ".obsidian/cache/**" \
    --progress

# Sync DOWN (Google Drive → PC)
echo "📥 Downloading changes from Google Drive..."
rclone sync "$GDRIVE_REMOTE" . \
    --exclude ".git/**" \
    --exclude "*.tmp" \
    --exclude "*.temp" \
    --exclude ".obsidian/workspace*" \
    --exclude ".obsidian/cache/**" \
    --progress

echo "✅ Google Drive sync completed!"

# Also commit to git for backup
if [ -d ".git" ]; then
    echo "💾 Creating git backup..."
    git add .
    if ! git diff --staged --quiet; then
        TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
        git commit -m "Auto backup: $TIMESTAMP"
    fi
fi
