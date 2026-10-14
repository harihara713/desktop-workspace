#!/usr/bin/env bash

# Copy configuration directory and it's content
# ~/.config/hypr
# ~/.config/waybar
# ~/.config/mako
# ~/.config/foot
# ~/.config/nvim

hypr_config="$HOME/.config/hypr"
waybar_config="$HOME/.config/waybar"
mako_config="$HOME/.config/mako"
foot_config="$HOME/.config/foot"
nvim_config="$HOME/.config/nvim"

src_config_dirs=("${hypr_config}" "${waybar_config}" "${mako_config}" "${foot_config}" "${nvim_config}")
dst_config_dir="./.config"

# create destination config directory if it is not exists
if ! [[ -d "${dst_config_dir}" ]]; then
  mkdir "${dst_config_dir}"
fi

# iterate over each source config directories look for any modification
for c_dir in "${src_config_dirs[@]}"; do
  base_dir="$(basename "${c_dir}")"
  if diff -qr "${dst_config_dir}/${base_dir}" "${c_dir}" 2>/dev/null ; then
    # this means there has no change or modifiacation(0)
    echo "INFO: ${c_dir} has not modified!"
    continue
  else
    # there is change(1) or the directory not exists any error(2)
    # copy them to destination
    read -r -p "Do you want to copy ${c_dir} to ${dst_config_dir}/${base_dir}: (Y/n) " choice 
    if [[ "${choice}" =~ ^([Yy]|[Yy][Ee][Ss])?$ ]] ; then
      cp -aRv "${c_dir}" "${dst_config_dir}"
    else
      continue
    fi
  fi
done
