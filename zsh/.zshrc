# Ingrid Avendano - ingridavendano@gmail.com

# shortcut to dotfile path
export ZSH=$HOME/.dotfiles

# source all the .zsh files in this repo
for config_file ($ZSH/**/*.zsh) source $config_file

# history stuff
HISTFILE=~/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000
#setopt appendhistory
setopt extended_history
setopt inc_append_history
setopt hist_verify
setopt share_history
setopt hist_ignore_dups
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_expire_dups_first

setopt autopushd pushdminus pushdtohome autocd pushdignoredups

setopt clobber
setopt nocorrectall   # only want commands, not arg correction
setopt correct
setopt equals
setopt extended_glob
setopt extended_history
setopt interactive_comments
setopt long_list_jobs
setopt nohup
setopt nonomatch  # echo not-here*  actually gets the *
#setopt nullglob  # echo not-here*  expands to no args

autoload -U compinit && compinit
zmodload -i zsh/complist   # completion for MANY commands
# zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

autoload -U url-quote-magic
zle -N self-insert url-quote-magic

#more more more more options
#setopt   notify globdots correct pushdtohome cdablevars autolist
#setopt   correctall autocd recexact longlistjobs
#setopt   autoresume histignoredups pushdsilent noclobber
#setopt   autopushd pushdminus extendedglob rcquotes mailwarning
#unsetopt bgnice autoparamslash

# zsh doesnt use readline, and these are almost always not set
# or set wrongly.  yikes...

# if [ -f ~/.zkbd/$TERM-$VENDOR-$OSTYPE ]; then
#   source ~/.zkbd/$TERM-$VENDOR-$OSTYPE
#   [[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
#   [[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
#   [[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
#   [[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
#   [[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
#   [[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
#   [[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
#   [[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
#   [[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
#   [[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
#   [[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char 
# else

# WORDCHARS=""  ## wtf is this?

#emacs bindings, e.g. ctrl-{a,e,d,k,u,y}
bindkey -e  

#history only on first substring of command you're typing
#bindkey "\e[A" up-line-or-search
#bindkey "\e[B" down-line-or-search
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward
#new iterm binds up arrow to this, wtf, ^[[A is standard on all other xterm's
bindkey "\eOA" history-beginning-search-backward
bindkey "\eOB" history-beginning-search-forward

bindkey "\e[1~" beginning-of-line
bindkey "\e[2~" quoted-insert
bindkey "\e[3~" delete-char
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\eOd" backward-word
bindkey "\eOc" forward-word 

autoload -U edit-command-line
zle -N edit-command-line
bindkey "^x^e" edit-command-line

# ubuntu demanded this once from iterm TERM=xterm-color
bindkey '^?' backward-delete-char 

## file rename magick
bindkey "^[m" copy-prev-shell-word