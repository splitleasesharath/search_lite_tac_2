#!/bin/bash

# Start TAC Search (search-page-2) Application
# This starts the Python development server for the search page

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

echo -e "${BLUE}Starting TAC Search Application...${NC}"
echo ""

# Check if search-page-2 directory exists
if [ ! -d "$SEARCH_APP_DIR" ]; then
    echo -e "${RED}Error: Search application directory not found at $SEARCH_APP_DIR${NC}"
    exit 1
fi

# Change to search app directory
cd "$SEARCH_APP_DIR"

# Check if server.py exists
if [ ! -f "server.py" ]; then
    echo -e "${RED}Error: server.py not found in $SEARCH_APP_DIR${NC}"
    exit 1
fi

# Check if config files exist
if [ ! -f "js/config.js" ]; then
    echo -e "${YELLOW}Warning: js/config.js not found. Make sure your configuration is set up.${NC}"
fi

# Check if React components are built
if [ ! -d "dist" ] || [ ! -f "dist/schedule-selector.js" ]; then
    echo -e "${YELLOW}React components not built. Building them now...${NC}"
    npm run build:components || {
        echo -e "${RED}Failed to build React components${NC}"
        exit 1
    }
    echo -e "${GREEN}✓ React components built successfully${NC}"
fi

echo -e "${GREEN}Starting Python server on http://localhost:8000${NC}"
echo -e "${BLUE}Press Ctrl+C to stop the server${NC}"
echo ""

# Start Python server
python server.py
