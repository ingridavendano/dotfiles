# Sublime Text 2 Aliases - from oh-my-zsh

local _sublime_darwin_paths > /dev/null 2>&1
_sublime_darwin_paths=(
    "/usr/local/bin/subl"
    "$HOME/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl"
    "$HOME/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"
    "$HOME/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
    "/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl"
    "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"
    "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
)

if [[ $('uname') == 'Linux' ]]; then
    if [ -f '/usr/bin/sublime_text' ]; then
        st_run() { nohup /usr/bin/sublime_text $@ > /dev/null & }
    else
        st_run() { nohup /usr/bin/sublime-text $@ > /dev/null & }
    fi
    alias st=st_run

elif  [[ $('uname') == 'Darwin' ]]; then

    for _sublime_path in $_sublime_darwin_paths; do
        if [[ -a $_sublime_path ]]; then
            alias subl="'$_sublime_path'"
            alias st=subl
            break
        fi
    done
fi

alias stt='st .'

# those features...)
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

#emacs bindings, e.g. ctrl-{a,e,d,k,u,y}
bindkey -e  

bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward
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
bindkey '^?' backward-delete-char 
bindkey "^[m" copy-prev-shell-word
