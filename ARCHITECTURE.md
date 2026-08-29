# Xournal++ configuration architecture

`xournal-conf` is a versioned application-data repository. It is not a NixOS module and does not own the desktop theme or the Home Manager lifecycle. `nix-conf` consumes its files and adapts them to the user profile.

| File | Responsibility |
| --- | --- |
| `xournalpp/settings.xml` | Xournal++ preferences, page defaults, dark mode, tool behavior and paths |
| `xournalpp/toolbar.ini` | Custom toolbar layout and tool ordering |
| `xournalpp/palettes/livara.gpl` | High-contrast fallback drawing-color palette; runtime Matugen output may replace it |
| `xournalpp/default_template.tex` | Versioned LaTeX template |

The live configuration has one native writable profile. The repository is the reviewed source at `~/Projects/xournal-conf/xournalpp`, and Home Manager seeds missing files directly under `~/.config/xournalpp`, which is the path consumed by native Xournal++. A previous `~/.config/nixos/xournalpp` directory is a migration source only; it is not an active owner. `~/.config/com.github.xournalpp.xournalpp` is not part of this contract and should not be edited as a competing profile.

DMS/Matugen remains the owner of the desktop GTK appearance. Xournal++ remains the owner of page, tool and palette semantics. The repository keeps `palettes/livara.gpl` as a high-contrast fallback with no dark surface swatches such as crust or mantle. The shell adapter may regenerate the same filename from the active Matugen palette, but it preserves the same contract: drawing colors only, deduplicated by RGB, and suitable for a black page. The repository therefore does not generate a second dynamic CSS theme for Xournal++; it consumes the system GTK theme and keeps its application behavior reproducible.

Use `nix-conf/scripts/sync-xournalpp-config.sh --push /path/to/xournal-conf` after editing in the UI. Review the diff and publish it from the `xournal-conf` checkout. Use `--pull` to copy a reviewed repository change into the native profile, then restart Xournal++.

## References

1. [Xournal++ file locations](https://xournalpp.github.io/guide/file-locations/)
2. [Xournal++ LaTeX tool](https://xournalpp.github.io/guide/tools/latex/)
3. [Xournal++ toolbar colors and GPL palettes](https://xournalpp.github.io/guide/config/toolbar-colors/)
4. [Livara palette contract](xournalpp/palettes/livara.gpl)
