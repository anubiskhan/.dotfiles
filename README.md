# Development Environment Setup

## Prerequisites

- Homebrew
- mise (installed via Homebrew)

## Installation

1. Clone this repository
2. Create a symlink to the mise config:
   ```bash
   ln -s $(pwd)/.mise.toml ~/.mise.toml
   ```

3. Install Homebrew packages:
   ```bash
   brew bundle
   ```

4. Initialize mise:
   ```bash
   mise install
   ```

5. Add to your shell config (~/.zshrc or ~/.bashrc):
   ```bash
   eval "$(mise activate)"
   ```

## Database Setup

### PostgreSQL 
- Version: 14 (latest: 16.1)
- Start: `mise exec postgres -- pg_ctl start`
- Stop: `mise exec postgres -- pg_ctl stop`

### MySQL
- Version: 5.7 (latest: 8.0.35)
- Start: `mise exec mysql -- mysql.server start`
- Stop: `mise exec mysql -- mysql.server stop`

## Version Management

Current tool versions:
- Python: 3.10
- Node.js: LTS
- PostgreSQL: 14
- MySQL: 5.7
- Go: Latest

To update versions, modify `.mise.toml` and run `mise install`.

## Troubleshooting

### Path Issues
If you're having issues with command availability, verify your PATH:
```bash
mise env | grep PATH
```

### Version Issues
To verify installed versions:
```bash
mise current
```

To see available versions for a tool:
```bash
mise ls-remote python
```
