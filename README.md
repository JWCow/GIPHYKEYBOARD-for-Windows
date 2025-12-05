# GIPHY Keyboard for Windows

A modern, sleek GIPHY client for Windows that makes it easy to search, save, and use GIFs. Now supports both AutoHotkey v1 and v2!

<div align="center">

[![Version](https://img.shields.io/badge/version-1.0.11-blue.svg)](https://github.com/JWCow/GIPHYKEYBOARD-for-Windows/releases)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Windows](https://img.shields.io/badge/platform-Windows-lightgrey.svg)](https://github.com/JWCow/GIPHYKEYBOARD-for-Windows)
[![AutoHotkey](https://img.shields.io/badge/AutoHotkey-v1%20%7C%20v2-red.svg)](https://www.autohotkey.com/)

> 🚀 A lightning-fast GIPHY search tool that lives in your keyboard shortcuts. Find, save, and share GIFs instantly without leaving your current window.

<table>
<tr>
<td width="25%">

### 🔍 Explore
![Explore Tab](screenshots/explore.png)
*Search millions of GIFs instantly*

</td>
<td width="25%">

### ✨ Trending
![Trending Tab](screenshots/trending.png)
*Discover trending GIFs and reactions*

</td>
<td width="25%">

### ❤️ Favorites
![Favorites Tab](screenshots/favorites.png)
*Save your most-loved GIFs*

</td>
<td width="25%">

### ⭐ Collection
![Collection Tab](screenshots/collection.png)
*Build your personal GIF library*

</td>
</tr>
</table>

</div>

## ✨ Features

* 🎯 Quick keyboard shortcut to open/close (Win + C)
* 🔍 Fast GIF search with instant results
* 💡 GIF Ideas tab with trending categories and popular reactions
* 📋 Copy GIF URLs to clipboard with a single click
* ⭐ Save and manage your favorite GIFs
* 🔗 Add any GIPHY URL to your collection
* 🌙 Clean, modern dark mode interface
* ♾️ Infinite scroll loading
* 🕒 Recent searches history
* ⚡ Optimized browser instance with minimal overhead
* 🎨 Adaptive window positioning and sizing
* 📥 Export your GIF collections
* 📤 Import GIF collections
* 🔊 Global Volume Control (Shift + Win + Mouse Wheel)

## 📦 Latest Updates

- **[v1.0.11](https://github.com/JWCow/GIPHYKEYBOARD-for-Windows/releases/tag/v1.0.11)** - Added hover buttons and GIF compression
- **[v1.0.10](https://github.com/JWCow/GIPHYKEYBOARD-for-Windows/releases/tag/v1.0.10)** - Improved GIF handling and compression
- **[v1.0.9](https://github.com/JWCow/GIPHYKEYBOARD-for-Windows/releases/tag/v1.0.9)** - Enhanced UI and performance
- **[v1.0.8](https://github.com/JWCow/GIPHYKEYBOARD-for-Windows/releases/tag/v1.0.8)** - Improved UI consistency and dark theme
- **[v1.0.7](https://github.com/JWCow/GIPHYKEYBOARD-for-Windows/releases/tag/v1.0.7)** - Enhanced My GIFs management

[View full changelog →](CHANGELOG.md)

## 🚀 Installation

1. Download the [latest release](https://github.com/JWCow/GIPHYKEYBOARD-for-Windows/releases/latest)
2. Extract the ZIP file to a location you'll remember (e.g., `Documents` folder)
3. Install AutoHotkey if you haven't already:
   - **For AHK v1:** Run `AutoHotkey_1.1.xx.xx_setup.exe` (included in older releases) or download from [AutoHotkey.com](https://www.autohotkey.com/download/)
   - **For AHK v2:** Download from [AutoHotkey.com](https://www.autohotkey.com/download/)

## 🎯 Getting Started

Choose the version that matches your AutoHotkey installation:

### AutoHotkey v1 Users
1. Navigate to the `AHK_v1` folder
2. Double-click `Run.ahk` to start the program

### AutoHotkey v2 Users
1. Navigate to the `AHK_v2` folder
2. Double-click `Run.ahk` to start the program

Once running:
1. You should see the AutoHotkey icon in your system tray
2. Press `Win + C` to open the GIPHY picker
3. Start searching for GIFs or browse trending categories!

💡 **Pro Tips:**
- To have the program start automatically with Windows:
  1. Press `Win + R`
  2. Type `shell:startup`
  3. Create a shortcut to the `Run.ahk` file (from your chosen version folder) in this folder
- To quit the program, right-click the AutoHotkey icon in the system tray and select "Exit"
- First launch might take a few seconds as it sets up your browser

## 🎮 Usage

* Press `Win + C` to open/close the GIPHY picker
* Type to search for GIFs instantly
* Click on a GIF to copy its URL to clipboard
* Use the "GIF Ideas" tab for inspiration
* Add GIFs to favorites by clicking the ⭐ button
* Paste GIPHY URLs to add them to your collection
* **Global Volume Control:** Hold `Shift + Win` and scroll the mouse wheel to adjust system volume
* Use keyboard shortcuts:
  * ↑/↓: Scroll through results
  * Tab: Navigate between GIFs
  * Ctrl+Enter: Copy selected GIF
  * Esc: Hide window

## 📝️ Technical Details

The app runs as a highly optimized browser instance with:
* Zero browser extension overhead
* Disabled unnecessary features (translate, sync, etc.)
* Minimal memory footprint (~50MB)
* Fast startup with preloading
* Clean app-mode presentation
* Automatic browser detection
* Multi-monitor support

## 📝 Notes

* Works right out of the box with GIPHY's public API
* Compatible with Chrome, Edge, Firefox, and other modern browsers
* The hotkey functionality is Windows-only (requires AutoHotkey)
* The web interface itself is cross-platform compatible
* Uses a dedicated user profile to avoid conflicts with your main browser
* All favorites are stored locally in your browser

## 📜 License

MIT License - feel free to modify and share!

## 📚 Documentation

* [CONTRIBUTING.md](CONTRIBUTING.md) - Guidelines for contributors
* [CHANGELOG.md](CHANGELOG.md) - Version history and updates

## Latest Updates
Check out [Version 1.0.11](CHANGELOG.md#1011---2024-01-24) for the latest improvements including:
- Intuitive hover buttons for quick actions (copy and download)
- Smart GIF compression for optimal file sizes
- Improved GIF handling and performance optimizations