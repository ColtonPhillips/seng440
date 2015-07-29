-bash-4.2$ cat b.s
        .arch armv4t
        .fpu softvfp
        .eabi_attribute 20, 1
        .eabi_attribute 21, 1
        .eabi_attribute 23, 3
        .eabi_attribute 24, 1
        .eabi_attribute 25, 1
        .eabi_attribute 26, 2
        .eabi_attribute 30, 1
        .eabi_attribute 18, 4
        .file   "rgb2ycbcr_fp.c"
        .text
        .align  2
        .global clamp
        .type   clamp, %function
clamp:
        @ Function supports interworking.
        @ args = 0, pretend = 0, frame = 0
        @ frame_needed = 0, uses_anonymous_args = 0
        @ link register save eliminated.
        mov     r3, r0
        mov     r0, r1
        cmp     r3, r1
        bxlt    lr
        cmp     r2, r3
        movlt   r0, r2
        movge   r0, r3
        bx      lr
        .size   clamp, .-clamp
        .align  2
        .global main
        .type   main, %function
main:
        @ Function supports interworking.
        @ args = 0, pretend = 0, frame = 0
        @ frame_needed = 0, uses_anonymous_args = 0
        stmfd   sp!, {r4, lr}
        ldr     r0, [r1, #4]
        bl      atoi
        mov     r3, r0
        mov     r1, r0, asl #3
        mov     r2, r0, asl #8
        add     r1, r1, r2
        rsb     r1, r0, r1
        mov     r1, r1, asl #2
        add     r1, r1, r0
        mov     r1, r1, asl #2
        rsb     r1, r0, r1
        mov     r1, r1, asl #2
        ldr     r0, .L6
        rsb     r1, r3, r1
        bl      printf
        ldmfd   sp!, {r4, lr}
        bx      lr
.L7:
        .align  2
.L6:
        .word   .LC0
        .size   main, .-main
        .section        .rodata.str1.4,"aMS",%progbits,1
        .align  2
.LC0:
        .ascii  "%i\000"
        .ident  "GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
        .section        .note.GNU-stack,"",%progbits
