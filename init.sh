#! /bin/bash
# git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# echo "Started running the script"

base_folder_path="${HOME}/.config/nvim"

echo "base_folder_path is ${base_folder_path}"

# packer_file_path="${base_folder_path}/lua/sumukh/packer.lua"

if [ -d "$base_folder_path" ]; then
    # if [ -f  "${packer_file_path}" ]; then
    #     # First source packer file
    #     nvim --headless -c 'source  %' -c 'qa!' $packer_file_path
    #     echo "Sourced ${packer_file_path}"
        
    #     # Install all packages from packer
    #     nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
    #     # nvim -c PackerSync -c 'sleep 5' -c qa --headless $packer_file_path
    #     # nvim -c ":PackerSync" -c "q" -c "q!" $packer_file_path
    #     echo "Ran packersync!! for file $file"
    # else
    #     echo "packer file not found, please try again later"
    #     exit 1
    # fi
    
    # Source all custom mappings
    for file in "${base_folder_path}/lua/sumukh/"*; do
        if [ -f "$file" ]; then
            nvim --headless -c 'source %' -c 'qa!' $file
            echo "sourced ${file}"
        fi
    done
    
    # Source all plugin mappings
    for file in "${base_folder_path}/after/plugin"/*; do
        if [ -f "$file" ]; then
            nvim --headless -c 'source  %' -c 'qa!' ${file}
            echo "sourced ${file}"
        fi
    done
    
    nvim --headless -c "source %" -c "qa!" ${base_folder_path}/init.lua
    echo "sourced init in base folder"
else
    echo "Config folder (home/.config/nvim) does not exist. Please try again later"
    exit 1
fi
