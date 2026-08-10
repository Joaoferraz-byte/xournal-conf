#!/usr/bin/env bash
set -euo pipefail

repo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
config_dir="${XDG_CONFIG_HOME:-${HOME}/.config}/xournalpp"

install -d "${config_dir}/palettes"
install -m 0644 "${repo_dir}/xournalpp/default_template.tex" "${config_dir}/default_template.tex"
install -m 0644 "${repo_dir}/xournalpp/toolbar.ini" "${config_dir}/toolbar.ini"
install -m 0644 "${repo_dir}/xournalpp/palettes/tokyo-night.gpl" "${config_dir}/palettes/tokyo-night.gpl"
sed "s#/home/livara/.config/xournalpp#${config_dir}#g" "${repo_dir}/xournalpp/settings.xml" > "${config_dir}/settings.xml"

printf 'Installed Xournal++ configuration in %s\n' "${config_dir}"
