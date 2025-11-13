#!/bin/bash
set -e

echo "Ì∫Ä Starting deployment process..."

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

check_requirements() {
    echo "Checking requirements..."
    
    if ! command -v node &> /dev/null; then
        echo -e "${RED}‚ùå Node.js is not installed${NC}"
        exit 1
    fi
    
    if ! command -v npm &> /dev/null; then
        echo -e "${RED}‚ùå npm is not installed${NC}"
        exit 1
    fi
    
    if ! command -v git &> /dev/null; then
        echo -e "${RED}‚ùå Git is not installed${NC}"
        exit 1
    fi
    
    echo -e "${GREEN}‚úÖ All requirements met${NC}"
}

build_frontend() {
    echo -e "${YELLOW}Ì≥¶ Building frontend...${NC}"
    cd frontend
    npm ci
    npm run build
    cd ..
    echo -e "${GREEN}‚úÖ Frontend build complete${NC}"
}

build_backend() {
    echo -e "${YELLOW}Ì≥¶ Building backend...${NC}"
    cd backend
    npm ci
    cd ..
    echo -e "${GREEN}‚úÖ Backend dependencies installed${NC}"
}

run_tests() {
    echo -e "${YELLOW}Ì∑™ Running tests...${NC}"
    
    cd frontend
    npm test -- --watchAll=false --passWithNoTests
    cd ..
    
    cd backend
    npm test -- --passWithNoTests
    cd ..
    
    echo -e "${GREEN}‚úÖ All tests passed${NC}"
}

main() {
    check_requirements
    
    echo ""
    read -p "Run tests before deployment? (y/n): " run_tests_choice
    if [ "$run_tests_choice" = "y" ]; then
        run_tests
    fi
    
    echo ""
    read -p "Build frontend? (y/n): " build_frontend_choice
    if [ "$build_frontend_choice" = "y" ]; then
        build_frontend
    fi
    
    echo ""
    read -p "Build backend? (y/n): " build_backend_choice
    if [ "$build_backend_choice" = "y" ]; then
        build_backend
    fi
    
    echo ""
    echo -e "${GREEN}Ìæâ Deployment preparation complete!${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Push your code to GitHub"
    echo "2. GitHub Actions will automatically deploy"
    echo "3. Or manually deploy using 'vercel --prod' for frontend"
}

main
