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
        cmp     r3, r1
        mov     r0, r1
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
        stmfd   sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
        ldr     r0, [r1, #4]
        sub     sp, sp, #20
        mov     r4, r1
        bl      atoi
        mov     r9, r0
        ldr     r0, [r4, #8]
        bl      atoi
        mov     fp, r0
        ldr     r0, [r4, #12]
        bl      atoi
        mov     r3, r9, asl #8
        mov     lr, r0
        mov     r2, r9, asl #3
        add     r2, r2, r3
        mov     r0, r0, asl #3
        mov     r3, lr, asl #5
        add     r0, r0, r3
        rsb     r2, r9, r2
        mov     r4, fp, asl #12
        mov     r5, r0, asl #2
        mov     r3, fp, asl #6
        mov     r2, r2, asl #2
        mov     ip, fp, asl #5
        mov     r1, r9, asl #7
        mov     r6, fp, asl #2
        add     ip, ip, r4
        add     r0, r0, r5
        add     r6, r6, r3
        add     r2, r2, r9
        mov     r3, fp, asl #8
        sub     r1, r1, r9, asl #5
        mov     r5, fp, asl #3
        rsb     r6, fp, r6
        add     r5, r5, r3
        add     r1, r1, r9
        mov     r3, lr, asl #4
        add     ip, ip, fp
        mov     r2, r2, asl #2
        add     r0, r0, lr
        mov     sl, r9, asl #10
        mov     r7, lr, asl #2
        add     r7, r7, r3
        mov     r4, r1, asl #2
        mov     r3, r6, asl #4
        mov     ip, ip, asl #2
        rsb     r2, r9, r2
        mov     r0, r0, asl #2
        add     r5, r5, fp
        sub     sl, sl, r9, asl #6
        mov     r8, lr, asl #10
        add     r1, r1, r4
        rsb     r3, r6, r3
        rsb     sl, r9, sl
        mov     r4, r7, asl #3
        rsb     ip, fp, ip
        mov     r2, r2, asl #2
        rsb     r0, lr, r0
        mov     r5, r5, asl #3
        sub     r8, r8, lr, asl #6
        rsb     r4, r7, r4
        rsb     r5, fp, r5
        rsb     r8, lr, r8
        rsb     r2, r9, r2
        mov     r7, r1, asl #2
        mov     ip, ip, asl #1
        mov     r0, r0, asl #3
        mov     r3, r3, asl #3
        mov     r6, sl, asl #4
        add     ip, ip, r2
        add     r1, r1, r7
        add     r4, r4, lr
        rsb     r0, lr, r0
        rsb     r6, sl, r6
        rsb     r3, fp, r3
        mov     r7, r5, asl #3
        mov     r2, r8, asl #4
        add     ip, ip, r0
        add     r5, r5, r7
        rsb     r2, r8, r2
        sub     r1, r9, r1, asl #2
        sub     r3, r3, r3, asl #2
        mov     r6, r6, asl #1
        mov     r0, r4, asl #5
        rsb     r1, r5, r1
        add     r3, r3, r6
        add     r4, r4, r0
        mov     ip, ip, asr #16
        mov     r2, r2, asl #1
        add     ip, ip, #16
        add     r1, r1, r2
        rsb     r3, r4, r3
        mov     r1, r1, asr #16
        mov     r3, r3, asr #16
        cmp     ip, #15
        add     r1, r1, #128
        add     r3, r3, #128
        movle   ip, #16
        ble     .L7
        cmp     ip, #255
        movge   ip, #255
.L7:
        cmp     r1, #15
        movle   r5, #16
        ble     .L9
        cmp     r1, #240
        movlt   r5, r1
        movge   r5, #240
.L9:
        cmp     r3, #15
        movle   r4, #16
        ble     .L11
        cmp     r3, #240
        movlt   r4, r3
        movge   r4, #240
.L11:
        mov     r1, r9
        mov     r2, fp
        mov     r3, lr
        ldr     r0, .L13
        str     ip, [sp, #0]
        str     r5, [sp, #4]
        str     r4, [sp, #8]
        bl      printf
        add     sp, sp, #20
        ldmfd   sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
        bx      lr
.L14:
        .align  2
.L13:
        .word   .LC0
        .size   main, .-main
        .section        .rodata.str1.4,"aMS",%progbits,1
        .align  2
.LC0:
        .ascii  "('RGB', %i, %i, %i, 'YCbCr', %i, %i, %i)\012\000"
        .ident  "GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
        .section        .note.GNU-stack,"",%progbits