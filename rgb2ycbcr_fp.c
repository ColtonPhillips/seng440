#include <stdio.h>
// R/G/B 	[0...255]
// Y		[16...235]
// Cb/Cr 	[16...240]

// return x clamped between a and b
inline int clamp(int x, int a, int b) {

	if (x < a) { return a;}
	else if (x > b) {return b;}
	else { return x;}
}

int main(int argc, char *argv[])
{
	int r = atoi(argv[1]);
	int g = atoi(argv[2]);
	int b = atoi(argv[3]); 

	int y  = 16  + ((16843 * r + 33030 * g + 6423  * b + 32768) >> 16);
	int cb = 128 + ((-9699 * r - 19071 * g + 28770 * b + 32768) >> 16);
	int cr = 128 + ((28770 * r - 24117 * g - 4653  * b + 32768) >> 16);

	y = clamp(y,16,255);
	cb = clamp(cb,16,240);
	cr = clamp(cr,16,240);

	printf("('RGB', %i, %i, %i, 'YCbCr', %i, %i, %i)\n", r, g, b, y, cb, cr);
}
