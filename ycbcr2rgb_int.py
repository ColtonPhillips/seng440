#http://www.equasys.de/colorconversion.html
#// Y            [16...235]
#// Cb/Cr        [16...240]
#// R/G/B        [0...255]
import sys
y = sys.argv[1]
cb = sys.argv[2]
cr = sys.argv[3]
yM = int(y) - 16
cbM = int(cb) - 128
crM = int(cr) - 128


r = (298 * yM + 409 * crM) >> 8
g = (298 * yM - 100 * cbM - 208 * crM) >> 8
b = (298 * yM - 94 * cbM - 18 * crM) >> 8

#r = 1.164 * yM + 1.596 * crM;
#g = 1.164 * yM - 0.392 * cbM - 0.813 * crM;
#b = 1.164 * yM - 0.368 * cbM - 0.071 * crM;
#r = int(round(r))
#g = int(round(g))
#b = int(round(b))

print ("RGB", r,g,b, "YCbCr", y, cb, cr)
