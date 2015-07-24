# R/G/B        [0...255]
# Y            [16...235]
# Cb/Cr        [16...240]

import sys 
import time

def clamp(n, minn, maxn):
	return max(min(maxn, n), minn)

r = int(sys.argv[1])
g = int(sys.argv[2])
b = int(sys.argv[3])

y = 16 + 0.257 * r + 0.504 * g + 0.098 * b;
cb = 128 - 0.148 * r - 0.291 * g + 0.439 * b;
cr = 128 + 0.439 * r - 0.368 * g - 0.071 * b;

y = int(round(y))
cb = int(round(cb))
cr = int(round(cr))
y = clamp(y,16,235)
cb = clamp(cb,16,240)
cr = clamp(cr,16,240)

print ("RGB", r,g,b, "YCbCr", y, cb, cr)
