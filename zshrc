# vim: foldmarker={{{,}}} foldlevel=0 foldmethod=marker
#
# zshrc of Gebhard Woestemeyer <g.woestemeyer@gmail.com>

# Environment {{{
  HISTSIZE=20000
  SAVEHIST=20000
  HISTFILE=~/.zsh/zhistory

  export CLICOLOR=yepp # osx ls
  export EDITOR="vim"
  export PAGER='less -r'

  export TERM=screen-256color

  PATH=$HOME/opt/bin:$PATH
  PATH=$HOME/.local/bin:$PATH
  PATH=/usr/local/sbin:/usr/local/bin:$PATH
  PATH=$PATH:$HOME/.rvm/bin
  PATH=$HOME/dev/living-in-a-box/bin:$PATH
  export PATH

  export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH

  [[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
  [ -r $HOME/.rvm/scripts/rvm ] && source $HOME/.rvm/scripts/rvm

  # `Freeze' tty, so after any command terminal settings will be restored
  # used for passing C-s to vim, but have normal C-s otherwise.
  ttyctl -f
# }}}

# Autoload {{{
  autoload -U colors
  autoload compinit # Load completions for Ruby, Git, etc.

  colors
  compinit
# }}}

# Options {{{
  unsetopt menu_complete   # don't complete on first TAB
  # unsetopt flowcontrol
  setopt auto_menu
  setopt complete_in_word
  # setopt always_to_end

  setopt prompt_subst

  setopt share_history # same hist in any term
  setopt hist_ignore_all_dups
  setopt no_hist_beep

  setopt no_beep
  setopt auto_cd
# }}}

# Includes {{{
  source ~/.zsh/functions/ostype
  source ~/.zsh/functions/go
  source ~/.zsh/functions/chpwd
  source ~/.zsh/functions/el
  source ~/.zsh/functions/open_cmd
  source ~/.zsh/functions/web_search
  # source ~/.zsh/functions/mandelbrot

  source ~/.zsh/prompt
  source ~/.zsh/aliases
  source ~/.zsh/keybindings
  source ~/.zsh/completions
# }}}
