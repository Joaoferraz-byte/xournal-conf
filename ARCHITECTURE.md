# Xournal++ declarative configuration

This repository is a versioned source of Xournal++ user configuration. It is not installed manually. The `nix-conf` flake consumes this repository as the `xournal-conf` non-flake input and Home Manager injects the files into the active user's `~/.config/xournalpp` profile.

The declarative mapping is:

| Repository asset | Home Manager destination |
| --- | --- |
| `xournalpp/settings.xml` | `~/.config/xournalpp/settings.xml` |
| `xournalpp/toolbar.ini` | `~/.config/xournalpp/toolbar.ini` |
| `xournalpp/default_template.tex` | `~/.config/xournalpp/default_template.tex` |
| `xournalpp/palettes/tokyo-night.gpl` | `~/.config/xournalpp/palettes/tokyo-night.gpl` |

`settings.xml` selects the `Xournal++ Copy` toolbar, the `useSystem` application theme, the repository-owned LaTeX template, and the Tokyo Night palette. The LaTeX template preserves Xournal++'s `%%XPP_TEXT_COLOR%%` and `%%XPP_TOOL_INPUT%%` placeholders. The palette is a static Tokyo Night palette with 11 bright colors chosen for legibility on a pure-black journal background.

The target repository has no install script and no Matugen dependency. Dynamic DMS theme generation remains separate from this repository; the Xournal++ configuration itself is reproducibly injected by the Nix flake and Home Manager.

## References

1. [Xournal++ file locations](https://xournalpp.github.io/guide/file-locations/)
2. [Xournal++ LaTeX tool](https://xournalpp.github.io/guide/tools/latex/)
3. [Xournal++ toolbar colors and GPL palettes](https://xournalpp.github.io/guide/config/toolbar-colors/)
