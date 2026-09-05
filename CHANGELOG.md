
## Stage 4 — System-aware Xournal++ theme and Tokyo Night palette (2026-09-01)

Xournal++ was pinned to `themeVariant=forceDark`, so its application chrome could not follow the GTK/Noctalia light/dark mode even though Matugen refreshed the drawing palette. The versioned palette was also a Livara-specific high-contrast palette rather than the requested Tokyo Night palette.

The application now uses `themeVariant=useSystem`, leaves GTK/Noctalia as the appearance owner, selects `palettes/tokyonight.gpl` by default, and updates canvas and new-page colors from the active Matugen palette while preserving native fit-to-page behavior. The palette is compact and deduplicated, with no black or surface-background swatches. The architecture notes explicitly keep application theme and drawing colors separate, and XML/palette validation passes without a live activation.
