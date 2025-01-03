# Cross-platform aliases
alias g='git'
alias ll='ls -la'

# Database aliases
alias pg-start="mise exec postgres@$(mise current postgres) -- pg_ctl start"
alias pg-stop="mise exec postgres@$(mise current postgres) -- pg_ctl stop"
alias pg-status="mise exec postgres@$(mise current postgres) -- pg_ctl status"

alias mysql-start="mise exec mysql@$(mise current mysql) -- mysql.server start"
alias mysql-stop="mise exec mysql@$(mise current mysql) -- mysql.server stop"
alias mysql-status="mise exec mysql@$(mise current mysql) -- mysql.server status"

# Version management aliases
alias list-dbs="echo 'PostgreSQL versions:' && mise ls postgres && echo '\nMySQL versions:' && mise ls mysql"
alias list-versions="mise ls"
alias current-versions="mise current"

# OS-specific aliases
case "$(uname)" in
    "Darwin")
        # Mac-specific aliases
        alias ls='ls -G'
        ;;
    "Linux")
        # Linux-specific aliases
        alias ls='ls --color=auto'
        ;;
esac

# Windows check (if using Git Bash or WSL)
if [[ "$(uname)" =~ "MINGW" ]] || [[ -n "$WINDIR" ]]; then
    # Windows-specific aliases
    alias open='explorer.exe'
fi