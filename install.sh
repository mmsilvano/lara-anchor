#!/usr/bin/env bash

# Target directory (current folder)
TARGET_DIR="$PWD"

# URL to your templates archive (zip)
ARCHIVE_URL="https://lara-anchor.netlify.app/templates.zip"

echo "Downloading templates..."
curl -L "$ARCHIVE_URL" -o "$TARGET_DIR/templates.zip"

echo "Extracting templates contents to $TARGET_DIR..."
# Extract everything to a temporary folder first
TEMP_DIR=$(mktemp -d)
unzip -o "$TARGET_DIR/templates.zip" -d "$TEMP_DIR"

# Move contents of the templates folder into the target directory
if [ -d "$TEMP_DIR/templates" ]; then
    mv "$TEMP_DIR/templates/"* "$TARGET_DIR/"
    rm -rf "$TEMP_DIR/templates"
else
    # If the zip didn't contain a top-level templates folder
    mv "$TEMP_DIR/"* "$TARGET_DIR/"
fi

# Remove temporary folder and zip
rm -rf "$TEMP_DIR"
rm "$TARGET_DIR/templates.zip"

echo "✅ Lara Anchor setup complete!"
echo ""
echo "🚀 Next steps:"
echo "   1. ⚡ sudo docker compose build"
echo "   2. 🚀 sudo docker compose up -d"
echo ""
echo "⚡⚓ You're ready to start using Lara Anchor!"
