#This only exports worst case scenario numbers

import sys
import pprint
pp = pprint.PrettyPrinter(indent=3)
f_name = sys.argv[1]
with open(f_name,'r') as file:
	lines = file.read().split("\n")

lines = map(str.strip, lines)

def cycles(s):
	c = 0
	if (s == "add" or s == "adc" or s == "sub" or s == "rsb" or s == "sbc" or s == "and" or s == "orr" or s == "bic" or s == "eor" or s == "cmp" or s == "cmn" or s == "teq" or s == "tst" or s == "mov" or s == "mvn" or s == "clz"):
		c = 1
	if (s == "b" or s == "bl" or s == "bx" or s == "bxlt"):
		c = 3
	if (s == "ldr"):
		c = 3
	if (s == "str"):
		c = 2
	if (s == "mul"):
		c = 3
	if (s == "mle"):
		c = 2
	if (s == "ble" or s == "bge"):
		c = 2
	if (s == "movle" or s == "movlt" or s == "movge"):
		c = 2
	
	return c

count_dict = {}
current_item = "pre"
count_dict[current_item] = 0
for line in lines:
	first_word = line.split(' ',1)[0]
	if (first_word.endswith(":")):
		count_dict[first_word] = 0	
		current_item = first_word

	val = cycles(first_word)
	if (val == 0):
		print("?   " + line)
	else:
		print (str(val) + "   " + line)
		count_dict[current_item] += val	

print ("\n\n Cycles per section: \n")
pp.pprint(count_dict)
print ("TOTAL: " + str(sum(count_dict.values())))
