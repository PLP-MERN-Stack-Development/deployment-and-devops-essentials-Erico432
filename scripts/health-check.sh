#!/bin/bash
BACKEND_URL=${1:-"http://localhost:5000"}
FRONTEND_URL=${2:-"http://localhost:3000"}

echo "Ìø• Running health checks..."

echo "Checking backend at $BACKEND_URL/health..."
backend_response=$(curl -s -o /dev/null -w "%{http_code}" "$BACKEND_URL/health")

if [ "$backend_response" -eq 200 ]; then
    echo "‚úÖ Backend is healthy (Status: $backend_response)"
else
    echo "‚ùå Backend health check failed (Status: $backend_response)"
    exit 1
fi

echo "Checking frontend at $FRONTEND_URL..."
frontend_response=$(curl -s -o /dev/null -w "%{http_code}" "$FRONTEND_URL")

if [ "$frontend_response" -eq 200 ]; then
    echo "‚úÖ Frontend is accessible (Status: $frontend_response)"
else
    echo "‚ùå Frontend check failed (Status: $frontend_response)"
    exit 1
fi

echo "Ìæâ All health checks passed!"
