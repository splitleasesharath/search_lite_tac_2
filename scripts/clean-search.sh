#!/bin/bash

# Clean TAC Search (search-page-2) build artifacts
# Removes dist/, node_modules/, and build caches

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Get script directory and project root
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( dirname "$SCRIPT_DIR" )"
SEARCH_APP_DIR="$PROJECT_ROOT/app/search-page-2"

echo -e "${BLUE}Cleaning TAC Search build artifacts...${NC}"
echo ""

# Check if search-page-2 directory exists
if [ ! -d "$SEARCH_APP_DIR" ]; then
    echo -e "${RED}Error: Search application directory not found at $SEARCH_APP_DIR${NC}"
    exit 1
fi

# Change to search app directory
cd "$SEARCH_APP_DIR"

# Parse command line arguments
CLEAN_DEPS=false
if [ "$1" = "--all" ] || [ "$1" = "-a" ]; then
    CLEAN_DEPS=true
fi

# Clean dist directory
if [ -d "dist" ]; then
    echo -e "${YELLOW}Removing dist/...${NC}"
    rm -rf dist
    echo -e "${GREEN}✓ dist/ removed${NC}"
else
    echo -e "${BLUE}dist/ not found (already clean)${NC}"
fi

# Clean node build caches
if [ -d ".vite" ]; then
    echo -e "${YELLOW}Removing .vite cache...${NC}"
    rm -rf .vite
    echo -e "${GREEN}✓ .vite/ removed${NC}"
fi

# Clean node_modules if requested
if [ "$CLEAN_DEPS" = true ]; then
    if [ -d "node_modules" ]; then
        echo -e "${YELLOW}Removing node_modules/...${NC}"
        rm -rf node_modules
        echo -e "${GREEN}✓ node_modules/ removed${NC}"
    else
        echo -e "${BLUE}node_modules/ not found${NC}"
    fi

    if [ -f "package-lock.json" ]; then
        echo -e "${YELLOW}Removing package-lock.json...${NC}"
        rm -f package-lock.json
        echo -e "${GREEN}✓ package-lock.json removed${NC}"
    fi
fi

echo ""
echo -e "${GREEN}✓ Clean complete!${NC}"
echo ""

if [ "$CLEAN_DEPS" = false ]; then
    echo -e "${BLUE}To also remove node_modules/, run:${NC}"
    echo "  ./scripts/clean-search.sh --all"
    echo ""
fi

echo -e "${BLUE}To rebuild:${NC}"
if [ "$CLEAN_DEPS" = true ]; then
    echo "  npm install"
fi
echo "  ./scripts/build-search.sh"
