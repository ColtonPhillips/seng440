import os
import sys

def take(s):
	print(s)
	os.system(s)

take("gcc rgb2ycbcr.c -o rgb2ycbcr.exe")
take("gcc rgb2ycbcr_fp.c -o rgb2ycbcr_fp.exe")
take("gcc ycbcr2rgb.c -o ycbcr2rgb.exe")
take("gcc ycbcr2rgb_fp.c -o ycbcr2rgb_fp.exe")

a1, a2, a3 = sys.argv[1], sys.argv[2], sys.argv[3]
_args = " " + a1 + " " + a2 + " " + a3
print ("ARGS: " + _args)

take(".\\rgb2ycbcr.exe" + _args) 
take(".\\rgb2ycbcr_fp.exe" + _args) 
take("python rgb2ycbcr.py" + _args) 
take("python rgb2ycbcr_fp.py" + _args) 

print()

take(".\\ycbcr2rgb.exe" + _args) 
take(".\\ycbcr2rgb_fp.exe" + _args) 
take("python ycbcr2rgb.py" + _args) 
take("python ycbcr2rgb_fp.py" + _args) 
