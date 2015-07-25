#This program calculates the list of integers necessary to convert from RGB to YCbCr and RGB to YCbCr

import sys 

n = int(sys.argv[1])
def convert(f):
	return (f * pow(2,n))

def print_value(f):
	print()
	print(f,convert(f))
	print(f,int(round(convert(f))))

#y = 16 + 0.257 * r + 0.504 * g + 0.098 * b;
#cb = 128 - 0.148 * r - 0.291 * g + 0.439 * b;
#cr = 128 + 0.439 * r - 0.368 * g - 0.071 * b;
#r = 1.164 * yM + 1.596 * crM;
#g = 1.164 * yM - 0.392 * cbM - 0.813 * crM;
#b = 1.164 * yM - 0.368 * cbM - 0.071 * crM;
matrix_values = [0.257, 0.504, 0.098,
		-0.148, -0.291, 0.439,
		-0.368, -0.071,
		1.164, 1.596, 
		-0.392, -0.813,
		-0.368, -0.071]

for x in matrix_values:
	print_value(x)

