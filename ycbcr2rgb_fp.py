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

r = (76284 * yM + 104595 * crM + 32768) 		>> 16
g = (76284 * yM - 25690 * cbM - 53281 * crM + 32768) 	>> 16
b = (76284 * yM + 135725 * cbM + 32768)			>> 16

r = clamp(r,0,255)
g = clamp(g,0,255)
b = clamp(b,0,255)

print ("RGB", r,g,b, "YCbCr", y, cb, cr)
