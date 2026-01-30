import os, argparse
import torch, soundfile as sf
from qwen_tts import Qwen3TTSModel

parser = argparse.ArgumentParser()
parser.add_argument('--text', required=True)
parser.add_argument('--speaker', default='Ryan')
parser.add_argument('--language', default='English')
parser.add_argument('--model', default='Qwen/Qwen3-TTS-12Hz-0.6B-CustomVoice')
parser.add_argument('--out', required=True)
args = parser.parse_args()

model = Qwen3TTSModel.from_pretrained(args.model, device_map='cpu', dtype=torch.float32)
wavs, sr = model.generate_custom_voice(text=args.text, language=args.language, speaker=args.speaker, instruct='')
os.makedirs(os.path.dirname(args.out), exist_ok=True)
sf.write(args.out, wavs[0], sr)
print(args.out)
