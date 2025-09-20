#!/usr/bin/env bash

# Target directory (current folder)
TARGET_DIR="$PWD"

# URL to your templates archive (zip)
ARCHIVE_URL="https://lara-anchor.netlify.app/templates.zip"

echo "Downloading templates..."
curl -L "$ARCHIVE_URL" -o "$TARGET_DIR/templates.zip"

echo "Extracting templates to $TARGET_DIR..."
unzip -o "$TARGET_DIR/templates.zip" -d "$TARGET_DIR"

# Clean up the zip file
rm "$TARGET_DIR/templates.zip"

echo "✅ Lara Anchor setup complete!"
echo ""
echo "🚀 Next steps:"
echo "   1. ⚡ sudo docker compose build"
echo "   2. 🚀 sudo docker compose up -d"
echo ""
echo "⚡⚓ You're ready to start using Lara Anchor!"
