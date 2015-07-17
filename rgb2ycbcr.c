#include <stdio.h>
#define round(x) ((x)>=0?(int)((x)+0.5):(int)((x)-0.5))
 
// R/G/B 	[0...255]
// Y		[16...235]
// Cb/Cr 	[16...240]

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

	printf("R: %i, G: %i, B: %i\n\n", r, g, b);
	printf("Float: _Y: %f, _Cb: %f, _Cr: %f\n\n", _y, _cb, _cr);
	printf("Int: Y: %i, Cb: %i, Cr: %i\n\n", y, cb, cr);
}
