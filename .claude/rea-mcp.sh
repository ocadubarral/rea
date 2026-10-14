#!/bin/sh
# Start the REA MCP server from this checkout so Claude Code sessions in this
# repository use the fork's own runtime. Install and build output goes to
# stderr because stdout carries the MCP stdio protocol.
set -eu
cd "$(dirname "$0")/.."
{
  [ -d node_modules ] || npm ci
  npm run build:cached
} >&2
exec node scripts/rea.mjs mcp
