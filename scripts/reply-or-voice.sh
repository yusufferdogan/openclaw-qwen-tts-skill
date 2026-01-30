#!/usr/bin/env bash
# Decide to send plain text or generate voice based on a toggle file.
# Usage: bash scripts/reply-or-voice.sh "Your message" [speaker] [lang]
set -euo pipefail
MSG=${1:-}
SPEAKER=${2:-Ryan}
LANG=${3:-English}
FLAG="$HOME/.clawdbot/flags/voice_replies.enabled"
if [ -f "$FLAG" ]; then
  TEXT="$MSG" SPEAKER="$SPEAKER" LANG="$LANG" bash "$(dirname "$0")/voice-reply.sh"
else
  echo "$MSG"
fi
