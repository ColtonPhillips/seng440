#include <stdio.h>
#define round(x) ((x)>=0?(int)((x)+0.5):(int)((x)-0.5))
// Y		[16...235]
// Cb/Cr	[16...240]
// R/G/B	[0...255] 

// return x clamped between a and b
inline int clamp(int x, int a, int b) {

	if (x < a) { return a;}
	else if (x > b) {return b;}
	else { return x;}
}

int main(int argc, char *argv[])
{
	int y = atoi(argv[1]);
	int cb = atoi(argv[2]);
	int cr = atoi(argv[3]); 
	int yM = y - 16;
	int cbM = cb - 128;
	int crM = cr - 128;

	float _r = 1.164 * yM + 1.596 * crM;
	float _g = 1.164 * yM - 0.392 * cbM - 0.813 * crM;
	float _b = 1.164 * yM + 2.017  * cbM;
	
	int r = round(_r);
	int g = round(_g);
	int b = round(_b);
	
	r = clamp(r,0,255);
	g = clamp(g,0,255);
	b = clamp(b,0,255);

	printf("('RGB', %i, %i, %i, 'YCbCr', %i, %i, %i)\n", r, g, b, y, cb, cr);
}
