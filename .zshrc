autoload -Uz compinit -u
compinit -u
#export PATH=/usr/local/aws/bin:$PATH
#source /usr/local/aws/bin/aws_zsh_completer.sh
export PATH=/home/admin/.local/bin/:$PATH

autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws
complete -C '/usr/local/etc/bash_completion.d' qemu

##### Antigen config #####
source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle common-aliases
antigen bundle encode64
antigen bundle git
antigen bundle git-extras
antigen bundle git_remote_branch
#antigen bundle oldratlee/hacker-quotes
antigen bundle httpie
antigen bundle jsontools
antigen bundle pip
antigen bundle pep8
antigen bundle pylint
antigen bundle python
antigen bundle sudo
antigen bundle web-search
antigen bundle docker
antigen bundle docker-compose
#antigen bundle aws

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Solarized dircolors
#antigen bundle joel-porquet/zsh-dircolors-solarized.git

# Load the theme.
antigen theme agnoster

# Tell Antigen that you're done.
antigen apply

##### Antigen Config #####

if ! pgrep -f 'powerline-daemon' > /dev/null; then
  powerline-daemon -q > /dev/null
fi

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

prompt_time() {
    prompt_segment black default "%D{%F %H:%M:%S%z}"
}

timestamp_and_accept() {
    OLD_PROMPT="$PROMPT"
    PROMPT="$(prompt_time) $OLD_PROMPT"
    zle reset-prompt
    PROMPT="$OLD_PROMPT"
    zle accept-line
}

zle -N timestamp_and_accept
bindkey "^M" timestamp_and_accept

alias vi='vim'

#source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
source /home/admin/.local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
setopt APPEND_HISTORY
