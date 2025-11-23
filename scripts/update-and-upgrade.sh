#!/bin/bash
set -e

echo "🔄 Updating package lists..."
sudo apt-get update -y

echo "⬆️ Upgrading installed packages..."
sudo apt-get upgrade -y

echo "🧹 Cleaning up..."
sudo apt-get autoremove -y
sudo apt-get autoclean -y

echo "✅ System update and upgrade complete."