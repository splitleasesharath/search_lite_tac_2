# Deprecated Scripts

This directory contains infrastructure scripts that were created for other applications in the project ecosystem, NOT for the TAC Search (search-page-2) application.

## Why These Scripts Were Deprecated

All 16 scripts in this directory were designed for:
1. **Natural Language SQL Interface** - A different application (`app/server` and `app/client`)
2. **ADW (AI Development Workflow)** - Infrastructure for managing isolated development environments
3. **Generic utilities** - General-purpose tools not specific to search-page-2

The TAC Search application (`app/search-page-2`) has its own dedicated tooling and workflow via `package.json` scripts and doesn't need these infrastructure scripts.

## Script Inventory

### Group A: Natural Language SQL Interface (Different App)
| Script | Purpose | Why Deprecated |
|--------|---------|----------------|
| `start.sh` | Starts backend (`app/server`) + frontend (`app/client`) | For different app, not search-page-2 |
| `stop_apps.sh` | Stops Natural Language SQL Interface services | For different app |
| `reset_db.sh` | Resets `app/server/db/database.db` | Different app; search-page-2 uses Supabase |

### Group B: ADW Infrastructure
| Script | Purpose | Why Deprecated |
|--------|---------|----------------|
| `purge_tree.sh` | Removes ADW git worktrees from `trees/` | General infrastructure, not app-specific |
| `check_ports.sh` | Checks ADW ports (9100-9214) and app ports | General infrastructure |
| `expose_webhook.sh` | Exposes `adws/trigger_webhook.py` via Cloudflare | ADW infrastructure |
| `kill_trigger_webhook.sh` | Stops webhook server on port 8001 | ADW infrastructure |

### Group C: Environment Configuration
| Script | Purpose | Why Deprecated |
|--------|---------|----------------|
| `copy_dot_env.sh` | Copies .env from `../tac-6/` directory | For different project structure |

### Group D: GitHub/Git Utilities
| Script | Purpose | Why Deprecated |
|--------|---------|----------------|
| `delete_pr.sh` | Deletes GitHub pull requests | Generic utility, can be moved to personal tools |
| `clear_issue_comments.sh` | Clears GitHub issue comments | Generic utility, can be moved to personal tools |

### Group E: Package Management Utilities
| Script | Purpose | Why Deprecated |
|--------|---------|----------------|
| `npm-merge-driver.js` | Custom Git merge driver for package-lock.json | Generic Node.js utility |
| `sort-package-json.js` | Sorts package.json dependencies | Generic Node.js utility |
| `sort-package-deps.mjs` | Advanced dependency sorting | Generic Node.js utility |
| `pre-commit-deps.js` | Pre-commit dependency validation | Generic Node.js utility |
| `resolve-package-conflicts.sh` | Resolves npm package conflicts | Generic Node.js utility |
| `setup-git-merge-driver.sh` | Configures git merge driver | Generic Node.js utility |

## TAC Search (search-page-2) Tooling

The search-page-2 application uses its own tooling via `package.json`:

```json
{
  "scripts": {
    "start": "python server.py",
    "build": "npm run build:components && npm run build:cloudflare",
    "build:components": "vite build",
    "dev": "npm run dev:components",
    "serve": "python -m http.server 8000",
    "lint": "eslint 'js/**/*.js' 'components/**/*.{js,jsx,ts,tsx}'",
    "lint:fix": "npm run lint -- --fix",
    "format": "prettier --write '**/*.{js,jsx,ts,tsx,json,css,md}'",
    "test": "npm run lint && npm run format:check && npm run type-check"
  }
}
```

**New dedicated scripts** are available in `scripts/` directory.

## Could These Scripts Be Useful?

### Package Management Utilities
The npm/package management utilities (`npm-merge-driver.js`, `sort-package-json.js`, etc.) are generic and could be useful for ANY Node.js project, including search-page-2. However:

- They're not search-page-2 specific
- Modern tooling (ESLint, Prettier) handles most of these needs
- Can be re-enabled if needed

### GitHub Utilities
The GitHub utilities (`delete_pr.sh`, `clear_issue_comments.sh`) are generic and could be useful, but:

- They're better suited as personal tools or global git aliases
- Not specific to the search-page-2 codebase
- Can use `gh` CLI directly instead

## How to Re-enable a Script

If you need any of these scripts:

1. **Copy it back to `scripts/`**:
   ```bash
   cp Dump/deprecated-scripts/script-name.sh scripts/
   ```

2. **Make it executable**:
   ```bash
   chmod +x scripts/script-name.sh
   ```

3. **Update it for search-page-2** if needed

## Migration Notes

### Natural Language SQL Interface → TAC Search
- **Old**: `app/server` + `app/client` with ports 8000, 5173
- **New**: `app/search-page-2` with `server.py` and static files

### Database Management
- **Old**: Local SQLite (`app/server/db/database.db`)
- **New**: Supabase cloud database

### Build Process
- **Old**: Separate backend/frontend servers
- **New**: Static site + Python server for local dev, Cloudflare for production

## Safe to Delete

You can safely delete this entire directory if you don't need the reference files:

```bash
rm -rf Dump/deprecated-scripts
```

None of these scripts are used by the current TAC Search (search-page-2) application.

---

**Deprecated Date**: 2025-11-06
**Total Scripts**: 16
**Reason**: Not specific to TAC Search (search-page-2) application
**Replacement**: New search-page-2 specific scripts in `scripts/` directory
