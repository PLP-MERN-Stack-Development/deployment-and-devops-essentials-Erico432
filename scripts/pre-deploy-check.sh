#!/bin/bash
echo "Ì≥ã Running pre-deployment checks..."

CHECKS_PASSED=0
CHECKS_FAILED=0

check_env_files() {
    echo -n "Checking environment files... "
    if [ -f "backend/.env" ] && [ -f "frontend/.env" ]; then
        echo "‚úÖ"
        ((CHECKS_PASSED++))
    else
        echo "‚ùå"
        echo "   Missing .env files. Run './scripts/setup-env.sh' first."
        ((CHECKS_FAILED++))
    fi
}

check_dependencies() {
    echo -n "Checking dependencies... "
    if [ -d "backend/node_modules" ] && [ -d "frontend/node_modules" ]; then
        echo "‚úÖ"
        ((CHECKS_PASSED++))
    else
        echo "‚ùå"
        echo "   Run 'npm install' in both backend and frontend directories."
        ((CHECKS_FAILED++))
    fi
}

check_git() {
    echo -n "Checking git status... "
    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo "‚úÖ"
        ((CHECKS_PASSED++))
    else
        echo "‚ùå"
        echo "   Not a git repository!"
        ((CHECKS_FAILED++))
    fi
}

check_env_files
check_dependencies
check_git

echo ""
echo "Ì≥ä Summary:"
echo "   Passed: $CHECKS_PASSED"
echo "   Failed: $CHECKS_FAILED"

if [ $CHECKS_FAILED -eq 0 ]; then
    echo ""
    echo "Ìæâ All checks passed! Ready to deploy."
    exit 0
else
    echo ""
    echo "‚ö†Ô∏è  Some checks failed. Please fix issues before deploying."
    exit 1
fi
