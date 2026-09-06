# Xournal++ configuration architecture

`xournal-conf` is a versioned application-data repository. It is not a NixOS module and does not own the desktop theme or the Home Manager lifecycle. `nix-conf` consumes its files and adapts them to the user profile.

| File | Responsibility |
| --- | --- |
| `xournalpp/settings.xml` | Xournal++ preferences, page defaults, dark mode, tool behavior, auto-fit zoom and paths |
| `xournalpp/toolbar.ini` | Custom toolbar layout and tool ordering |
| `xournalpp/palettes/tokyonight.gpl` | Tokyo Night drawing-color palette; runtime Matugen output may replace it |
| `xournalpp/default_template.tex` | Versioned LaTeX template |

The live configuration has one native writable profile. The repository is the reviewed source at `~/Projects/xournal-conf/xournalpp`, and Home Manager seeds missing files directly under `~/.config/xournalpp`, which is the path consumed by native Xournal++. A previous `~/.config/nixos/xournalpp` directory is a migration source only; it is not an active owner. `~/.config/com.github.xournalpp.xournalpp` is not part of this contract and should not be edited as a competing profile. `forceZoomToFitOnLoad=true` remains the native application setting for opening each journal fitted to the page; desktop and editor openers must not duplicate that behavior with a second profile.

New pages use the versioned dark page template and graph defaults. The area between pages uses the active `mantle` role, and the selection border uses the active `blue` role. Xournal++ does not expose a separate persisted page-border setting in this profile; `selectionBorderColor` is the current-page and selection indicator. The synchronizer does not rewrite `pageTemplate` or existing `.xopp` documents because those are document-owned settings; it updates only the native viewport background, selection border, drawing palette and menu visibility.

DMS/Matugen remains the owner of the desktop GTK appearance. Xournal++ remains the owner of page, tool and palette semantics. The repository keeps `palettes/tokyonight.gpl` as the visible Tokyo Night drawing palette; the shell adapter regenerates the same filename from the active Matugen palette, preserving drawing colors only and deduplicating by RGB. The selected toolbar uses `COLOR_SELECT` rather than repeating the same palette entries as toolbar buttons, so each drawing color has one visible source. `settings.xml` uses `themeVariant=useSystem`, so the application follows the GTK/Noctalia light/dark mode without a second dynamic CSS owner. The repository therefore does not generate a parallel Xournal++ widget theme; it consumes the system GTK theme and updates the native viewport and drawing-palette contract through the palette synchronizer.

Use `nix-conf/scripts/sync-xournalpp-config.sh --push /path/to/xournal-conf` after editing in the UI. Review the diff and publish it from the `xournal-conf` checkout. Use `--pull` to copy a reviewed repository change into the native profile, then restart Xournal++. After the toolbar deduplication change, run `--pull` once while Xournal++ is closed so an existing profile receives the managed toolbar.

## References

1. [Xournal++ file locations](https://xournalpp.github.io/guide/file-locations/)
2. [Xournal++ LaTeX tool](https://xournalpp.github.io/guide/tools/latex/)
3. [Xournal++ toolbar colors and GPL palettes](https://xournalpp.github.io/guide/config/toolbar-colors/)
4. [Tokyo Night palette contract](xournalpp/palettes/tokyonight.gpl)
