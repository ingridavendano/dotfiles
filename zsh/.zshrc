# Ingrid Avendano - ingridavendano@gmail.com

# shortcut to dotfile path
export ZSH=$HOME/.dotfiles

# source all the .zsh files in this repo
for config_file ($ZSH/**/*.zsh) source $config_file