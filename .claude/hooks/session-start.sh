#!/bin/bash
# Prepare this checkout's REA runtime in Claude Code cloud sessions so the
# project MCP server, CLI, tests, and linters work without a manual build.
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR"
npm install --no-audit --no-fund
npm run build:cached
