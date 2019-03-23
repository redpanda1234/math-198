import os
import subprocess

orig_dir = os.getcwd()

fnames = os.listdir()
gifs = [fname for fname in fnames if ".gif" in fname]
no_wind = [fname[:-4] for fname in gifs if "wind" not in fname]

for fname in no_wind:
    os.chdir(fname)
    os.subprocess(f"ffmpeg -i {fname}.gif -vsync 0 {fname}$03d.png")
    os.subprocess(f"ffmpeg -i {fname}-wind.gif -vsync 0 {fname}-wind$03d.png")
    os.chdir("..")
