# Create user bin directory if it doesn't exist
mkdir -p ~/bin

# Create and make the script executable
cat << 'EOF' > ~/bin/log_chat.sh
#!/bin/bash

# Get current date for filename
DATE=$(date +%Y-%m-%d_%H-%M-%S)
PROJECT_NAME=$1
TOPIC=$2

if [ -z "$PROJECT_NAME" ] || [ -z "$TOPIC" ]; then
    echo "Usage: log_chat.sh <project_name> <topic>"
    echo "Example: log_chat.sh twitter-to-gif docker-config"
    exit 1
fi

# Create directory structure if it doesn't exist
mkdir -p ~/.cursor/chat_logs/{by_date,by_project,by_topic}

# Create the log file with metadata header
cat << EOF > ~/.cursor/chat_logs/by_date/$DATE.md
# Chat Log: $DATE
## Project: $PROJECT_NAME
## Topic: $TOPIC

$(cat)

---
Tags: [$PROJECT_NAME, $TOPIC]
EOF

# Create symbolic links
ln -s "../by_date/$DATE.md" ~/.cursor/chat_logs/by_project/$PROJECT_NAME-$DATE.md
ln -s "../by_date/$DATE.md" ~/.cursor/chat_logs/by_topic/$TOPIC-$DATE.md

echo "Chat logged to: ~/.cursor/chat_logs/by_date/$DATE.md"
EOF

chmod +x ~/bin/log_chat.sh