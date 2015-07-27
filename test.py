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

y = 16 + ((16843 * r + 33030 * g + 6423 * b + 32768)>> 16) 
cb = 128 + ((-9699 * r - 19071 * g + 28770 * b + 32768) >> 16)
cr = 128 + ((28770 * r - 24117 * g - 4653 * b + 32768) >> 16)

#y = 16 + 0.257 * r + 0.504 * g + 0.098 * b;
#cb = 128 - 0.148 * r - 0.291 * g + 0.439 * b;
#cr = 128 + 0.439 * r - 0.368 * g - 0.071 * b;

y = clamp(y,16,235)
cb = clamp(cb,16,240)
cr = clamp(cr,16,240)

print ("RGB", r,g,b, "YCbCr", y, cb, cr)
