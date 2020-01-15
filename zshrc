# The following lines were added by compinstall
zstyle :compinstall filename '/Users/billywan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

### Added by Zplugin's installer
if [[ ! -d $HOME/.zplugin/bin ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing Zplugin…%f"
    command mkdir -p $HOME/.zplugin
    command git clone https://github.com/zdharma/zplugin $HOME/.zplugin/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

### Plugins

# quickly execute or edit previous commands from history as you type
# note: this MUST be loaded before `fast-syntax-highlighting` to avoid errors
# ref - search zsh-autosuggestions http://zdharma.org/zplugin/wiki/GALLERY/#plugins
zplugin ice wait lucid atload'!_zsh_autosuggest_start'
zplugin light zsh-users/zsh-autosuggestions
# Ctrl-w accepts next word
bindkey '^w' forward-word

# ref - search fast-syntax-highlighting http://zdharma.org/zplugin/wiki/GALLERY/#plugins
zplugin ice wait lucid atinit"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

# prompt
# ref - https://github.com/romkatv/powerlevel10k#zplugin
zplugin ice depth=1
zplugin light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

