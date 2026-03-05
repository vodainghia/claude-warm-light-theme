# Changelog

All notable changes to **Claude Warm Light** are documented here.
Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [0.2.2] — 2026-03-05

### Changed
- README: simplified Installation section — marketplace only
- README: dynamic version badge (auto-syncs with Marketplace)
- README: updated tagline description
- `package.json`: corrected publisher and repository URLs to `vodainghia`

---

## [0.2.0] — 2026-03-05

### Added
- `icon.png` — extension icon (128×128)
- `LICENSE` (MIT)
- `.vscodeignore` — excludes `extras/` from VSIX bundle
- `CHANGELOG.md`

### Changed
- **CSS Grid v0.2** (`extras/grid/claude-warm-grid.css`):
  - Introduced `:root` CSS variables (`--grid-h-size`, `--grid-v-size`, `--grid-color`) for easy tuning
  - Added VS Code 1.90+ terminal selector `.xterm .xterm-screen` (old selectors kept as fallback)
  - Added Activity Bar right-edge separator
  - Improved `setup-grid.sh`: auto-detect `settings.json` path, optional auto-patch with backup
- **Project structure** reorganised for GitHub:
  - Core extension files at root
  - Grid CSS + setup script moved to `extras/grid/`
  - `recommended-settings.jsonc` moved to `extras/`
- `package.json`: bumped to `0.2.0`, added `galleryBanner`, `bugs`, `homepage` fields

---

## [0.1.0] — 2026-03-05

### Added
- Initial release
- Warm sepia color theme (`themes/claude-warm-light-color-theme.json`)
- Optional grid overlay CSS (`claude-warm-grid.css`)
- Setup script (`setup-grid.sh`)
- Recommended settings (`recommended-settings.jsonc`)
