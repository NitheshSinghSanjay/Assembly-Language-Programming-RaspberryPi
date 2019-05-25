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
	.file	"precision.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%f\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r3, .L3+12
	str	r3, [fp, #-8]	@ float
	vldr.32	s15, [fp, #-8]
	vldr.32	s14, .L3+8
	vmul.f32	s15, s15, s14
	vcvt.f64.f32	d7, s15
	vmov.f64	d0, d7
	bl	floor
	vmov.f64	d5, d0
	vldr.64	d6, .L3
	vdiv.f64	d7, d5, d6
	vcvt.f32.f64	s15, d7
	vstr.32	s15, [fp, #-8]
	vldr.32	s15, [fp, #-8]
	vcvt.f64.f32	d7, s15
	vmov	r2, r3, d7
	ldr	r0, .L3+16
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L4:
	.align	3
.L3:
	.word	0
	.word	1086556160
	.word	1176256512
	.word	1085254310
	.word	.LC0
	.size	main, .-main
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
