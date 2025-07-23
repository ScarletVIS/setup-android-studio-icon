# 🚀 Android Studio Desktop Entry Creator

A simple Bash script to create a `.desktop` shortcut for Android Studio on Linux, so you can launch it from the system menu (GNOME/KDE/Unity/etc).

## 🔧 Features

- Prompts for path to `bin/` folder
- Validates all necessary files
- Supports both `.svg` and `.png` icons
- Automatically installs into `~/.local/share/applications`
- Works on Ubuntu and most Linux distros

## 📥 Usage

1. Download the script:

```bash
wget https://raw.githubusercontent.com/yourusername/android-studio-desktop-entry/main/create-android-studio-desktop-entry.sh
```

2. Make it executable:
```bash
chmod +x create-android-studio-desktop-entry.sh
```

3. Run the script:
```bash
./create-android-studio-desktop-entry.sh
```

4. Follow the prompts and enjoy launching Android Studio from your applications menu 🎉
```bash
📁 Enter the full path to Android Studio's 'bin' directory: /home/you/Downloads/android-studio/bin
✅ Done! You can now find Android Studio in your app launcher.
```