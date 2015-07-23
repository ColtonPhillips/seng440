# R/G/B        [0...255]
# Y            [16...235]
# Cb/Cr        [16...240]

import sys 
import time
r = int(sys.argv[1])
g = int(sys.argv[2])
b = int(sys.argv[3])

y = 16 + ((66 * r + 129 * g + 25 * b) >> 8) 
cb = 128 + ((-38 * r - 74 * g + 112 * b) >> 8)
cr = 128 + ((112 * r - 94 * g - 18 * b) >> 8)

#y = 16 + 0.257 * r + 0.504 * g + 0.098 * b;
#cb = 128 - 0.148 * r - 0.291 * g + 0.439 * b;
#cr = 128 + 0.439 * r - 0.368 * g - 0.071 * b;

#y = int(round(y))
#cb = int(round(cb))
#cr = int(round(cr))
print ("RGB: ", r, g, b)
print ("YCbCr: ", y, cb, cr)
