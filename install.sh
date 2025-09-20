#!/bin/bash

set -e

PROJECT_NAME="lara-anchor"

echo "⚡⚓ Setting up $PROJECT_NAME..."

# Make project directory
mkdir -p $PROJECT_NAME
cd $PROJECT_NAME

# Copy template files (adjust this path if needed)
cp -r /path/to/templates/* .

echo "✅ $PROJECT_NAME setup complete!"
echo ""
echo "🚀 Next steps:"
echo "   1. cd $PROJECT_NAME"
echo "   2. ⚡ sudo docker compose build"
echo "   3. 🚀 sudo docker compose up -d"
echo ""
echo "⚡⚓ You're ready to start using Lara Anchor!"
