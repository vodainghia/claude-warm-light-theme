# Claude Warm Light — VS Code Theme

> A warm sepia-toned light theme inspired by Claude Code. Easy on the eyes for long coding sessions. I'm not a dark-mode or light-mode guy anymore — I'm a Claude-mode guy.

![Version](https://img.shields.io/visual-studio-marketplace/v/nghiavo.claude-warm-light)
![VS Code](https://img.shields.io/badge/VS%20Code-^1.80.0-007ACC)
![License](https://img.shields.io/badge/license-MIT-green)

![Claude Warm Light preview](https://raw.githubusercontent.com/vodainghia/claude-warm-light-theme/main/preview.png)

---

## Features

- **Warm sepia background** (`#faf6f0`) — no harsh white, reduced eye strain
- **Earthy syntax colors** — keywords in warm brown, strings in moss green, functions in lavender, types in teal
- **Optional grid overlay** — subtle ruled-paper grid lines via custom CSS (`extras/grid/`)
- **Comprehensive coverage** — editor, sidebar, terminal, diff, git decorations, bracket pairs, semantic tokens

## Color Palette

| Role      | Color       |
| --------- | ----------- |
| Editor BG | `#faf6f0` |
| Sidebar   | `#f0ebe3` |
| Text      | `#3d3929` |
| Keyword   | `#8b5a2b` |
| String    | `#5a7a3a` |
| Function  | `#6a5acd` |
| Type      | `#2e7d7a` |
| Property  | `#5a6a8a` |
| Number    | `#9a6030` |
| Comment   | `#a09880` |
| Accent    | `#b08a40` |

---

## Installation

Search **"Claude Warm Light"** in the VS Code Extensions panel, or install via Command Palette:

```
ext install vodainghia.claude-warm-light
```

After installing, activate the theme:
**`Cmd/Ctrl+K` → `Cmd/Ctrl+T`** → select **"Claude Warm Light"**

---

## Grid Overlay (Optional)

The grid effect requires the [Custom CSS and JS Loader](https://marketplace.visualstudio.com/items?itemName=be5invis.vscode-custom-css) extension.

**Quick setup** (macOS/Linux — one-liner):

```bash
curl -fsSL https://raw.githubusercontent.com/vodainghia/claude-warm-light-theme/main/extras/grid/setup-grid.sh | bash
```

**Manual setup:**

1. Download `claude-warm-grid.css` to a permanent location:

   ```bash
   mkdir -p ~/.vscode/custom
   curl -fsSL https://raw.githubusercontent.com/vodainghia/claude-warm-light-theme/main/extras/grid/claude-warm-grid.css \
     -o ~/.vscode/custom/claude-warm-grid.css
   ```
2. Add to your `settings.json`:

   ```json
   "vscode_custom_css.imports": [
     "file:///Users/YOUR_NAME/.vscode/custom/claude-warm-grid.css"
   ]
   ```
3. `Cmd+Shift+P` → **"Enable Custom CSS and JS"** → Restart (use this whenever the grid does not load)

> VS Code will show a "corrupt installation" warning after enabling custom CSS. This is expected and safe — click "Don't Show Again".

---

## Recommended Settings

See [`extras/recommended-settings.jsonc`](https://github.com/vodainghia/claude-warm-light-theme/blob/main/extras/recommended-settings.jsonc) for font, ruler, and cursor settings.

Key picks:

- **Font:** JetBrains Mono (with ligatures)
- **Line height:** 22px
- **Rulers:** 80, 120 columns
- **Icon theme:** Catppuccin Latte or Material Icons

---

## License

[MIT](LICENSE) — © 2026 nghiavo
