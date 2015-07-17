#include <stdio.h>
#define round(x) ((x)>=0?(int)((x)+0.5):(int)((x)-0.5))
// Y		[16...235]
// Cb/Cr	[16...240]
// R/G/B	[0...255] 
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
	float _b = 1.164 * yM - 0.368 * cbM - 0.071 * crM;
	
	int r = round(_r);
	int g = round(_g);
	int b = round(_b);

	printf("In: Y: %i, Cb: %i, Cr: %i\n\n", y, cb, cr);
	printf("Float: _R: %f, _G: %f, _B: %f\n\n", _r, _g, _b);
	printf("Int: R: %i, G: %i, B: %i\n\n", r, g, b);
}
