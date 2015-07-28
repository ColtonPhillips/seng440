#This program calculates the list of integers necessary to convert from RGB to YCbCr and RGB to YCbCr

import sys 

n = int(sys.argv[1])
def convert(f):
	return (f * pow(2,n))

def print_value(f):
	print()
	print(f,convert(f))
	print(f,int(round(convert(f))))

matrix_values = [0.257, 0.504, 0.098,
		-0.148, -0.291, 0.439,
		-0.368, -0.071,
		1.164, 1.596, 
		-0.392, -0.813,
		-0.368, -0.071,2.071]

for x in matrix_values:
	print_value(x)

