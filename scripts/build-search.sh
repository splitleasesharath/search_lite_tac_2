#!/bin/bash

# Build TAC Search (search-page-2) Application
# This builds React components and Cloudflare deployment package

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Get script directory and project root
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( dirname "$SCRIPT_DIR" )"
SEARCH_APP_DIR="$PROJECT_ROOT/app/search-page-2"

echo -e "${BLUE}Building TAC Search Application...${NC}"
echo ""

# Check if search-page-2 directory exists
if [ ! -d "$SEARCH_APP_DIR" ]; then
    echo -e "${RED}Error: Search application directory not found at $SEARCH_APP_DIR${NC}"
    exit 1
fi

# Change to search app directory
cd "$SEARCH_APP_DIR"

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo -e "${YELLOW}node_modules not found. Installing dependencies...${NC}"
    npm install || {
        echo -e "${RED}Failed to install dependencies${NC}"
        exit 1
    }
    echo -e "${GREEN}✓ Dependencies installed${NC}"
fi

# Step 1: Build React components
echo -e "${BLUE}Step 1/2: Building React components...${NC}"
npm run build:components || {
    echo -e "${RED}Failed to build React components${NC}"
    exit 1
}
echo -e "${GREEN}✓ React components built successfully${NC}"
echo ""

# Step 2: Build Cloudflare deployment package
echo -e "${BLUE}Step 2/2: Building Cloudflare deployment package...${NC}"
npm run build:cloudflare || {
    echo -e "${RED}Failed to build Cloudflare package${NC}"
    exit 1
}
echo -e "${GREEN}✓ Cloudflare package built successfully${NC}"
echo ""

# Show build artifacts
echo -e "${GREEN}Build complete!${NC}"
echo ""
echo -e "${BLUE}Build artifacts:${NC}"
echo "  - React components: dist/schedule-selector.js"
echo "  - Cloudflare package: (check build output)"
echo ""
echo -e "${BLUE}To start the dev server:${NC}"
echo "  ./scripts/start-search.sh"
echo ""
echo -e "${BLUE}To run in watch mode:${NC}"
echo "  ./scripts/dev-search.sh"
