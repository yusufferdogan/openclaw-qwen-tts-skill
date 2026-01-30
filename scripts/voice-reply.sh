#!/usr/bin/env bash
# Usage: TEXT="Hello there" SPEAKER="Ryan" LANG="English" bash scripts/voice-reply.sh
set -euo pipefail
source "$HOME/miniforge3/etc/profile.d/conda.sh"
conda activate qwen3-tts-py312
TEXT=${TEXT:-Hello! This is a voice reply.}
SPEAKER=${SPEAKER:-Ryan}
LANG=${LANG:-English}
OUT=${OUT:-/Users/yusuf/clawd/tmp/qwen_voice/voice-$(date +%s).wav}
python "$(dirname "$0")/tts-once.py" --text "$TEXT" --speaker "$SPEAKER" --language "$LANG" --out "$OUT"
echo "$OUT"
