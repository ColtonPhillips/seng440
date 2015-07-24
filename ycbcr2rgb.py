#http://www.equasys.de/colorconversion.html
#// Y            [16...235]
#// Cb/Cr        [16...240]
#// R/G/B        [0...255]
import sys

def clamp(n, minn, maxn):
	return max(min(maxn, n), minn)

y = int(sys.argv[1])
cb = int(sys.argv[2])
cr = int(sys.argv[3])
yM = int(y) - 16
cbM = int(cb) - 128
crM = int(cr) - 128

r = 1.164 * yM + 1.596 * crM;
g = 1.164 * yM - 0.392 * cbM - 0.813 * crM;
b = 1.164 * yM - 0.368 * cbM - 0.071 * crM;

r = int(round(r))
g = int(round(g))
b = int(round(b))

r = clamp(r,0,255)
g = clamp(g,0,255)
b = clamp(b,0,255)

print ("RGB", r,g,b, "YCbCr", y, cb, cr)
