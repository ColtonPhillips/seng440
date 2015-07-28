#include <stdio.h>
#define round(x) ((x)>=0?(int)((x)+0.5):(int)((x)-0.5))
 
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

	float _y = 16 + 0.257 * r + 0.504 * g + 0.098 * b;
	float _cb = 128 - 0.148 * r - 0.291 * g + 0.439 * b;
	float _cr = 128 + 0.439 * r - 0.368 * g - 0.071 * b;

	int y = round(_y); 
	int cb = round(_cb); 
	int cr = round(_cr); 
	
	y = clamp(y,16,255);
	cb = clamp(cb,16,240);
	cr = clamp(cr,16,240);

	printf("('RGB', %i, %i, %i, 'YCbCr', %i, %i, %i)\n", r, g, b, y, cb, cr);
}
