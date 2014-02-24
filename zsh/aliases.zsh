alias reload_zshrc!='. ~/.zshrc'

alias screen='TERM=screen screen' 

# no spelling corrections  (man zshbuiltins)
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'
alias rm='nocorrect rm'
alias pu=pushd
alias po=popd

# cd by .. or ... or ... or mv file ..../.
alias '..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# show history
if [ "$HIST_STAMPS" = "mm/dd/yyyy" ]
then
    alias history='fc -fl 1'
else
    alias history='fc -l 1'
fi

# list dictory contents
alias ls="ls $ls_opt"
alias ll='ls -l'
alias lh='ls -lh'
alias l='ls -l'
alias la='ls -la'
