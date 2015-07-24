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
yM = y - 16
cbM = cb - 128
crM = cr - 128


r = (298 * yM + 409 * crM) >> 8
g = (298 * yM - 100 * cbM - 208 * crM) >> 8
b = (298 * yM - 94 * cbM - 18 * crM) >> 8
r = clamp(r,0,255)
g = clamp(g,0,255)
b = clamp(b,0,255)

#r = 1.164 * yM + 1.596 * crM;
#g = 1.164 * yM - 0.392 * cbM - 0.813 * crM;
#b = 1.164 * yM - 0.368 * cbM - 0.071 * crM;
#r = int(round(r))
#g = int(round(g))
#b = int(round(b))

print ("RGB", r,g,b, "YCbCr", y, cb, cr)
