#!/bin/bash
# BasilNetwrk Master Toolbox Script
# Run this from anywhere with:
# bash <(curl -fsSL https://raw.githubusercontent.com/bhinds/basilnetwrk-scripts/main/scripts/master-toolbox.sh)

BASE_URL="https://raw.githubusercontent.com/bhinds/basilnetwrk-scripts/main/scripts"

# Check for curl before doing anything
if ! command -v curl >/dev/null 2>&1; then
    echo "❌ curl is not installed. Please install curl first, e.g.:"
    echo "   sudo apt-get update && sudo apt-get install -y curl"
    exit 1
fi

run_remote() {
    local script_name="$1"
    local url="$BASE_URL/$script_name"

    echo
    echo "🔧 Running $script_name from GitHub..."
    echo "   URL: $url"

    if ! curl -fsSL "$url" | bash; then
        echo "❌ Failed to run $script_name."
        echo "   - Make sure the file exists in your GitHub repo at:"
        echo "     scripts/$script_name"
        echo "   - Confirm the URL works in a browser:"
        echo "     $url"
        echo
        read -rp "Press Enter to return to the menu..." _
        return 1
    fi

    echo "✅ Done: $script_name"
    echo
    read -rp "Press Enter to return to the menu..." _
}

while true; do
    clear
    echo "==============================="
    echo "  BasilNetwrk Master Toolbox"
    echo "==============================="
    echo "1) Update & Upgrade (Ubuntu/Debian)"
    echo "2) Install Essentials (curl, git, htop, net-tools, etc.)"
    echo "3) Install Nginx Web Server"
    echo "4) Install Docker + Docker Compose Plugin"
    echo "5) Run ALL (1 → 4 in order)"
    echo "0) Exit"
    echo "-------------------------------"
    read -rp "Choose an option: " choice

    case "$choice" in
        1) run_remote "update-and-upgrade.sh" ;;
        2) run_remote "install-essentials.sh" ;;
        3) run_remote "install-nginx.sh" ;;
        4) run_remote "install-docker.sh" ;;
        5)
            run_remote "update-and-upgrade.sh"
            run_remote "install-essentials.sh"
            run_remote "install-nginx.sh"
            run_remote "install-docker.sh"
            ;;
        0)
            echo "Goodbye."
            exit 0
            ;;
        *)
            echo "❌ Invalid option"
            sleep 1
            ;;
    esac
done
