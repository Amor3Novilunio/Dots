eval "$(starship init zsh)"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/amor_iii/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


bindkey "^[[1;5C" forward-char   # Ctrl+Right = move 1 char right
bindkey "^[[1;5D" backward-char  # Ctrl+Left = move 1 char left
