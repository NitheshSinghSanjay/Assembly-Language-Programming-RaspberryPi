	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"prime.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Enter a positive integer: \000"
	.align	2
.LC1:
	.ascii	"%d\000"
	.global	__aeabi_idivmod
	.align	2
.LC2:
	.ascii	"1 is neither a prime nor a composite number.\000"
	.align	2
.LC3:
	.ascii	"%d is a prime number.\000"
	.align	2
.LC4:
	.ascii	"%d is not a prime number.\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, #0
	str	r3, [fp, #-12]
	ldr	r0, .L10
	bl	printf
	sub	r3, fp, #16
	mov	r1, r3
	ldr	r0, .L10+4
	bl	__isoc99_scanf
	mov	r3, #2
	str	r3, [fp, #-8]
	b	.L2
.L5:
	ldr	r3, [fp, #-16]
	ldr	r1, [fp, #-8]
	mov	r0, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	cmp	r3, #0
	bne	.L3
	mov	r3, #1
	str	r3, [fp, #-12]
	b	.L4
.L3:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-16]
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bge	.L5
.L4:
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	bne	.L6
	ldr	r0, .L10+8
	bl	printf
	b	.L7
.L6:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L8
	ldr	r3, [fp, #-16]
	mov	r1, r3
	ldr	r0, .L10+12
	bl	printf
	b	.L7
.L8:
	ldr	r3, [fp, #-16]
	mov	r1, r3
	ldr	r0, .L10+16
	bl	printf
.L7:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L11:
	.align	2
.L10:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.size	main, .-main
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
