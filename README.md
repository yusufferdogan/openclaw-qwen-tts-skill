# openclaw-qwen-tts-skill

Generate multilingual CustomVoice samples with Qwen3‑TTS and assemble a Remotion video showcasing the voices. Also includes one‑off voice replies and an optional "auto voice reply" toggle.

<p align="center">
  <b>Qwen3‑TTS (0.6B/1.7B) • 10 languages • instruction/styling • Remotion 1080×1920 render</b>
</p>

## ✨ Features
- One‑shot env setup (Conda Py3.12) and Qwen‑TTS install
- Batch audio generation for 9 preset speakers (EN by default)
- Remotion project + render script (vertical 1080×1920, per‑speaker scenes)
- One‑off TTS voice replies from any text (WAV path printed)
- Toggle to default all replies to voice (agent‑friendly)

## 🧩 Prereqs
- macOS with Homebrew
- Conda/Miniforge (auto‑installed if missing)
- Node 20+ (auto‑managed via Volta if missing)
- FFmpeg (system provided on macOS; if missing: `brew install ffmpeg`)

## 🚀 Quick Start
Clone or download this repo, then run:

```bash
# 1) Python env + Qwen‑TTS
bash scripts/setup-python.sh

# 2) Generate audio samples (English text by default)
TEXT="This is a voice test." bash scripts/generate-audio.sh
# -> Audio: /Users/yusuf/clawd/tmp/qwen_samples/*_EN.wav

# 3) Render Remotion video (30s, 1080×1920)
bash scripts/render-remotion.sh
# -> Video: /Users/yusuf/clawd/projects/qwen3-tts-demo/out/QwenDemo.mp4
```

## 🗣️ One‑off Voice Replies
Generate a single WAV from arbitrary text and chosen speaker:

```bash
TEXT="Your message here" SPEAKER=Ryan LANG=English bash scripts/voice-reply.sh
# Prints a path like: /Users/yusuf/clawd/tmp/qwen_voice/voice-<ts>.wav
```

### Toggle auto‑voice replies
Some agents/tools can respect a local toggle file and prefer voice output by default. Use:

```bash
bash scripts/enable-voice-replies.sh   # ON: use TTS by default
bash scripts/disable-voice-replies.sh  # OFF: use text

# Wrapper that checks the toggle:
bash scripts/reply-or-voice.sh "Your message" Ryan English
```

## 🔧 Configuration
- Change the text for samples: `TEXT="Your line" bash scripts/generate-audio.sh`
- Change language / speakers in `scripts/generate-audio.py`
- Switch model (quality/perf): set env `MODEL_ID`, e.g.
  - `Qwen/Qwen3-TTS-12Hz-0.6B-CustomVoice` (faster)
  - `Qwen/Qwen3-TTS-12Hz-1.7B-CustomVoice` (higher quality)
- Remotion scene timing: edit `sceneDur` in `src/QwenDemo.tsx`

## 🗂️ Project Layout
```
skills/openclaw-qwen-tts-skill/
  SKILL.md                  # Skill spec (for agent systems)
  README.md                 # This file
  scripts/
    setup-python.sh         # Conda Py3.12 + qwen-tts install
    generate-audio.py       # Batch generation logic
    generate-audio.sh       # Wrapper (sets env + calls python)
    render-remotion.sh      # Build/copy audio + render Remotion video
    tts-once.py             # One‑off TTS → WAV
    voice-reply.sh          # TEXT→WAV with chosen speaker/lang
    enable-voice-replies.sh # Toggle ON
    disable-voice-replies.sh# Toggle OFF
    reply-or-voice.sh       # Toggle‑aware wrapper
projects/qwen3-tts-demo/    # Remotion project (auto‑used by render script)
```

## 🗣️ Speakers (CustomVoice preset)
- Vivian (zh), Serena (zh), Uncle_Fu (zh), Dylan (zh/Beijing), Eric (zh/Sichuan)
- Ryan (en), Aiden (en), Ono_Anna (ja), Sohee (ko)

Tip: You can synthesize in any supported language, but quality is best in the native language of each speaker.

## ⚠️ Notes
- CPU works but is slower; GPU + FlashAttention 2 recommended for 1.7B.
- Streaming generation is supported by the model API, not used in these batch scripts.
- Voice cloning requires the Base model; this repo focuses on CustomVoice.

## 🆘 Troubleshooting
- `pip/accelerate` resolution issues: Use the provided `setup-python.sh` (Py3.12 env)
- `remotion` CLI not found: `npm i` in the Remotion project or use the included render script
- 404 for audio in render: ensure audio files exist under `projects/qwen3-tts-demo/public/audio` (the render script copies them)

---
MIT © 2026 OpenClaw
