#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}"
echo "╔══════════════════════════════════════╗"
echo "║      UNIVERSAL BASE DECODER          ║"
echo "║           DECODER BY ZYUS            ║"
echo "║           TG/IG: @zyus_9             ║"
echo "╚══════════════════════════════════════╝"
echo -e "${NC}"

echo "Installing Universal Base Decoder for Termux/Linux..."

# Check if running in Termux
if [ -d "/data/data/com.termux/files/usr" ]; then
    echo -e "${YELLOW}Termux environment detected.${NC}"
    # Update packages
    pkg update -y
    # Install required packages
    pkg install -y python perl base64 file xxd
else
    echo -e "${YELLOW}Linux environment detected.${NC}"
    # Install required packages (for Debian/Ubuntu based systems)
    if command -v apt > /dev/null; then
        sudo apt update
        sudo apt install -y python3 perl coreutils file xxd
    elif command -v yum > /dev/null; then
        sudo yum update
        sudo yum install -y python3 perl coreutils file vim-common
    elif command -v pacman > /dev/null; then
        sudo pacman -Sy python perl coreutils file xxd
    else
        echo -e "${RED}Could not detect package manager. Please install manually:${NC}"
        echo "python3, perl, base64, file, xxd"
    fi
fi

# Make scripts executable
chmod +x base_decoder.sh
chmod +x install.sh

# Create symbolic link for easy access
if [ -d "/data/data/com.termux/files/usr" ]; then
    if [ ! -d "$HOME/bin" ]; then
        mkdir "$HOME/bin"
    fi
    ln -sf "$(pwd)/base_decoder.sh" "$HOME/bin/basedecode"
    if ! grep -q 'export PATH="$HOME/bin:$PATH"' "$HOME/.bashrc"; then
        echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
    fi
    source "$HOME/.bashrc"
else
    sudo ln -sf "$(pwd)/base_decoder.sh" "/usr/local/bin/basedecode" 2>/dev/null || {
        echo -e "${YELLOW}Could not create system-wide symlink. Using local access.${NC}"
    }
fi

echo ""
echo -e "${GREEN}Installation complete!${NC}"
echo ""
echo -e "${YELLOW}Usage examples:${NC}"
echo "  ./base_decoder.sh encoded_file.txt"
echo "  basedecode secret_message.b64"
echo ""
echo -e "${YELLOW}Supported encodings:${NC}"
echo "  Base16, Base32, Base64, Base58, Base62, Base85, Base91"
echo "  URL encoding, HTML entities, Binary, ROT13"
echo ""
echo -e "${CYAN}Developer: ZYUS${NC}"
echo -e "${CYAN}Contact: TG/IG: @zyus_9${NC}"
echo ""
echo -e "${GREEN}Ready to decode!${NC}"
