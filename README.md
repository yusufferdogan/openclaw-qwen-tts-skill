# openclaw-qwen-tts-skill (TTS-only)

Qwen3‑TTS skill for OpenClaw/Clawdbot — TTS-only. No Remotion.

Contents:
- SKILL.md — how to use
- scripts/ — setup + generation + voice reply helpers

Quick start:
```bash
bash scripts/setup-python.sh
TEXT="Hello from Qwen TTS" bash scripts/generate-audio.sh
```

Voice reply:
```bash
TEXT="Your message" SPEAKER=Ryan LANG=English bash scripts/voice-reply.sh
```
