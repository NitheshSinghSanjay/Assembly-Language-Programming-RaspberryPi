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
	.file	"part1.c"
	.text
	.align	2
	.global	check_password
	.syntax unified
	.arm
	.fpu vfp
	.type	check_password, %function
check_password:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, .L6
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldrb	r2, [fp, #-12]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L2
	ldr	r3, [fp, #-8]
	add	r3, r3, #100
	str	r3, [fp, #-8]
.L2:
	ldrb	r2, [fp, #-11]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L3
	ldr	r3, [fp, #-8]
	add	r3, r3, #10
	str	r3, [fp, #-8]
.L3:
	ldrb	r2, [fp, #-10]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	add	r3, r3, #2
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L4
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L4:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L7:
	.align	2
.L6:
	.word	3299425
	.size	check_password, .-check_password
	.section	.rodata
	.align	2
.LC3:
	.ascii	"%d\000"
	.align	2
.LC4:
	.ascii	"password found\000"
	.align	2
.LC5:
	.ascii	"%s\000"
	.align	2
.LC0:
	.ascii	"abcdefghijklmnopqrstuvwxyz\000"
	.align	2
.LC1:
	.ascii	"ABCDEFGHIJKLMNOPQRSTUVWXYZ\000"
	.align	2
.LC2:
	.ascii	"0123456789\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #112
	ldr	r3, .L17
	sub	ip, fp, #52
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2}
	stmia	ip!, {r0, r1}
	strh	r2, [ip]	@ movhi
	add	ip, ip, #2
	lsr	r3, r2, #16
	strb	r3, [ip]
	ldr	r3, .L17+4
	sub	ip, fp, #80
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2}
	stmia	ip!, {r0, r1}
	strh	r2, [ip]	@ movhi
	add	ip, ip, #2
	lsr	r3, r2, #16
	strb	r3, [ip]
	ldr	r2, .L17+8
	sub	r3, fp, #92
	ldm	r2, {r0, r1, r2}
	stmia	r3!, {r0, r1}
	strh	r2, [r3]	@ movhi
	add	r3, r3, #2
	lsr	r2, r2, #16
	strb	r2, [r3]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L9
.L15:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L10
.L14:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L11
.L13:
	mov	r3, #0
	strb	r3, [fp, #-96]
	sub	r2, fp, #52
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	strb	r3, [fp, #-100]
	sub	r2, fp, #100
	sub	r3, fp, #96
	mov	r1, r2
	mov	r0, r3
	bl	strcpy
	mov	r3, #0
	strb	r3, [fp, #-104]
	sub	r2, fp, #80
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	strb	r3, [fp, #-108]
	sub	r2, fp, #108
	sub	r3, fp, #104
	mov	r1, r2
	mov	r0, r3
	bl	strcpy
	sub	r2, fp, #104
	sub	r3, fp, #96
	mov	r1, r2
	mov	r0, r3
	bl	strcat
	mov	r3, #0
	strb	r3, [fp, #-112]
	sub	r3, fp, #112
	ldr	r2, [fp, #-16]
	ldr	r1, .L17+12
	mov	r0, r3
	bl	sprintf
	sub	r2, fp, #112
	sub	r3, fp, #96
	mov	r1, r2
	mov	r0, r3
	bl	strcat
	sub	r3, fp, #96
	mov	r0, r3
	bl	check_password
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #111
	bne	.L12
	ldr	r0, .L17+16
	bl	puts
	sub	r3, fp, #96
	mov	r1, r3
	ldr	r0, .L17+20
	bl	printf
.L12:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L11:
	ldr	r3, [fp, #-16]
	cmp	r3, #9
	ble	.L13
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L10:
	sub	r3, fp, #80
	mov	r0, r3
	bl	strlen
	mov	r2, r0
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bhi	.L14
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L9:
	sub	r3, fp, #52
	mov	r0, r3
	bl	strlen
	mov	r2, r0
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bhi	.L15
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L18:
	.align	2
.L17:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.size	main, .-main
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
