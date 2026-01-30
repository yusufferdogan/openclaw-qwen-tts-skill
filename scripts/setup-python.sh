#!/usr/bin/env bash
set -euo pipefail
if ! command -v conda >/dev/null 2>&1; then
  echo "Installing Miniforge..."
  URL="https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh"
  curl -LfsS "$URL" -o /tmp/miniforge.sh
  bash /tmp/miniforge.sh -b -p "$HOME/miniforge3"
fi
source "$HOME/miniforge3/etc/profile.d/conda.sh"
conda create -y -n qwen3-tts-py312 python=3.12 >/dev/null
conda activate qwen3-tts-py312
pip -q install --upgrade pip
pip -q install qwen-tts soundfile huggingface_hub || true
pip -q install "qwen-tts>=0.0.4,<0.0.6" soundfile huggingface_hub || true
echo "ENV_READY: $(python -V)"
