# Xournal++ configuration architecture

`xournal-conf` is a versioned application-data repository. It is not a NixOS module and does not own the desktop theme or the Home Manager lifecycle. `nix-conf` consumes its files and adapts them to the user profile.

| File | Responsibility |
| --- | --- |
| `xournalpp/settings.xml` | Xournal++ preferences, page defaults, dark mode, tool behavior and paths |
| `xournalpp/toolbar.ini` | Custom toolbar layout and tool ordering |
| `xournalpp/palettes/tokyo-night.gpl` | Semantic drawing-color palette |
| `xournalpp/default_template.tex` | Versioned LaTeX template |

The live configuration uses three distinct locations. The repository is the reviewed source at `~/Projects/xournal-conf/xournalpp`. Home Manager seeds writable copies under `~/.config/nixos/xournalpp`. The native Xournal++ path `~/.config/xournalpp` contains out-of-store links to those writable copies. `~/.config/com.github.xournalpp.xournalpp` is not part of this contract and should not be edited as a competing profile.

DMS/Matugen remains the owner of the desktop GTK appearance. Xournal++ remains the owner of page, tool and palette semantics. The repository therefore does not generate a second dynamic CSS theme for Xournal++; it consumes the system GTK theme and keeps its application behavior reproducible.

Use `nix-conf/scripts/sync-xournalpp-config.sh --push /path/to/xournal-conf` after editing in the UI. Review the diff and publish it from the `xournal-conf` checkout. Use `--pull` to copy a reviewed repository change into the writable staging directory, then restart Xournal++.

## References

1. [Xournal++ file locations](https://xournalpp.github.io/guide/file-locations/)
2. [Xournal++ LaTeX tool](https://xournalpp.github.io/guide/tools/latex/)
3. [Xournal++ toolbar colors and GPL palettes](https://xournalpp.github.io/guide/config/toolbar-colors/)
