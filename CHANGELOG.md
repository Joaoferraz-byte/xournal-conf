
## Stage 4 — System-aware Xournal++ theme and Tokyo Night palette (2026-09-01)

Xournal++ was pinned to `themeVariant=forceDark`, so its application chrome could not follow the GTK/Noctalia light/dark mode even though Matugen refreshed the drawing palette. The versioned palette was also a Livara-specific high-contrast palette rather than the requested Tokyo Night Night palette.

The application now uses `themeVariant=useSystem`, leaving GTK/Noctalia as the appearance owner while preserving the black journal page and native fit-to-page behavior. `palettes/livara.gpl` is now a compact, deduplicated Tokyo Night Night GIMP palette with no black or surface-background swatches. The architecture notes explicitly keep application theme and drawing colors separate, and XML/palette validation passes without a live activation.
