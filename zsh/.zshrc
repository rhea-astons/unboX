#### Path to your oh-my-zsh installation.
export ZSH=/Users/rsnts/.oh-my-zsh

#### Theme
ZSH_THEME="robbyrussell"

#### Options
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
export UPDATE_ZSH_DAYS=7
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

#### Plugins
plugins=(brew brew-cask git grunt gulp npm sublime vagrant)


#### User configuration
# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

#### Language environment
# export LANG=en_US.UTF-8

#### Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

#### Compilation flags
# export ARCHFLAGS="-arch x86_64"

#### ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#### Aliases
source ~/.aliases

#### Run archey
archey