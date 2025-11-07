#!/bin/bash

# Development mode for TAC Search (search-page-2)
# This watches for component changes and rebuilds automatically

set -e

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

echo -e "${BLUE}Starting TAC Search in Development Mode...${NC}"
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

echo -e "${GREEN}Starting component watch mode...${NC}"
echo -e "${BLUE}Components will rebuild automatically on changes${NC}"
echo -e "${YELLOW}Press Ctrl+C to stop${NC}"
echo ""

# Start watch mode
npm run dev:components
