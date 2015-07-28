#// Y            [16...235]
#// Cb/Cr        [16...240]
#// R/G/B        [0...255]

import os

for r in range(0,256):
	for g in range(0,256):
		for b in range(0,256):
			os.system("python rgb2ycbcr.py " + `r` + " " + `g` + " " + `b`)
