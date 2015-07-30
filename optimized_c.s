        .arch armv4t
        .fpu softvfp
        .eabi_attribute 20, 1
        .eabi_attribute 21, 1
        .eabi_attribute 23, 3
        .eabi_attribute 24, 1
        .eabi_attribute 25, 1
        .eabi_attribute 26, 2
        .eabi_attribute 30, 2
        .eabi_attribute 18, 4
        .file   "rgb2ycbcr_fp_test.c"
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
        cmp     r3, r1
        mov     r0, r1
        bxle    lr
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
        @ args = 0, pretend = 0, frame = 8
        @ frame_needed = 0, uses_anonymous_args = 0
        stmfd   sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
        ldr     r0, [r1, #4]
        sub     sp, sp, #28
        mov     r4, r1
        bl      atoi
        mov     fp, r0
        ldr     r0, [r4, #8]
        bl      atoi
        str     r0, [sp, #20]
        ldr     r0, [r4, #12]
        bl      atoi
        mov     r3, r0
        ldr     r0, [sp, #20]
        mov     r2, fp, asl #8
        mov     ip, fp, asl #3
        add     ip, ip, r2
        mov     r4, r0, asl #2
        mov     r2, r0, asl #6
        mov     r5, fp, asl #7
        add     r4, r4, r2
        ldr     r2, [sp, #20]
        ldr     lr, [sp, #20]
        sub     r5, r5, fp, asl #5
        mov     r0, r3, asl #5
        add     r5, r5, fp
        mov     r1, r3, asl #3
        mov     sl, r2, asl #3
        mov     r2, r2, asl #8
        add     r1, r1, r0
        add     sl, sl, r2
        mov     r8, lr, asl #5
        mov     r2, lr, asl #12
        mov     r0, r5, asl #2
        rsb     r4, lr, r4
        add     r5, r5, r0
        rsb     ip, fp, ip
        ldr     r0, [sp, #20]
        add     r8, r8, r2
        add     sl, sl, lr
        mov     r2, r3, asl #4
        mov     lr, r3, asl #2
        add     lr, lr, r2
        mov     r9, fp, asl #10
        mov     r2, r3, asl #10
        mov     ip, ip, asl #2
        mov     sl, sl, asl #3
        rsb     sl, r0, sl
        add     ip, ip, fp
        sub     r9, r9, fp, asl #6
        mov     r6, r1, asl #2
        mov     r7, r4, asl #4
        add     r8, r8, r0
        sub     r0, r2, r3, asl #6
        mov     r2, r5, asl #2
        rsb     r9, fp, r9
        add     r1, r1, r6
        rsb     r7, r4, r7
        add     r5, r5, r2
        mov     ip, ip, asl #2
        ldr     r2, [sp, #20]
        rsb     ip, fp, ip
        add     r1, r1, r3
        mov     r4, r9, asl #4
        mov     r6, lr, asl #3
        mov     r8, r8, asl #2
        mov     r7, r7, asl #3
        rsb     r4, r9, r4
        rsb     r6, lr, r6
        rsb     r8, r2, r8
        rsb     lr, r3, r0
        rsb     r7, r2, r7
        mov     ip, ip, asl #2
        mov     r2, sl, asl #3
        mov     r1, r1, asl #2
        add     sl, sl, r2
        add     r6, r6, r3
        rsb     ip, fp, ip
        mov     r8, r8, asl #1
        rsb     r1, r3, r1
        sub     r5, fp, r5, asl #2
        sub     r7, r7, r7, asl #2
        mov     r0, lr, asl #4
        mov     r4, r4, asl #1
        add     ip, ip, r8
        rsb     r5, sl, r5
        rsb     r0, lr, r0
        add     r4, r4, r7
        mov     r2, r6, asl #5
        mov     r1, r1, asl #3
        add     r6, r6, r2
        rsb     r1, r3, r1
        mov     r0, r0, asl #1
        add     ip, ip, #32768
        add     r5, r5, #32768
        add     r4, r4, #32768
        add     ip, ip, r1
        add     r5, r5, r0
        rsb     r4, r6, r4
        mov     ip, ip, asr #16
        mov     r5, r5, asr #16
        mov     r4, r4, asr #16
        add     ip, ip, #16
        add     r5, r5, #128
        add     r4, r4, #128
        cmp     ip, #255
        movge   ip, #255
        cmp     r5, #240
        movge   r5, #240
        cmp     r4, #240
        movge   r4, #240
        cmp     ip, #16
        movlt   ip, #16
        cmp     r5, #16
        movlt   r5, #16
        cmp     r4, #16
        movlt   r4, #16
        mov     r1, fp
        ldr     r2, [sp, #20]
        ldr     r0, .L7
        str     ip, [sp, #0]
        str     r5, [sp, #4]
        str     r4, [sp, #8]
        bl      printf
        add     sp, sp, #28
        ldmfd   sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
        bx      lr
.L8:
        .align  2
.L7:
        .word   .LC0
        .size   main, .-main
        .section        .rodata.str1.4,"aMS",%progbits,1
        .align  2
.LC0:
        .ascii  "('RGB', %i, %i, %i, 'YCbCr', %i, %i, %i)\012\000"
        .ident  "GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
        .section        .note.GNU-stack,"",%progbits
