#!/bin/bash

# ░█▀▀░█▀█░█▀█░█▀█░█▀▀░█▀▀░▀█▀░█▀▀░░░█▀▄░█▀█░█▀█
# ░█░░░█▀█░█▀▀░█░█░█░█░█▀▀░░█░░█▀▀░░░█▀▄░█▀█░█░█
# ░▀▀▀░▀░▀░▀░░░▀░▀░▀▀▀░▀▀▀░░▀░░▀▀▀░░░▀▀░░▀░▀░▀░▀

# Author: @ScarletVIS
# Description: Creates a .desktop shortcut for Android Studio on Ubuntu/Linux
# License: MIT

# Colors
GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}📦 Android Studio .desktop Installer${NC}"
echo "This script will help you add Android Studio to your applications menu."
echo

# Prompt for bin directory
read -rp "📁 Enter the full path to Android Studio's 'bin' directory: " BIN_DIR

# Clean input
BIN_DIR=$(echo "$BIN_DIR" | sed 's/^"\|"$//g' | xargs)

# Check if directory exists
if [ ! -d "$BIN_DIR" ]; then
  echo -e "${RED}❌ Error: Directory not found: $BIN_DIR${NC}"
  exit 1
fi

# Check studio.sh
if [ ! -f "$BIN_DIR/studio.sh" ]; then
  echo -e "${RED}❌ Error: studio.sh not found in $BIN_DIR${NC}"
  exit 1
fi

# Find icon
ICON=""
if [ -f "$BIN_DIR/studio.svg" ]; then
  ICON="$BIN_DIR/studio.svg"
elif [ -f "$BIN_DIR/studio.png" ]; then
  ICON="$BIN_DIR/studio.png"
else
  echo -e "${RED}❌ Error: studio.svg or studio.png not found in $BIN_DIR${NC}"
  exit 1
fi

# Create desktop entry path
DESKTOP_FILE="$HOME/.local/share/applications/android-studio.desktop"
mkdir -p "$(dirname "$DESKTOP_FILE")"

# Create .desktop file
echo -e "${GREEN}📝 Creating .desktop file...${NC}"
cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Android Studio
Comment=The official IDE for Android development
Exec=$BIN_DIR/studio.sh
Icon=$ICON
Terminal=false
Categories=Development;IDE;
StartupNotify=true
StartupWMClass=jetbrains-studio
EOF

# Make it executable
chmod +x "$DESKTOP_FILE"

echo
echo -e "${GREEN}✅ Done!${NC}"
echo "You can now find Android Studio in your application launcher."
echo -e "If the icon doesn't show up immediately, try logging out or running:\n"
echo -e "   ${GREEN}update-desktop-database ~/.local/share/applications${NC}"
echo
