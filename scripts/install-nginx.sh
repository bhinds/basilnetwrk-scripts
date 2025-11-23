#!/bin/bash
set -e

echo "🌐 Installing Nginx..."

sudo apt-get update -y
sudo apt-get install -y nginx

echo "⚙️ Enabling and starting Nginx..."
sudo systemctl enable nginx
sudo systemctl start nginx

IP_ADDRESS=$(hostname -I | awk '{print $1}')

echo "✅ Nginx installation complete."
echo "   Try opening: http://$IP_ADDRESS"
