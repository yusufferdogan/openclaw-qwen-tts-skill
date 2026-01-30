import os
import torch
import soundfile as sf
from qwen_tts import Qwen3TTSModel

OUT_DIR = os.environ.get("OUT_DIR", "/Users/yusuf/clawd/tmp/qwen_samples")
TEXT = os.environ.get("TEXT", "This is a voice test.")
LANG = os.environ.get("LANG", "English")
MODEL_ID = os.environ.get("MODEL_ID", "Qwen/Qwen3-TTS-12Hz-0.6B-CustomVoice")
SPEAKERS = os.environ.get("SPEAKERS", "Vivian,Serena,Uncle_Fu,Dylan,Eric,Ryan,Aiden,Ono_Anna,Sohee").split(",")

os.makedirs(OUT_DIR, exist_ok=True)
model = Qwen3TTSModel.from_pretrained(MODEL_ID, device_map="cpu", dtype=torch.float32)

for spk in SPEAKERS:
    wavs, sr = model.generate_custom_voice(text=TEXT, language=LANG, speaker=spk, instruct="")
    sf.write(os.path.join(OUT_DIR, f"{spk}_EN.wav"), wavs[0], sr)
print("WROTE", OUT_DIR)
