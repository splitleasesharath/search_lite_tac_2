# Scripts Directory Analysis

## Executive Summary

**Finding**: ALL 16 scripts in the `scripts/` directory are for **other applications** and **general infrastructure**, NOT specifically for the TAC Search (search-page-2) application.

## Script Categorization

### Group A: Natural Language SQL Interface Scripts (Different App)
These scripts manage a completely different application located in `app/server` and `app/client`:

1. **start.sh** - Starts "Natural Language SQL Interface"
   - Backend: `app/server` (Python/uvicorn)
   - Frontend: `app/client` (Vite)
   - Ports: 8000, 5173
   - ❌ NOT for search-page-2

2. **stop_apps.sh** - Stops "Natural Language SQL Interface and ADW Services"
   - Kills processes on ports 5173, 8000, 8001, 9100-9114, 9200-9214
   - ❌ NOT for search-page-2

3. **reset_db.sh** - Resets database
   - Copies `app/server/db/backup.db` to `app/server/db/database.db`
   - ❌ NOT for search-page-2 (uses Supabase, not local DB)

### Group B: ADW (AI Development Workflow) Infrastructure
These scripts manage git worktrees and isolated development environments:

4. **purge_tree.sh** - Removes ADW worktrees
   - Deletes worktrees from `trees/` directory
   - Manages ADW-specific branches
   - Kills processes on ADW-specific ports (9100-9114, 9200-9214)
   - ❌ NOT for search-page-2

5. **check_ports.sh** - Checks ADW and application ports
   - Monitors ports: 5173, 8000, 8001, 9100-9114, 9200-9214
   - Lists git worktrees
   - ❌ NOT for search-page-2

6. **expose_webhook.sh** - Exposes webhook via Cloudflare tunnel
   - Runs `adws/trigger_webhook.py` publicly
   - ❌ NOT for search-page-2

7. **kill_trigger_webhook.sh** - Stops webhook server
   - Kills `trigger_webhook.py` on port 8001
   - ❌ NOT for search-page-2

### Group C: Environment Configuration
8. **copy_dot_env.sh** - Copies .env files
   - Source: `../tac-6/` directory
   - Destination: `app/server/.env`
   - ❌ NOT for search-page-2 (uses different structure)

### Group D: GitHub/Git Utilities (Generic)
9. **delete_pr.sh** - Deletes GitHub pull requests
   - Generic GitHub utility
   - ⚠️ Could be useful, but not search-page-2 specific

10. **clear_issue_comments.sh** - Clears GitHub issue comments
    - Generic GitHub utility
    - ⚠️ Could be useful, but not search-page-2 specific

### Group E: Package Management Utilities (Generic Node.js)
11. **npm-merge-driver.js** - Custom Git merge driver for package-lock.json
    - Generic npm utility for any Node.js project
    - ⚠️ Useful for search-page-2 but not specific to it

12. **sort-package-json.js** - Sorts package.json dependencies alphabetically
    - Generic npm utility
    - ⚠️ Useful for search-page-2 but not specific to it

13. **sort-package-deps.mjs** - Advanced dependency sorting
    - Generic npm utility
    - ⚠️ Useful for search-page-2 but not specific to it

14. **pre-commit-deps.js** - Pre-commit dependency validation
    - Generic npm utility
    - ⚠️ Useful for search-page-2 but not specific to it

15. **resolve-package-conflicts.sh** - Resolves npm package conflicts
    - Generic npm utility
    - ⚠️ Useful for search-page-2 but not specific to it

16. **setup-git-merge-driver.sh** - Configures git merge driver
    - Generic git utility
    - ⚠️ Useful for search-page-2 but not specific to it

## Recommendation

### Action Plan:

1. **Move ALL scripts to Dump/deprecated-scripts/**
   - These scripts are for other applications or general infrastructure
   - None are specifically tailored to search-page-2

2. **Create NEW search-page-2 specific scripts:**
   - `start-search.sh` - Start search-page-2 Python server
   - `build-search.sh` - Build search-page-2 components
   - `dev-search.sh` - Development mode with watch
   - `deploy-search.sh` - Deploy to Cloudflare
   - `test-search.sh` - Run all tests (lint, format, type-check)

3. **Keep package management utilities accessible (optional):**
   - Could symlink npm utilities if still useful
   - Or integrate into search-page-2 package.json scripts

## Search-Page-2 Current Setup

The search-page-2 application currently uses:

```json
// app/search-page-2/package.json
{
  "scripts": {
    "start": "python server.py",
    "build": "npm run build:components && npm run build:cloudflare",
    "build:components": "vite build",
    "dev": "npm run dev:components",
    "serve": "python -m http.server 8000"
  }
}
```

It has its own:
- Python server: `app/search-page-2/server.py`
- Vite build: `app/search-page-2/vite.config.js`
- Cloudflare build: `app/search-page-2/build-cloudflare.js`
- Supabase database (not local SQLite)

## Conclusion

**Zero scripts** in the current `scripts/` directory are specifically for the TAC Search (search-page-2) application. All scripts should be moved to `Dump/deprecated-scripts/` and replaced with search-page-2 specific utilities.

---

**Analysis Date**: 2025-11-06
**Analyzed By**: Claude Code
**Total Scripts**: 16
**Search-Page-2 Specific**: 0
**Recommendation**: Move all to Dump, create new tailored scripts
