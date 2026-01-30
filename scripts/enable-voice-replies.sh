#!/usr/bin/env bash
set -euo pipefail
FLAG="$HOME/.clawdbot/flags/voice_replies.enabled"
mkdir -p "$(dirname "$FLAG")"
echo on > "$FLAG"
echo "Voice replies: ENABLED ($FLAG)"
