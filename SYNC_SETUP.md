# Obsidian Vault Sync Setup Guide

## ✅ What's Already Done

1. **Git Repository Initialized** - Your vault is now a Git repository
2. **Gitignore Created** - Excludes sensitive Obsidian files
3. **Sync Script Created** - `sync.sh` for easy syncing

## 🚀 Next Steps (Do These Now)

### 1. Create a GitHub Repository

1. Go to [GitHub.com](https://github.com) and sign in (create account if needed - it's free!)
2. Click the "+" icon → "New repository"
3. Repository name: `obsidian-vault` (or any name you prefer)
4. Make it **PRIVATE** (important for your personal notes)
5. Don't initialize with README (we already have files)
6. Click "Create repository"

### 2. Connect Your Local Repository

After creating the GitHub repo, run these commands in your terminal:

```bash
cd "/home/vignesh/Documents/Obsidian Vault"

# Replace YOUR_USERNAME with your GitHub username
git remote add origin https://github.com/YOUR_USERNAME/obsidian-vault.git

# Rename main branch to 'main' (GitHub standard)
git branch -M main

# Push your initial commit
git push -u origin main
```

### 3. Set Up Authentication

For easier syncing, set up GitHub authentication:

```bash
# Install GitHub CLI (if mirrors are working)
sudo pacman -S github-cli

# Or set up personal access token
# Go to GitHub → Settings → Developer settings → Personal access tokens
# Create a token with 'repo' permissions
```

## 📱 Phone Setup

### Option 1: Obsidian Git Plugin (Recommended)
1. Install Obsidian on your phone
2. Install the "Obsidian Git" plugin
3. Clone your repository in Obsidian mobile
4. Enable auto-sync in plugin settings

### Option 2: Git Client Apps
- **Android**: Termux + git, or MGit
- **iOS**: Working Copy app

## 🔄 Daily Usage

### On PC:
```bash
# Quick sync (run this regularly)
cd "/home/vignesh/Documents/Obsidian Vault"
./sync.sh
```

### Auto-sync Setup (Optional):
Add to your crontab for automatic syncing every 30 minutes:
```bash
# Edit crontab
crontab -e

# Add this line:
*/30 * * * * cd "/home/vignesh/Documents/Obsidian Vault" && ./sync.sh
```

## 🛠️ Alternative Free Sync Options

If GitHub seems complex, consider:

1. **Syncthing** - P2P file sync (install: `sudo pacman -S syncthing`)
2. **Nextcloud** - Self-hosted cloud (free with your own server)
3. **Dropbox/Google Drive** - Free tiers available

## 🔧 Troubleshooting

- **Merge conflicts**: Use `git status` and resolve manually
- **Authentication issues**: Set up SSH keys or personal access tokens
- **Sync script fails**: Check internet connection and repository permissions

## 📞 Need Help?

Run any of these commands if you need help:
- `git status` - Check repository status
- `git log --oneline` - See commit history
- `./sync.sh` - Run sync manually
