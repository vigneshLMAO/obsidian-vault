# Syncthing Setup for Obsidian (Alternative Method)

## 🔄 What is Syncthing?
Syncthing is a free, peer-to-peer file synchronization tool that works without cloud services. Perfect for keeping your Obsidian vault in sync between devices!

## 🚀 Quick Setup

### 1. Start Syncthing Service
```bash
# Enable and start syncthing for your user
systemctl --user enable syncthing
systemctl --user start syncthing
```

### 2. Access Web Interface
1. Open your browser and go to: http://localhost:8384
2. You'll see the Syncthing web interface

### 3. Add Your Obsidian Vault Folder
1. Click "Add Folder" in the web interface
2. Set **Folder Path**: `/home/vignesh/Documents/Obsidian Vault`
3. Set **Folder ID**: `obsidian-vault` (or any unique name)
4. Click "Save"

### 4. Set Up Your Phone

#### For Android:
1. Install "Syncthing" app from Google Play Store (free)
2. Open the app and let it start
3. In the app, tap "+" → "Add Folder"
4. Choose a folder on your phone for Obsidian (e.g., `/storage/emulated/0/Obsidian`)
5. Set the same Folder ID: `obsidian-vault`

#### For iOS:
1. Install "Möbius Sync" or "Syncthing-iOS" from App Store
2. Follow similar setup process

### 5. Connect Devices
1. On your PC's Syncthing web interface (http://localhost:8384):
   - Click "Add Remote Device"
   - Get the device ID from your phone's Syncthing app
   - Enter it and click "Save"

2. On your phone:
   - Add your PC as a remote device using the PC's device ID
   - Accept the folder sharing request

## 📱 Phone Obsidian Setup
1. Install Obsidian on your phone
2. When opening Obsidian, choose "Open folder as vault"
3. Select the folder that Syncthing is syncing to
4. Your vault will now sync automatically!

## ⚡ Auto-Start Setup
To make Syncthing start automatically:

```bash
# Check if it's running
systemctl --user status syncthing

# Check auto-start on boot
systemctl --user is-enabled syncthing
```

## 🛠️ Troubleshooting

### Check Syncthing Status:
```bash
systemctl --user status syncthing
```

### View Syncthing Logs:
```bash
journalctl --user -u syncthing
```

### Restart Syncthing:
```bash
systemctl --user restart syncthing
```

## 🔒 Security Notes
- Syncthing uses TLS encryption
- Direct device-to-device sync (no cloud)
- Your data never leaves your devices
- Perfect for privacy-conscious users!

## 🌟 Advantages of Syncthing
- ✅ Completely free
- ✅ No cloud dependency
- ✅ Works offline (syncs when devices are on same network)
- ✅ Very reliable
- ✅ Works with any file types
- ✅ No storage limits
