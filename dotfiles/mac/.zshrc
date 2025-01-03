# Path to your oh-my-zsh installation
export ZSH="/Users/kellyschroeder/.oh-my-zsh"

# Theme configuration
ZSH_THEME="robbyrussell"

# Initialize mise for version management
eval "$(mise activate)"

# Plugin configuration
plugins=(
    git
)

source $ZSH/oh-my-zsh.sh

# User configuration and environment
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Tool completions
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform 