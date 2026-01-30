#!/usr/bin/env bash
set -euo pipefail
source "$HOME/miniforge3/etc/profile.d/conda.sh"
conda activate qwen3-tts-py312
export OUT_DIR="/Users/yusuf/clawd/tmp/qwen_samples"
export TEXT="${TEXT:-This is a voice test.}"
python "$(dirname "$0")/generate-audio.py"
echo "Audio ready at $OUT_DIR"
