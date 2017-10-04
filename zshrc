# vim: foldmarker={{{,}}} foldlevel=0 foldmethod=marker
#
# zshrc of Gebhard Woestemeyer <g.woestemeyer@gmail.com>

# Environment {{{
  HISTSIZE=1000000
  SAVEHIST=1000000
  HISTFILE=~/.zsh/zhistory

  export CLICOLOR=yepp # osx ls
  if hash vimx >/dev/null 2>&1; then
    export EDITOR=vimx
  elif hash vim >/dev/null 2>&1; then
    export EDITOR=vim
  else
    export EDITOR=vi
  fi
  export PAGER='less -r'

  ORIGTERM=$TERM
  export TERM=screen-256color

  PATH=$HOME/opt/bin:$PATH
  PATH=$HOME/bin:$PATH
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
  setopt hist_ignore_space # don’t store lines starting with space

  setopt no_beep
  setopt auto_cd

  # dirs -v; cd -<num>
  export DIRSTACKSIZE=8
  setopt autopushd pushdminus pushdsilent pushdtohome
# }}}

# Locales {{{
  export LANG="en_US.UTF-8"
  export LANGUAGE="en_US"
  export LC_CTYPE="en_US.UTF-8"
  export LC_NUMERIC="en_US.UTF-8"
  export LC_TIME="en_US.UTF-8"
  export LC_COLLATE="en_US.UTF-8"
  export LC_MONETARY="en_US.UTF-8"
  export LC_MESSAGES="en_US.UTF-8"
  export LC_PAPER="en_US.UTF-8"
  export LC_NAME="en_US.UTF-8"
  export LC_ADDRESS="en_US.UTF-8"
  export LC_TELEPHONE="en_US.UTF-8"
  export LC_MEASUREMENT="en_US.UTF-8"
  export LC_IDENTIFICATION="en_US.UTF-8"
  export LC_ALL="en_US.UTF-8"
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
  source ~/.zsh/keychain

  # source private .zsh/private
  [ -r ~/.zsh/private ] && source ~/.zsh/private
# }}}
