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
        @ args = 0, pretend = 0, frame = 16
        @ frame_needed = 0, uses_anonymous_args = 0
        stmfd   sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
        ldr     r0, [r1, #4]
        sub     sp, sp, #36
        mov     r4, r1
        bl      atoi
        mov     fp, r0
        ldr     r0, [r4, #8]
        bl      atoi
        mov     r9, r0
        ldr     r0, [r4, #12]
        bl      atoi
        mov     r3, fp, asl #8
        mov     r2, fp, asl #3
        add     r2, r2, r3
        mov     r4, r0, asl #3
        mov     r3, r0, asl #5
        mov     lr, r0
        add     r4, r4, r3
        mov     r0, fp, asl #7
        mov     r3, r9, asl #6
        mov     r5, r9, asl #2
        mov     r1, r9, asl #12
        add     r5, r5, r3
        mov     ip, r9, asl #5
        mov     r3, r9, asl #8
        sub     r0, r0, fp, asl #5
        mov     r7, r9, asl #3
        add     ip, ip, r1
        add     r7, r7, r3
        mov     r1, r4, asl #2
        add     r0, r0, fp
        mov     r3, lr, asl #2
        add     r4, r4, r1
        str     r3, [sp, #28]
        mov     r1, r0, asl #2
        add     r0, r0, r1
        ldr     r1, [sp, #28]
        mov     r3, lr, asl #4
        add     r3, r1, r3
        str     r3, [sp, #24]
        rsb     r2, fp, r2
        mov     r3, r0, asl #2
        rsb     r5, r9, r5
        str     r3, [sp, #20]
        mov     r2, r2, asl #2
        ldr     r3, [sp, #24]
        mov     r6, r5, asl #4
        add     r2, r2, fp
        rsb     r6, r5, r6
        mov     r2, r2, asl #2
        mov     r5, r3, asl #3
        add     ip, ip, r9
        ldr     r3, [sp, #20]
        mov     sl, fp, asl #10
        rsb     r2, fp, r2
        mov     ip, ip, asl #2
        add     r4, r4, lr
        add     r7, r7, r9
        sub     sl, sl, fp, asl #6
        rsb     sl, fp, sl
        add     r0, r0, r3
        mov     r2, r2, asl #2
        ldr     r3, [sp, #24]
        rsb     ip, r9, ip
        mov     r4, r4, asl #2
        mov     r7, r7, asl #3
        mov     r8, lr, asl #10
        rsb     r7, r9, r7
        mov     ip, ip, asl #1
        rsb     r2, fp, r2
        rsb     r4, lr, r4
        sub     r8, r8, lr, asl #6
        mov     r6, r6, asl #3
        mov     r1, sl, asl #4
        add     r2, r2, ip
        rsb     r5, r3, r5
        rsb     r8, lr, r8
        mov     r3, r7, asl #3
        rsb     r1, sl, r1
        mov     r4, r4, asl #3
        rsb     r6, r9, r6
        add     r7, r7, r3
        add     r5, r5, lr
        add     r2, r2, #32768
        rsb     r4, lr, r4
        sub     r0, fp, r0, asl #2
        mov     r1, r1, asl #1
        sub     r6, r6, r6, asl #2
        mov     ip, r8, asl #4
        add     r2, r2, r4
        rsb     r0, r7, r0
        rsb     ip, r8, ip
        add     r1, r1, r6
        mov     r3, r5, asl #5
        add     r5, r5, r3
        mov     r2, r2, asr #16
        add     r0, r0, #32768
        mov     ip, ip, asl #1
        add     r1, r1, #32768
        rsb     r1, r5, r1
        add     r0, r0, ip
        add     r2, r2, #16
        mov     r0, r0, asr #16
        mov     r1, r1, asr #16
        cmp     r2, #15
        add     r0, r0, #128
        add     r1, r1, #128
        movle   r5, #16
        ble     .L7
        cmp     r2, #255
        movlt   r5, r2
        movge   r5, #255
.L7:
        cmp     r0, #15
        movle   r4, #16
        ble     .L9
        cmp     r0, #240
        movlt   r4, r0
        movge   r4, #240
.L9:
        cmp     r1, #15
        movle   ip, #16
        ble     .L11
        cmp     r1, #240
        movlt   ip, r1
        movge   ip, #240
.L11:
        mov     r1, fp
        mov     r2, r9
        mov     r3, lr
        ldr     r0, .L13
        str     r5, [sp, #0]
        stmib   sp, {r4, ip}    @ phole stm
        bl      printf
        add     sp, sp, #36
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