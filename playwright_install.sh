#!/opt/homebrew/bin/bash

# Install Node.js via Homebrew
brew install node

# Install Playwright and MCP server
npm install -g playwright @playwright/mcp

# Install Playwright browsers
npx playwright install

# Update Cursor mcp.json
mkdir -p ~/.cursor
cat > ~/.cursor/mcp.json << 'EOF'
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": [
        "-y",
        "@playwright/mcp"
      ]
    }
  }
}
EOF

echo "Installation complete! Restart Cursor to use Playwright MCP."
