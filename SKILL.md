---
name: qwen3-tts-remotion
description: Generate multilingual CustomVoice samples with Qwen3‑TTS and assemble a Remotion video showcasing the voices. Includes local setup (Conda Py3.12), audio generation, and Remotion render.
---

# Qwen3‑TTS + Remotion Skill

This skill automates:
- Creating a Python 3.12 Conda env and installing `qwen-tts` (0.6B/1.7B CustomVoice)
- Generating 9 speaker samples in English (or chosen language)
- Rendering a vertical 1080×1920 Remotion video that plays each sample with a title card
- Optional: Creating one‑off voice replies from any text using Qwen3‑TTS and returning a local WAV path

## Prereqs
- macOS with Homebrew
- Conda/Miniforge (auto-installed if missing)
- Node 20+ (Volta auto-installed if missing)
- FFmpeg (system)

## Quick Start

```bash
# 1) Prepare env (Conda + Python 3.12) and install qwen-tts
bash scripts/setup-python.sh

# 2) Generate audio samples (English text by default)
TEXT="This is a voice test." bash scripts/generate-audio.sh

# 3) Build Remotion project and render
bash scripts/render-remotion.sh

# Output
# - Audio: clawd/tmp/qwen_samples/*_EN.wav
# - Video: projects/qwen3-tts-demo/out/QwenDemo.mp4
```

## Voice replies (send any text as a voice message)
Generate a single WAV from arbitrary text and chosen speaker:

```bash
TEXT="Your message here" SPEAKER=Ryan LANG=English bash scripts/voice-reply.sh
# -> prints /Users/yusuf/clawd/tmp/qwen_voice/voice-<ts>.wav
```

Toggle auto-voice replies for agents/tools that consult the flag:
```bash
bash scripts/enable-voice-replies.sh   # turn ON (use TTS by default)
bash scripts/disable-voice-replies.sh  # turn OFF (send text)
```
Wrapper that respects the toggle:
```bash
bash scripts/reply-or-voice.sh "Your message" Ryan English
```

This path can be sent directly in chat systems that accept file uploads.

## Customization
- Change the text: `TEXT="Your line here" bash scripts/generate-audio.sh`
- Change language/speaker list inside `scripts/generate-audio.py`
- Adjust scene timing in `src/QwenDemo.tsx` (sceneDur)

## Notes
- For higher quality or cloning, switch to 1.7B or Base models in `generate-audio.py`.
- On CPU, generation is slower; GPU with FlashAttention 2 is recommended.
