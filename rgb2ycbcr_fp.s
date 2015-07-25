-bash-4.2$ arm-linux-gcc -S rgb2ycbcr_fp.c rgb2ycbcr_fp.c
-bash-4.2$ ls
example.exe  hello.c  hello.exe  rgb2ycbcr_fp.c  rgb2ycbcr_fp.s
-bash-4.2$ cat rgb2ycbcr_fp.s
        .arch armv4t
        .fpu softvfp
        .eabi_attribute 20, 1
        .eabi_attribute 21, 1
        .eabi_attribute 23, 3
        .eabi_attribute 24, 1
        .eabi_attribute 25, 1
        .eabi_attribute 26, 2
        .eabi_attribute 30, 6
        .eabi_attribute 18, 4
        .file   "rgb2ycbcr_fp.c"
        .text
        .align  2
        .global clamp
        .type   clamp, %function
clamp:
        @ Function supports interworking.
        @ args = 0, pretend = 0, frame = 16
        @ frame_needed = 1, uses_anonymous_args = 0
        @ link register save eliminated.
        str     fp, [sp, #-4]!
        add     fp, sp, #0
        sub     sp, sp, #20
        str     r0, [fp, #-8]
        str     r1, [fp, #-12]
        str     r2, [fp, #-16]
        ldr     r2, [fp, #-8]
        ldr     r3, [fp, #-12]
        cmp     r2, r3
        bge     .L2
        ldr     r3, [fp, #-12]
        str     r3, [fp, #-20]
        b       .L3
.L2:
        ldr     r2, [fp, #-8]
        ldr     r3, [fp, #-16]
        cmp     r2, r3
        ble     .L4
        ldr     r3, [fp, #-16]
        str     r3, [fp, #-20]
        b       .L3
.L4:
        ldr     r3, [fp, #-8]
        str     r3, [fp, #-20]
.L3:
        ldr     r3, [fp, #-20]
        mov     r0, r3
        add     sp, fp, #0
        ldmfd   sp!, {fp}
        bx      lr
        .size   clamp, .-clamp
        .section        .rodata
        .align  2
.LC0:
        .ascii  "('RGB', %i, %i, %i, 'YCbCr', %i, %i, %i)\012\000"
        .text
        .align  2
        .global main
        .type   main, %function
main:
        @ Function supports interworking.
        @ args = 0, pretend = 0, frame = 40
        @ frame_needed = 1, uses_anonymous_args = 0
        stmfd   sp!, {fp, lr}
        add     fp, sp, #4
        sub     sp, sp, #56
        str     r0, [fp, #-32]
        str     r1, [fp, #-36]
        ldr     r3, [fp, #-36]
        add     r3, r3, #4
        ldr     r3, [r3, #0]
        mov     r0, r3
        bl      atoi
        mov     r3, r0
        str     r3, [fp, #-28]
        ldr     r3, [fp, #-36]
        add     r3, r3, #8
        ldr     r3, [r3, #0]
        mov     r0, r3
        bl      atoi
        mov     r3, r0
        str     r3, [fp, #-24]
        ldr     r3, [fp, #-36]
        add     r3, r3, #12
        ldr     r3, [r3, #0]
        mov     r0, r3
        bl      atoi
        mov     r3, r0
        str     r3, [fp, #-20]
        ldr     r1, [fp, #-28]
        mov     r3, r1
        mov     r3, r3, asl #3
        mov     r2, r3, asl #5
        add     r3, r3, r2
        rsb     r3, r1, r3
        mov     r3, r3, asl #2
        add     r3, r3, r1
        mov     r3, r3, asl #2
        rsb     r3, r1, r3
        mov     r3, r3, asl #2
        rsb     r0, r1, r3
        ldr     r1, [fp, #-24]
        mov     r3, r1
        mov     r3, r3, asl #5
        mov     r2, r3, asl #7
        add     r3, r3, r2
        add     r3, r3, r1
        mov     r3, r3, asl #2
        rsb     r3, r1, r3
        mov     r3, r3, asl #1
        add     r0, r0, r3
        ldr     r1, [fp, #-20]
        mov     r3, r1
        mov     r3, r3, asl #3
        mov     r2, r3, asl #2
        add     r3, r3, r2
        mov     r2, r3, asl #2
        add     r3, r3, r2
        add     r3, r3, r1
        mov     r3, r3, asl #2
        rsb     r3, r1, r3
        mov     r3, r3, asl #3
        rsb     r3, r1, r3
        add     r3, r0, r3
        mov     r3, r3, asr #16
        add     r3, r3, #16
        str     r3, [fp, #-16]
        ldr     r1, [fp, #-28]
        mov     r3, r1
        mov     r2, r3, asl #5
        mov     r3, r2, asl #2
        rsb     r3, r2, r3
        add     r3, r3, r1
        mov     r2, r3, asl #2
        add     r3, r3, r2
        mov     r2, r3, asl #2
        add     r3, r3, r2
        mov     r3, r3, asl #2
        rsb     r0, r1, r3
        rsb     r0, r0, #0
        ldr     r1, [fp, #-24]
        mov     r3, r1
        mov     r3, r3, asl #3
        mov     r2, r3, asl #5
        add     r3, r3, r2
        add     r3, r3, r1
        mov     r3, r3, asl #3
        rsb     r3, r1, r3
        mov     r2, r3, asl #3
        add     r3, r3, r2
        rsb     r3, r3, #0
        add     r0, r0, r3
        ldr     r1, [fp, #-20]
        mov     r3, r1
        mov     r3, r3, asl #6
        mov     r2, r3, asl #4
        rsb     r2, r3, r2
        rsb     r2, r1, r2
        mov     r3, r2, asl #4
        rsb     r3, r2, r3
        mov     r3, r3, asl #1
        add     r3, r0, r3
        mov     r3, r3, asr #16
        add     r3, r3, #128
        str     r3, [fp, #-12]
        ldr     r1, [fp, #-28]
        mov     r3, r1
        mov     r3, r3, asl #6
        mov     r2, r3, asl #4
        rsb     r2, r3, r2
        rsb     r2, r1, r2
        mov     r3, r2, asl #4
        rsb     r3, r2, r3
        mov     r3, r3, asl #1
        mov     r0, r3
        ldr     r1, [fp, #-24]
        mov     r3, r1
        mov     r3, r3, asl #2
        mov     r2, r3, asl #4
        add     r3, r3, r2
        rsb     r3, r1, r3
        mov     r2, r3, asl #4
        rsb     r2, r3, r2
        mov     r3, r2, asl #3
        rsb     r3, r1, r3
        mov     r2, r3, asl #2
        rsb     r3, r3, r2
        rsb     r3, r3, #0
        add     r0, r0, r3
        ldr     r1, [fp, #-20]
        mov     r3, r1
        mov     r2, r3, asl #2
        mov     r3, r2, asl #2
        add     r2, r2, r3
        mov     r3, r2, asl #3
        rsb     r3, r2, r3
        add     r3, r3, r1
        mov     r2, r3, asl #5
        add     r3, r3, r2
        rsb     r3, r3, #0
        add     r3, r0, r3
        mov     r3, r3, asr #16
        add     r3, r3, #128
        str     r3, [fp, #-8]
        ldr     r0, [fp, #-16]
        mov     r1, #16
        mov     r2, #255
        bl      clamp
        mov     r3, r0
        str     r3, [fp, #-16]
        ldr     r0, [fp, #-12]
        mov     r1, #16
        mov     r2, #240
        bl      clamp
        mov     r3, r0
        str     r3, [fp, #-12]
        ldr     r0, [fp, #-8]
        mov     r1, #16
        mov     r2, #240
        bl      clamp
        mov     r3, r0
        str     r3, [fp, #-8]
        ldr     r3, [fp, #-16]
        str     r3, [sp, #0]
        ldr     r3, [fp, #-12]
        str     r3, [sp, #4]
        ldr     r3, [fp, #-8]
        str     r3, [sp, #8]
        ldr     r0, .L8
        ldr     r1, [fp, #-28]
        ldr     r2, [fp, #-24]
        ldr     r3, [fp, #-20]
        bl      printf
        sub     sp, fp, #4
        ldmfd   sp!, {fp, lr}
        bx      lr
.L9:
        .align  2
.L8:
        .word   .LC0
        .size   main, .-main
        .ident  "GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
        .section        .note.GNU-stack,"",%progbits
-bash-4.2$
