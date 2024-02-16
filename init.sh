#! /bin/bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

base_folder_path = "$HOME/.config/nvim"

if [-d "${base_folder_path}" ]; then
    for file in "${base_folder_path}/lua/sumukh/*.lua"; do
        if [ -f "${file}" ]; then
            source "${file}"
            echo "sourced ${file}"
        fi
        if ["${file}" = "${base_folder_path}/lua/sumukh/packer.lua" ]; then
            nvim -c ":PackerSync"
            echo "Ran packersync!! for file $file"
        fi
    done
    for file in "${base_folder_path}/after/plugin/*.lua"; do
        if [-f "$file"]; then
            source "${file}"
            echo "sourced ${file}"
        fi
    done

    source "${base_folder_path}/init.lua"
    echo "sourced init in base folder"
else
    echo "Config folder (home/.config/nvim) does not exist. Please try again later"
    exit 1
fi    
