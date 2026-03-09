/// <reference types="node" />
// Claude Warm Light — syntax preview
// A warm sepia palette inspired by Claude Code

import { readFileSync } from "fs";
import path from "path";

interface ThemeConfig {
  name: string;
  background: string;
  lineHeight: number;
  gridEnabled: boolean;
}

type ColorRole = "keyword" | "string" | "function" | "type" | "comment";

const DEFAULT_CONFIG: ThemeConfig = {
  name: "Claude Warm Light",
  background: "#faf6f0",
  lineHeight: 22,
  gridEnabled: false,
};

class ThemeManager {
  private config: ThemeConfig;
  private readonly version = "0.2.5";

  constructor(config: Partial<ThemeConfig> = {}) {
    this.config = { ...DEFAULT_CONFIG, ...config };
  }

  activate(): boolean {
    const { name, lineHeight } = this.config;
    console.log(`Activating theme: ${name} (lineHeight=${lineHeight})`);
    return true;
  }

  getColor(role: ColorRole): string {
    const palette: Record<ColorRole, string> = {
      keyword:  "#8b5a2b",
      string:   "#5a7a3a",
      function: "#6a5acd",
      type:     "#2e7d7a",
      comment:  "#a09880",
    };
    return palette[role] ?? "#3d3929";
  }

  loadFromFile(filePath: string): ThemeConfig {
    const abs = path.resolve(filePath);
    const raw = readFileSync(abs, "utf-8");
    return JSON.parse(raw) as ThemeConfig;
  }
}

// ── helpers ──────────────────────────────────────────────

function lerp(a: number, b: number, t: number): number {
  return a + (b - a) * t;
}

async function fetchPalette(url: string): Promise<string[]> {
  const res = await fetch(url);
  if (!res.ok) throw new Error(`HTTP ${res.status}`);
  return res.json() as Promise<string[]>;
}

// ── main ─────────────────────────────────────────────────

const manager = new ThemeManager({ gridEnabled: true });
manager.activate();

const mid = lerp(0, 255, 0.5);   // 127.5
console.log("midpoint:", mid);
