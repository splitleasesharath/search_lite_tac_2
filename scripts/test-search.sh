#!/bin/bash

# Test TAC Search (search-page-2) Application
# Runs linting, formatting checks, and type checking

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

echo -e "${BLUE}Running TAC Search Quality Checks...${NC}"
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
    echo ""
fi

# Track overall success
OVERALL_SUCCESS=true

# Step 1: Linting
echo -e "${BLUE}Step 1/3: Running ESLint...${NC}"
if npm run lint; then
    echo -e "${GREEN}✓ Linting passed${NC}"
else
    echo -e "${RED}✗ Linting failed${NC}"
    echo -e "${YELLOW}Tip: Run 'npm run lint:fix' to auto-fix issues${NC}"
    OVERALL_SUCCESS=false
fi
echo ""

# Step 2: Format checking
echo -e "${BLUE}Step 2/3: Checking code formatting...${NC}"
if npm run format:check; then
    echo -e "${GREEN}✓ Formatting check passed${NC}"
else
    echo -e "${RED}✗ Formatting check failed${NC}"
    echo -e "${YELLOW}Tip: Run 'npm run format' to auto-format files${NC}"
    OVERALL_SUCCESS=false
fi
echo ""

# Step 3: Type checking
echo -e "${BLUE}Step 3/3: Running TypeScript type checking...${NC}"
if npm run type-check; then
    echo -e "${GREEN}✓ Type checking passed${NC}"
else
    echo -e "${RED}✗ Type checking failed${NC}"
    OVERALL_SUCCESS=false
fi
echo ""

# Summary
echo -e "${BLUE}═══════════════════════════════════${NC}"
if [ "$OVERALL_SUCCESS" = true ]; then
    echo -e "${GREEN}✓ All quality checks passed!${NC}"
    echo ""
    echo -e "${BLUE}Ready to commit and deploy.${NC}"
    exit 0
else
    echo -e "${RED}✗ Some quality checks failed${NC}"
    echo ""
    echo -e "${YELLOW}Quick fixes:${NC}"
    echo "  npm run lint:fix     # Auto-fix linting issues"
    echo "  npm run format       # Auto-format code"
    echo ""
    echo -e "${YELLOW}Then run this script again to verify.${NC}"
    exit 1
fi
