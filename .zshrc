export PATH=$HOME/.local/bin:$PATH
autoload -U colors && colors
NEWLINE=$'\n'
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[white]%} %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}${NEWLINE}%(?.%F{green} .%F{red}✘) "
#PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="vibrantifix"

#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

plugins=(git F-Sy-H zsh-autosuggestions sublime)
source $ZSH/oh-my-zsh.sh
#fzf dracula
#export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

alias vim='nvim'
alias cpy='xclip -selection c'
alias ls='lsd'
alias h="history | cut -c 8- | sort | uniq | fzf | tr -d '\n' | xclip -selection c"
alias sshg="sshpass -p dTnz2IKJkIbb3OjAsLMmFM4 ssh -p 55031 root@3.111.137.132"
alias autoclean='(set -x; sudo pacman -Rs $(pacman -Qdtq))'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

#startup
#pfetch

#Starship
#eval "$(starship init zsh)"

#search 
se() { du -a | awk '{print $2}' | fzf | xargs -r $EDITOR ; }

# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xvf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


