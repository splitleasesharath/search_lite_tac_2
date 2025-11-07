# Scripts Directory - TAC Search

This directory contains utility scripts specifically tailored for the **TAC Search (search-page-2)** application.

## 🎯 Purpose

These scripts provide a convenient command-line interface for common development tasks on the search-page-2 application, including:
- Starting the development server
- Building production assets
- Running quality checks
- Development workflow automation

## 📁 Available Scripts

### 🚀 Development Scripts

#### `start-search.sh`
Start the TAC Search Python development server.

```bash
./scripts/start-search.sh
```

**What it does:**
- Checks if React components are built (builds them if needed)
- Starts Python server on `http://localhost:8000`
- Serves the search page application

**Use when:** You want to run the application locally for testing/development.

---

#### `dev-search.sh`
Start development mode with automatic component rebuilding.

```bash
./scripts/dev-search.sh
```

**What it does:**
- Watches for changes in React components
- Automatically rebuilds components on file changes
- Runs Vite in watch mode

**Use when:** You're actively developing React components and want instant feedback.

---

### 🏗️ Build Scripts

#### `build-search.sh`
Build all production assets.

```bash
./scripts/build-search.sh
```

**What it does:**
1. Installs dependencies if needed
2. Builds React components (Vite)
3. Builds Cloudflare deployment package

**Use when:** Preparing for deployment or testing production builds.

---

#### `clean-search.sh`
Clean build artifacts and caches.

```bash
# Clean dist/ and caches only
./scripts/clean-search.sh

# Clean everything including node_modules/
./scripts/clean-search.sh --all
```

**What it does:**
- Removes `dist/` directory
- Removes `.vite/` cache
- Optionally removes `node_modules/` and `package-lock.json` (with `--all`)

**Use when:** You need a fresh build or troubleshooting build issues.

---

### ✅ Quality Assurance Scripts

#### `test-search.sh`
Run all quality checks.

```bash
./scripts/test-search.sh
```

**What it does:**
1. Runs ESLint on JavaScript/TypeScript files
2. Checks code formatting with Prettier
3. Runs TypeScript type checking

**Use when:** Before committing code or preparing for deployment.

**Exit codes:**
- `0` - All checks passed
- `1` - One or more checks failed

---

## 🔄 Typical Workflows

### First Time Setup
```bash
cd app/search-page-2
npm install
./scripts/build-search.sh
./scripts/start-search.sh
```

### Daily Development
```bash
# Terminal 1: Watch mode for component changes
./scripts/dev-search.sh

# Terminal 2: Run the server
cd app/search-page-2
python server.py

# Before committing
./scripts/test-search.sh
```

### Pre-Deployment
```bash
./scripts/test-search.sh          # Ensure quality
./scripts/clean-search.sh --all   # Fresh start
./scripts/build-search.sh         # Production build
./scripts/start-search.sh         # Test locally
```

## 🗂️ Script Locations

All scripts are located in the project root `scripts/` directory:

```
TAC - Search/
├── scripts/
│   ├── start-search.sh      # Start dev server
│   ├── dev-search.sh        # Watch mode
│   ├── build-search.sh      # Production build
│   ├── test-search.sh       # Quality checks
│   ├── clean-search.sh      # Clean artifacts
│   └── README.md            # This file
├── app/search-page-2/       # Application code
└── Dump/
    └── deprecated-scripts/  # Old infrastructure scripts
```

## 📋 Requirements

All scripts assume you're running from the project root directory and require:

- **Python 3.x** - For running `server.py`
- **Node.js 18+** - For npm and build tools
- **npm** - For package management

## 🆘 Troubleshooting

### Script won't execute
```bash
chmod +x scripts/*.sh
```

### "Directory not found" error
Ensure you're running scripts from the project root:
```bash
cd /path/to/TAC\ -\ Search
./scripts/start-search.sh
```

### Build fails
Try a clean rebuild:
```bash
./scripts/clean-search.sh --all
cd app/search-page-2
npm install
cd ../..
./scripts/build-search.sh
```

### Quality checks fail
Auto-fix what you can:
```bash
cd app/search-page-2
npm run lint:fix
npm run format
cd ../..
./scripts/test-search.sh
```

## 🔗 Related Documentation

- [Main README](../README.md)
- [Refactor Summary](../app/search-page-2/REFACTOR_SUMMARY.md)
- [JS Optimization Guide](../app/search-page-2/JS_OPTIMIZATION_GUIDE.md)
- [Package.json Scripts](../app/search-page-2/package.json)

## 📦 NPM Scripts vs Shell Scripts

The application also has npm scripts in `app/search-page-2/package.json`. The relationship:

| Task | Shell Script | NPM Script | When to Use |
|------|-------------|------------|-------------|
| Start server | `./scripts/start-search.sh` | `npm start` | Shell script (checks/builds components first) |
| Build all | `./scripts/build-search.sh` | `npm run build` | Either (shell script more verbose) |
| Watch mode | `./scripts/dev-search.sh` | `npm run dev` | Either (equivalent) |
| Quality checks | `./scripts/test-search.sh` | `npm test` | Either (shell script more detailed output) |
| Clean | `./scripts/clean-search.sh` | N/A | Shell script only |

**Recommendation**: Use shell scripts for full workflows, npm scripts for individual tasks.

## 🗑️ Deprecated Scripts

Old infrastructure scripts (for different applications) have been moved to:
```
Dump/deprecated-scripts/
```

See [Dump/deprecated-scripts/README.md](../Dump/deprecated-scripts/README.md) for details.

## 🔐 Security Notes

- Scripts do NOT modify or expose sensitive data
- No network requests except npm install and build processes
- No sudo/elevated permissions required
- Safe to run in any environment

## 📝 Contributing

When adding new scripts:

1. **Name pattern**: `<action>-search.sh`
2. **Add documentation** to this README
3. **Make executable**: `chmod +x scripts/new-script.sh`
4. **Test thoroughly** before committing
5. **Use consistent formatting** (see existing scripts)

## 📞 Support

For issues with scripts:
1. Check this README first
2. Review the [Main README](../README.md)
3. Check script comments for details
4. Verify requirements are met

---

**Last Updated**: 2025-11-06
**Total Scripts**: 5
**Status**: ✅ Active and maintained
**Application**: TAC Search (search-page-2)
