# Xournal++ configuration architecture

The official Xournal++ documentation identifies the Linux configuration directory as `~/.config/xournalpp`, controlled by `XDG_CONFIG_HOME`. The directory contains `settings.xml` and a `palettes` subdirectory. The shared resources directory contains the built-in LaTeX templates, while a custom template can be selected from the LaTeX preferences.

The repository therefore owns the user-level files that Xournal++ actually reads:

- `xournalpp/settings.xml` becomes `~/.config/xournalpp/settings.xml`.
- `xournalpp/toolbar.ini` becomes `~/.config/xournalpp/toolbar.ini`.
- `xournalpp/default_template.tex` becomes `~/.config/xournalpp/default_template.tex`.
- `xournalpp/palettes/tokyo-night.gpl` becomes `~/.config/xournalpp/palettes/tokyo-night.gpl`.

The settings file explicitly selects the custom toolbar, the user-owned LaTeX template, and the Tokyo Night palette. No Matugen or Nix-store path is required by this repository.

The attached LaTeX template uses the Xournal++ placeholders `%%XPP_TEXT_COLOR%%` and `%%XPP_TOOL_INPUT%%`, which are preserved. It uses `scontents`, `standalone`, `amsmath`, `amssymb`, `ifthen`, and `xcolor`.

References:

1. https://xournalpp.github.io/guide/file-locations/ — Xournal++ file locations.
2. https://xournalpp.github.io/guide/tools/latex/ — LaTeX setup, placeholders, and custom template behavior.
3. https://xournalpp.github.io/guide/config/toolbar-colors/ — toolbar palette and GPL format.
4. https://xournalpp.github.io/guide/config/preferences/ — Xournal++ preference behavior.
