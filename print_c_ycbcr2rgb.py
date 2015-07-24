#// Y            [16...235]
#// Cb/Cr        [16...240]
#// R/G/B        [0...255]

import os

for y in range(16,236):
	for cb in range(16,241):
		for cr in range(16,241):
			os.system(".\ycbcr2rgb.exe " + `y` + " " + `cb` + " " + `cr`)
