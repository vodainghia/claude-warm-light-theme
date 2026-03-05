# Claude Warm Light — VS Code Theme

> A warm sepia-toned light theme inspired by Claude Code. Easy on the eyes for long coding sessions.

![Version](https://img.shields.io/badge/version-0.2.0-b08a40)
![VS Code](https://img.shields.io/badge/VS%20Code-^1.80.0-007ACC)
![License](https://img.shields.io/badge/license-MIT-green)

---

## Features

- **Warm sepia background** (`#faf6f0`) — no harsh white, reduced eye strain
- **Earthy syntax colors** — keywords in warm brown, strings in moss green, functions in lavender, types in teal
- **Optional grid overlay** — subtle ruled-paper grid lines via custom CSS (`extras/grid/`)
- **Comprehensive coverage** — editor, sidebar, terminal, diff, git decorations, bracket pairs, semantic tokens

## Color Palette

| Role       | Color     |
|------------|-----------|
| Editor BG  | `#faf6f0` |
| Sidebar    | `#f0ebe3` |
| Text       | `#3d3929` |
| Keyword    | `#8b5a2b` |
| String     | `#5a7a3a` |
| Function   | `#6a5acd` |
| Type       | `#2e7d7a` |
| Property   | `#5a6a8a` |
| Number     | `#9a6030` |
| Comment    | `#a09880` |
| Accent     | `#b08a40` |

---

## Installation

### Option A — Install from VSIX (recommended)

Download the latest `.vsix` from [Releases](https://github.com/vodainghia/claude-warm-light-theme/releases) and run:

```bash
code --install-extension claude-warm-light-0.2.0.vsix
```

Or via Command Palette: `Cmd+Shift+P` → **"Extensions: Install from VSIX..."**

### Option B — Copy to extensions folder

```bash
# macOS / Linux
cp -r . ~/.vscode/extensions/claude-warm-light

# Windows (PowerShell)
Copy-Item -Recurse . "$env:USERPROFILE\.vscode\extensions\claude-warm-light"
```

### Option C — Build from source

```bash
npm install -g @vscode/vsce
vsce package
code --install-extension claude-warm-light-0.2.0.vsix
```

After installing, activate the theme:
**`Cmd/Ctrl+K` → `Cmd/Ctrl+T`** → select **"Claude Warm Light"**

---

## Grid Overlay (Optional)

The grid effect requires the [Custom CSS and JS Loader](https://marketplace.visualstudio.com/items?itemName=be5invis.vscode-custom-css) extension.

**Quick setup:**

```bash
# Run the setup script (macOS/Linux)
bash extras/grid/setup-grid.sh
```

**Manual setup:**

1. Copy `extras/grid/claude-warm-grid.css` to a permanent location:
   ```bash
   mkdir -p ~/.vscode/custom
   cp extras/grid/claude-warm-grid.css ~/.vscode/custom/
   ```

2. Add to your `settings.json`:
   ```json
   "vscode_custom_css.imports": [
     "file:///Users/YOUR_NAME/.vscode/custom/claude-warm-grid.css"
   ]
   ```

3. `Cmd+Shift+P` → **"Enable Custom CSS and JS"** → Restart

**Tune the grid** by editing the `:root` variables at the top of `claude-warm-grid.css`:
```css
:root {
  --grid-h-size: 22px;  /* match your editor.lineHeight */
  --grid-v-size: 64px;  /* ~8 chars wide */
}
```

> VS Code will show a "corrupt installation" warning after enabling custom CSS. This is expected and safe — click "Don't Show Again".

---

## Recommended Settings

See [`extras/recommended-settings.jsonc`](extras/recommended-settings.jsonc) for font, ruler, and cursor settings.

Key picks:
- **Font:** JetBrains Mono (with ligatures)
- **Line height:** 22px (matches grid)
- **Rulers:** 80, 120 columns
- **Icon theme:** Catppuccin Latte or Material Icons

---

## License

[MIT](LICENSE) — © 2026 nghiavo
