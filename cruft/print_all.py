import os
os.system("gcc ycbcr2rgb.c -o ycbcr2rgb.exe")
os.system("python print_py_ycbcr2rgb.py > .\out\py_ycbcr2rgb.txt")
os.system("python print_c_ycbcr2rgb.py > .\out\c_ycbcr2rgb.txt")
