#!/bin/bash
echo "Ì¥ß Setting up environment variables..."

create_env_file() {
    local dir=$1
    local env_file="$dir/.env"
    local example_file="$dir/.env.example"
    
    if [ -f "$env_file" ]; then
        echo "‚ö†Ô∏è  $env_file already exists. Skipping..."
        return
    fi
    
    if [ ! -f "$example_file" ]; then
        echo "‚ùå $example_file not found!"
        return
    fi
    
    cp "$example_file" "$env_file"
    echo "‚úÖ Created $env_file from example"
}

create_env_file "backend"
create_env_file "frontend"

echo ""
echo "Ì≥ù Please update the .env files with your actual values:"
echo "   - backend/.env"
echo "   - frontend/.env"
