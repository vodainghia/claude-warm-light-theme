#!/bin/bash
# ─────────────────────────────────────────────────────────
# Claude Warm Light — Grid Overlay Setup  v0.2
# ─────────────────────────────────────────────────────────
# Copies the grid CSS to a permanent location and prints
# the exact settings.json snippet you need to add.
#
# Prerequisites:
#   Install "Custom CSS and JS Loader" (be5invis.vscode-custom-css)
#   → https://marketplace.visualstudio.com/items?itemName=be5invis.vscode-custom-css
# ─────────────────────────────────────────────────────────

set -e

CSS_DIR="$HOME/.vscode/custom"
CSS_FILE="$CSS_DIR/claude-warm-grid.css"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_CSS="$SCRIPT_DIR/claude-warm-grid.css"

echo "╔══════════════════════════════════════════════╗"
echo "║  Claude Warm Light — Grid Overlay Setup v0.2 ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

# ── Step 1: Copy CSS ──────────────────────────────────────
mkdir -p "$CSS_DIR"
cp "$SOURCE_CSS" "$CSS_FILE"
echo "✓  Copied grid CSS to: $CSS_FILE"

# ── Step 2: Build platform-correct file URI ───────────────
if [[ "$OSTYPE" == "darwin"* ]] || [[ "$OSTYPE" == "linux-gnu"* ]]; then
  FILE_URI="file://${CSS_FILE}"
else
  # Windows (Git Bash / WSL)
  WIN_PATH=$(echo "$CSS_FILE" | sed 's|^/mnt/\([a-z]\)|\u\1:|' | tr '/' '\\')
  FILE_URI="file:///${WIN_PATH}"
fi

echo "✓  File URI: $FILE_URI"
echo ""

# ── Step 3: Print settings snippet ───────────────────────
echo "┌──────────────────────────────────────────────────┐"
echo "│  Add this to your settings.json:                 │"
echo "│  Cmd+Shift+P → 'Open User Settings (JSON)'       │"
echo "├──────────────────────────────────────────────────┤"
echo ""
echo '  "vscode_custom_css.imports": ['
echo "    \"${FILE_URI}\""
echo '  ]'
echo ""
echo "└──────────────────────────────────────────────────┘"
echo ""

# ── Step 4: Optional — auto-patch settings.json ───────────
SETTINGS_PATHS=(
  "$HOME/Library/Application Support/Code/User/settings.json"             # macOS
  "$HOME/.config/Code/User/settings.json"                                  # Linux
  "$APPDATA/Code/User/settings.json"                                        # Windows
)

SETTINGS_FILE=""
for p in "${SETTINGS_PATHS[@]}"; do
  if [[ -f "$p" ]]; then
    SETTINGS_FILE="$p"
    break
  fi
done

if [[ -n "$SETTINGS_FILE" ]]; then
  echo "Found VS Code settings at: $SETTINGS_FILE"
  read -r -p "Auto-add the import to settings.json? [y/N] " confirm
  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    # Check if key already exists
    if grep -q "vscode_custom_css.imports" "$SETTINGS_FILE"; then
      echo "⚠  'vscode_custom_css.imports' already exists in settings.json."
      echo "   Please add the URI manually to avoid duplicates."
    else
      # Back up first
      cp "$SETTINGS_FILE" "${SETTINGS_FILE}.backup"
      echo "✓  Backed up to: ${SETTINGS_FILE}.backup"
      # Insert before the closing brace
      python3 - "$SETTINGS_FILE" "$FILE_URI" << 'PYEOF'
import sys, json
path, uri = sys.argv[1], sys.argv[2]
with open(path, "r") as f:
    data = f.read()
# Parse as JSON (strip trailing commas for lenient parse)
import re
clean = re.sub(r',\s*([\]}])', r'\1', data)
obj = json.loads(clean)
obj["vscode_custom_css.imports"] = [uri]
with open(path, "w") as f:
    json.dump(obj, f, indent=2)
    f.write("\n")
PYEOF
      echo "✓  settings.json updated!"
    fi
  fi
fi

echo ""
echo "── Next steps ─────────────────────────────────────"
echo "  1. Open VS Code"
echo "  2. Cmd+Shift+P → 'Enable Custom CSS and JS'"
echo "  3. Click 'Restart' when prompted"
echo "  4. Dismiss 'corrupt installation' warning (expected & safe)"
echo ""
echo "── To disable grid later ───────────────────────────"
echo "  Cmd+Shift+P → 'Disable Custom CSS and JS'"
echo ""
echo "── To tune the grid ────────────────────────────────"
echo "  Edit :root variables at the top of: $CSS_FILE"
echo "    --grid-h-size  (default 22px — match editor.lineHeight)"
echo "    --grid-v-size  (default 64px — ~8 chars wide)"
echo ""
echo "Done! Enjoy your grid ✨"
