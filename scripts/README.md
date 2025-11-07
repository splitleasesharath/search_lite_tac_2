# Scripts Directory

This directory contains utility scripts for development, deployment, and maintenance of the Split Lease Search application.

## 📁 Directory Structure

```
scripts/
├── infrastructure/     # Application lifecycle management
├── git/               # Git and version control utilities
├── package/           # Package management and merge drivers
└── README.md          # This file
```

## 🚀 Infrastructure Scripts

### Application Management
- **start.sh** - Start the Python development server
- **stop_apps.sh** - Stop all running application services
- **check_ports.sh** - Check port availability before starting services

### Database Management
- **reset_db.sh** - Reset the database to a clean state
- **purge_tree.sh** - Clean up git worktrees

### Environment
- **copy_dot_env.sh** - Copy environment configuration files

## 🔧 Git & Webhook Scripts

### Webhook Management
- **expose_webhook.sh** - Expose local webhook for testing
- **kill_trigger_webhook.sh** - Stop the webhook trigger process

### Pull Request & Issue Management
- **delete_pr.sh** - Clean up pull requests
- **clear_issue_comments.sh** - Clear issue comments in bulk

## 📦 Package Management Scripts

### Dependency Management
- **sort-package-json.js** - Alphabetize package.json dependencies
- **sort-package-deps.mjs** - Advanced dependency sorting with conflict detection
- **pre-commit-deps.js** - Pre-commit hook for dependency validation
- **resolve-package-conflicts.sh** - Resolve npm package conflicts automatically

### Git Merge Driver
- **npm-merge-driver.js** - Custom merge driver for package.json conflicts
- **setup-git-merge-driver.sh** - Configure git to use the custom merge driver

## 📝 Usage Examples

### Start Development Server
```bash
./scripts/start.sh
```

### Reset Database
```bash
./scripts/reset_db.sh
```

### Sort Package Dependencies
```bash
node scripts/sort-package-json.js
```

### Setup Git Merge Driver
```bash
./scripts/setup-git-merge-driver.sh
```

## 🔐 Permissions

All shell scripts require execute permissions:
```bash
chmod +x scripts/*.sh
```

## 🛠️ Maintenance

These scripts are optimized for the TAC Search application. When adding new scripts:

1. Place them in the appropriate category directory (if organized)
2. Add documentation here
3. Follow the existing naming conventions
4. Include error handling and logging
5. Make scripts idempotent where possible

## 📚 Related Documentation

- [Main README](../README.md)
- [Package Management Guide](../docs/package-management.md)
- [Development Workflow](../docs/development.md)

## ⚠️ Important Notes

- Always test scripts in a safe environment first
- Some scripts may require specific environment variables
- Review database scripts carefully before execution
- Webhook scripts require network access and proper configuration
