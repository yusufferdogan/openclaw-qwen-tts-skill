#!/usr/bin/env bash
set -euo pipefail
export VOLTA_HOME="$HOME/.volta"; export PATH="$VOLTA_HOME/bin:$PATH"
if ! command -v node >/dev/null 2>&1; then
  brew list volta >/dev/null 2>&1 || brew install volta
  volta install node@20
fi
PROJ="/Users/yusuf/clawd/projects/qwen3-tts-demo"
mkdir -p "$PROJ/public/audio"
cp -f /Users/yusuf/clawd/tmp/qwen_samples/*_EN.wav "$PROJ/public/audio/"
cd "$PROJ"
npm i --silent
./node_modules/.bin/remotion render src/index.ts QwenDemo out/QwenDemo.mp4
