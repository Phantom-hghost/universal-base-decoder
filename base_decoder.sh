#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Banner with Developer Credits
echo -e "${CYAN}"
cat << "EOF"
╔══════════════════════════════════════════════╗
║           UNIVERSAL BASE DECODER             ║
║               For Termux & Linux             ║
║                                              ║
║               DECODER BY ZYUS                ║
║             TG/IG: @zyus_9                   ║
║                                              ║
║      Supports: Base16, Base32, Base64,       ║
║      Base85, Base91, Base58, Base62, URL     ║
╚══════════════════════════════════════════════╝
EOF
echo -e "${NC}"

# Function to display help
show_help() {
    echo -e "${YELLOW}Usage:${NC}"
    echo "  ./base_decoder.sh <filename>"
    echo "  ./base_decoder.sh --help"
    echo ""
    echo -e "${YELLOW}Supported Encodings:${NC}"
    echo "  • Base16 (Hex)"
    echo "  • Base32"
    echo "  • Base64 (Standard, URL-safe)"
    echo "  • Base58 (Bitcoin, Flickr)"
    echo "  • Base62"
    echo "  • Base85 (Ascii85, RFC 1924)"
    echo "  • Base91"
    echo "  • URL Encoding"
    echo "  • HTML Entities"
    echo "  • ROT13/Caesar Ciphers"
    echo ""
    echo -e "${YELLOW}Features:${NC}"
    echo "  • Auto-detects encoding type"
    echo "  • Detects multiple encoding layers"
    echo "  • Cleans up temporary files automatically"
    echo "  • Produces single readable output"
    echo ""
    echo -e "${CYAN}Developer:${NC} ZYUS"
    echo -e "${CYAN}Contact:${NC} TG/IG: @zyus_9"
    echo ""
}
