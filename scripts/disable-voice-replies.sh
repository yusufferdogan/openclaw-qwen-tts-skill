#!/usr/bin/env bash
set -euo pipefail
FLAG="$HOME/.clawdbot/flags/voice_replies.enabled"
rm -f "$FLAG"
echo "Voice replies: DISABLED"
