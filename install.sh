#!/bin/bash

set -e

echo "⚡⚓ Setting up Lara Anchor in current project..."

# Get the script directory so it's portable
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy template files into current directory
cp -r "$SCRIPT_DIR/templates/"* .

echo "✅ Lara Anchor setup complete!"
echo ""
echo "🚀 Next steps:"
echo "   1. ⚡ sudo docker compose build"
echo "   2. 🚀 sudo docker compose up -d"
echo ""
echo "⚡⚓ You're ready to start using Lara Anchor!"
