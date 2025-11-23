#!/bin/bash
set -e

echo "📦 Installing essential tools (curl, git, htop, etc.)..."

sudo apt-get update -y

sudo apt-get install -y \
    curl \
    wget \
    git \
    htop \
    net-tools \
    unzip \
    tmux \
    ca-certificates \
    software-properties-common

echo "✅ Essentials installed."
