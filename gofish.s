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
	.file	"gofish.c"
	.global	__aeabi_idivmod
	.global	__aeabi_idiv
	.text
	.align	2
	.global	irand
	.syntax unified
	.arm
	.fpu vfp
	.type	irand, %function
irand:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	mvn	r3, #-2147483648
	ldr	r1, [fp, #-16]
	mov	r0, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	mov	r2, r3
	mvn	r3, #-2147483648
	sub	r3, r3, r2
	str	r3, [fp, #-8]
.L2:
	bl	rand
	str	r0, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bge	.L2
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-8]
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-12]
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	irand, .-irand
	.align	2
	.global	set_mode
	.syntax unified
	.arm
	.fpu vfp
	.type	set_mode, %function
set_mode:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L5
	ldr	r2, .L7
	mov	r1, #0
	mov	r0, #0
	bl	tcsetattr
	b	.L4
.L5:
	ldr	r1, .L7
	mov	r0, #0
	bl	tcgetattr
	ldr	r2, .L7+4
	ldr	r3, .L7
	mov	ip, r2
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2}
	stm	ip, {r0, r1, r2}
	ldr	r3, .L7+4
	ldr	r3, [r3, #12]
	bic	r3, r3, #2
	ldr	r2, .L7+4
	str	r3, [r2, #12]
	ldr	r2, .L7+4
	mov	r1, #0
	mov	r0, #0
	bl	tcsetattr
.L4:
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L8:
	.align	2
.L7:
	.word	old.7339
	.word	new.7340
	.size	set_mode, .-set_mode
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%s: \000"
	.text
	.align	2
	.global	getkey
	.syntax unified
	.arm
	.fpu vfp
	.type	getkey, %function
getkey:
	@ args = 0, pretend = 0, frame = 152
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #160
	str	r0, [fp, #-152]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r1, [fp, #-152]
	ldr	r0, .L14
	bl	printf
	ldr	r3, .L14+4
	ldr	r3, [r3]
	mov	r0, r3
	bl	fflush
	mov	r0, #1
	bl	set_mode
	sub	r3, fp, #144
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L10
.L11:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-12]
	mov	r1, #0
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L10:
	ldr	r3, [fp, #-12]
	cmp	r3, #31
	bls	.L11
	ldr	r3, [fp, #-144]
	orr	r3, r3, #1
	str	r3, [fp, #-144]
	sub	r1, fp, #144
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #0
	mov	r0, #1
	bl	select
	ldr	r3, [fp, #-144]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L12
	bl	getchar
	str	r0, [fp, #-8]
	mov	r0, #0
	bl	set_mode
.L12:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L15:
	.align	2
.L14:
	.word	.LC0
	.word	stdout
	.size	getkey, .-getkey
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Press any key to continue\000"
	.text
	.align	2
	.global	anykey
	.syntax unified
	.arm
	.fpu vfp
	.type	anykey, %function
anykey:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r0, .L18
	bl	getkey
	mov	r3, r0
	mov	r0, r3
	pop	{fp, pc}
.L19:
	.align	2
.L18:
	.word	.LC1
	.size	anykey, .-anykey
	.section	.rodata
	.align	2
.LC2:
	.ascii	"\033[%d;%dH\000"
	.text
	.align	2
	.global	xy
	.syntax unified
	.arm
	.fpu vfp
	.type	xy, %function
xy:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-12]
	add	r1, r3, #1
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	mov	r2, r3
	ldr	r0, .L21
	bl	printf
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L22:
	.align	2
.L21:
	.word	.LC2
	.size	xy, .-xy
	.section	.rodata
	.align	2
.LC3:
	.ascii	"\033[J\000"
	.text
	.align	2
	.global	clear
	.syntax unified
	.arm
	.fpu vfp
	.type	clear, %function
clear:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r0, .L24
	bl	printf
	nop
	pop	{fp, pc}
.L25:
	.align	2
.L24:
	.word	.LC3
	.size	clear, .-clear
	.global	ssuit
	.data
	.align	2
	.type	ssuit, %object
	.size	ssuit, 24
ssuit:
	.ascii	" \000\000\000`&\000\000e&\000\000f&\000\000c&\000\000"
	.ascii	"\000\000\000\000"
	.global	snum
	.align	2
	.type	snum, %object
	.size	snum, 60
snum:
	.ascii	" \000\000\000A\000\000\0002\000\000\0003\000\000\000"
	.ascii	"4\000\000\0005\000\000\0006\000\000\0007\000\000\000"
	.ascii	"8\000\000\0009\000\000\000T\000\000\000J\000\000\000"
	.ascii	"Q\000\000\000K\000\000\000\000\000\000\000"
	.text
	.align	2
	.global	shuffle_cmp
	.syntax unified
	.arm
	.fpu vfp
	.type	shuffle_cmp, %function
shuffle_cmp:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	blt	.L27
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	movgt	r3, #1
	movle	r3, #0
	uxtb	r3, r3
	b	.L29
.L27:
	mvn	r3, #0
.L29:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	shuffle_cmp, .-shuffle_cmp
	.align	2
	.global	card_cmp
	.syntax unified
	.arm
	.fpu vfp
	.type	card_cmp, %function
card_cmp:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bne	.L31
	mov	r3, #0
	b	.L32
.L31:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L33
	mov	r3, #1
	b	.L32
.L33:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L34
	mvn	r3, #0
	b	.L32
.L34:
	ldr	r3, [fp, #-8]
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r2, r3
	bcs	.L35
	mvn	r3, #0
	b	.L32
.L35:
	ldr	r3, [fp, #-8]
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r2, r3
	bls	.L36
	mov	r3, #1
	b	.L32
.L36:
	ldr	r3, [fp, #-8]
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	bcs	.L37
	mvn	r3, #0
	b	.L32
.L37:
	ldr	r3, [fp, #-8]
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	movhi	r3, #1
	movls	r3, #0
	uxtb	r3, r3
.L32:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	card_cmp, .-card_cmp
	.align	2
	.global	card_shuffle
	.syntax unified
	.arm
	.fpu vfp
	.type	card_shuffle, %function
card_shuffle:
	@ args = 0, pretend = 0, frame = 1056
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #1056
	str	r0, [fp, #-1056]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L39
.L40:
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	sub	r3, r3, #1040
	sub	r3, r3, #4
	ldr	r2, [fp, #-1056]
	ldr	r1, [fp, #-8]
	mov	ip, r3
	lsl	r3, r1, #4
	add	r3, r2, r3
	ldm	r3, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	bl	rand
	mov	r1, r0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	sub	r3, r3, #1024
	sub	r3, r3, #4
	str	r1, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L39:
	ldr	r3, [fp, #-1056]
	ldr	r2, [r3, #832]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L40
	ldr	r3, [fp, #-1056]
	ldr	r3, [r3, #832]
	mov	r1, r3
	sub	r0, fp, #1040
	sub	r0, r0, #4
	sub	r0, r0, #4
	ldr	r3, .L43
	mov	r2, #20
	bl	qsort
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L41
.L42:
	ldr	r1, [fp, #-1056]
	ldr	r0, [fp, #-8]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	sub	r3, r3, #1040
	sub	r3, r3, #4
	lsl	ip, r0, #4
	add	ip, r1, ip
	ldm	r3, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L41:
	ldr	r3, [fp, #-1056]
	ldr	r2, [r3, #832]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L42
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L44:
	.align	2
.L43:
	.word	shuffle_cmp
	.size	card_shuffle, .-card_shuffle
	.align	2
	.global	card_init_deck
	.syntax unified
	.arm
	.fpu vfp
	.type	card_init_deck, %function
card_init_deck:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L46
.L47:
	ldr	r3, [fp, #-8]
	ldr	r2, .L49
	smull	r1, r2, r2, r3
	asr	r2, r2, #2
	asr	r3, r3, #31
	sub	r3, r2, r3
	uxtb	r3, r3
	add	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, [fp, #-12]
	strb	r2, [r3]
	ldr	r1, [fp, #-8]
	ldr	r3, .L49
	smull	r2, r3, r3, r1
	asr	r2, r3, #2
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	sub	r2, r1, r3
	uxtb	r3, r2
	add	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, [fp, #-12]
	strb	r2, [r3, #1]
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L49+4
	ldr	r2, [r3, r2, lsl #2]
	ldr	r3, [fp, #-12]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L49+8
	ldr	r2, [r3, r2, lsl #2]
	ldr	r3, [fp, #-12]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	mov	r2, #0
	str	r2, [r3, #12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #16
	str	r3, [fp, #-12]
.L46:
	ldr	r3, [fp, #-8]
	cmp	r3, #51
	ble	.L47
	ldr	r3, [fp, #-16]
	mov	r2, #52
	str	r2, [r3, #832]
	ldr	r0, [fp, #-16]
	bl	card_shuffle
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L50:
	.align	2
.L49:
	.word	1321528399
	.word	ssuit
	.word	snum
	.size	card_init_deck, .-card_init_deck
	.align	2
	.global	card_deal
	.syntax unified
	.arm
	.fpu vfp
	.type	card_deal, %function
card_deal:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #832]
	cmp	r3, #0
	bne	.L52
	mov	r3, #0
	b	.L53
.L52:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #832]
	sub	r1, r3, #1
	ldr	r3, [fp, #-8]
	str	r1, [r3, #832]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #832]
	lsl	r3, r3, #4
	add	r3, r2, r3
.L53:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	card_deal, .-card_deal
	.align	2
	.global	player_sort_hand
	.syntax unified
	.arm
	.fpu vfp
	.type	player_sort_hand, %function
player_sort_hand:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	add	r0, r3, #4
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #232]
	mov	r1, r3
	ldr	r3, .L55
	mov	r2, #4
	bl	qsort
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L56:
	.align	2
.L55:
	.word	card_cmp
	.size	player_sort_hand, .-player_sort_hand
	.align	2
	.global	player_add_card
	.syntax unified
	.arm
	.fpu vfp
	.type	player_add_card, %function
player_add_card:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #232]
	add	r1, r3, #1
	ldr	r2, [fp, #-8]
	str	r1, [r2, #232]
	ldr	r2, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [fp, #-12]
	str	r2, [r3, #4]
	ldr	r0, [fp, #-8]
	bl	player_sort_hand
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	player_add_card, .-player_add_card
	.align	2
	.global	player_remove_card
	.syntax unified
	.arm
	.fpu vfp
	.type	player_remove_card, %function
player_remove_card:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	add	r2, r3, #4
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	add	r0, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r3, #4
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	lsl	r3, r3, #2
	add	r1, r2, r3
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #232]
	ldr	r3, [fp, #-20]
	sub	r3, r2, r3
	lsl	r3, r3, #2
	mov	r2, r3
	bl	memmove
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #232]
	sub	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #232]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	player_remove_card, .-player_remove_card
	.section	.rodata
	.align	2
.LC4:
	.ascii	"* %s drew a card\012\000"
	.align	2
.LC5:
	.ascii	"* %s went fishing and got a %ls\012\000"
	.text
	.align	2
	.global	player_draw_card
	.syntax unified
	.arm
	.fpu vfp
	.type	player_draw_card, %function
player_draw_card:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r0, [fp, #-20]
	bl	card_deal
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L61
	mov	r3, #0
	b	.L62
.L61:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #244]
	cmp	r3, #0
	beq	.L63
	ldr	r0, .L65
	b	.L64
.L63:
	ldr	r0, .L65+4
.L64:
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #236]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	mov	r2, r3
	bl	printf
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-16]
	bl	player_add_card
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r2, r3
	mov	r1, #4
	ldr	r0, [fp, #-16]
	bl	tell_ai
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	mov	r2, #0
	mov	r1, #3
	mov	r0, r3
	bl	tell_ai
	ldr	r3, [fp, #-8]
.L62:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L66:
	.align	2
.L65:
	.word	.LC4
	.word	.LC5
	.size	player_draw_card, .-player_draw_card
	.align	2
	.global	player_has
	.syntax unified
	.arm
	.fpu vfp
	.type	player_has, %function
player_has:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, r1
	strb	r3, [fp, #-17]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L68
.L71:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L69
	mov	r3, #1
	b	.L70
.L69:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L68:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #232]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L71
	mov	r3, #0
.L70:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	player_has, .-player_has
	.section	.rodata
	.align	2
.LC6:
	.ascii	"* %s put down book of %lc\012\000"
	.text
	.align	2
	.global	player_book_check
	.syntax unified
	.arm
	.fpu vfp
	.type	player_book_check, %function
player_book_check:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L73
.L76:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	add	r3, r3, #3
	ldr	r1, [fp, #-24]
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r3, [r3, #4]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L81
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L73:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #232]
	sub	r2, r3, #3
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L76
	b	.L75
.L81:
	nop
.L75:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #232]
	sub	r2, r3, #3
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L77
	mov	r3, #0
	b	.L78
.L77:
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #236]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L82
	ldr	r3, [r3, r2, lsl #2]
	mov	r2, r3
	ldr	r0, .L82+4
	bl	printf
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #228]
	add	r1, r3, #1
	ldr	r2, [fp, #-24]
	str	r1, [r2, #228]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-8]
	lsl	r2, r2, #2
	add	r2, r1, r2
	ldr	r2, [r2, #4]
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	ldr	r2, [fp, #-24]
	add	r2, r2, r3
	strb	r1, [r2, #212]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #212]
	strb	r3, [fp, #-13]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L79
.L80:
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-24]
	bl	player_remove_card
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L79:
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	ble	.L80
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r2, r3
	mov	r1, #5
	ldr	r0, [fp, #-24]
	bl	tell_ai
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	mov	r1, #5
	mov	r0, r3
	bl	tell_ai
	mov	r3, #1
.L78:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L83:
	.align	2
.L82:
	.word	snum
	.word	.LC6
	.size	player_book_check, .-player_book_check
	.section	.rodata
	.align	2
.LC7:
	.ascii	"Puter\000"
	.align	2
.LC8:
	.ascii	"You\000"
	.text
	.align	2
	.global	game_new
	.syntax unified
	.arm
	.fpu vfp
	.type	game_new, %function
game_new:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r2, #1568
	mov	r1, #0
	ldr	r0, [fp, #-24]
	bl	memset
	ldr	r3, [fp, #-24]
	add	r3, r3, #496
	mov	r0, r3
	bl	card_init_deck
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	movne	r3, #1
	moveq	r3, #0
	uxtb	r3, r3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r3, #1332]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-24]
	add	r3, r3, #248
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1328
	add	r3, r3, #8
	ldr	r2, [fp, #-12]
	str	r3, [r2, #244]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	ldr	r2, .L88
	str	r2, [r3, #236]
	ldr	r3, [fp, #-12]
	ldr	r2, .L88+4
	str	r2, [r3, #240]
	ldr	r3, [fp, #-16]
	ldr	r2, .L88+8
	str	r2, [r3, #240]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r2, .L88+12
	str	r2, [r3, #236]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L85
.L86:
	ldr	r3, [fp, #-24]
	add	r3, r3, #496
	mov	r1, r3
	ldr	r0, [fp, #-12]
	bl	player_draw_card
	ldr	r3, [fp, #-24]
	add	r3, r3, #496
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	player_draw_card
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L85:
	ldr	r3, [fp, #-8]
	cmp	r3, #8
	ble	.L86
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #244]
	mov	r2, #1
	str	r2, [r3]
	mov	r2, #0
	mov	r1, #0
	ldr	r0, [fp, #-12]
	bl	tell_ai
	nop
.L87:
	ldr	r0, [fp, #-24]
	bl	game_move
	mov	r3, r0
	cmp	r3, #0
	bne	.L87
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L89:
	.align	2
.L88:
	.word	.LC7
	.word	computer_ask
	.word	human_ask
	.word	.LC8
	.size	game_new, .-game_new
	.section	.rodata
	.align	2
.LC9:
	.ascii	"[%lc]%.1f  \000"
	.align	2
.LC10:
	.ascii	"Cards:\000"
	.align	2
.LC11:
	.ascii	" \000\000\000\222%\000\000 \000\000\000\000\000\000"
	.ascii	"\000"
	.align	2
.LC12:
	.ascii	"%ls\000"
	.align	2
.LC13:
	.ascii	"Books:\000"
	.align	2
.LC14:
	.ascii	" %lc\000"
	.align	2
.LC15:
	.ascii	"Deck: \000"
	.align	2
.LC16:
	.ascii	"%d cards\000"
	.align	2
.LC17:
	.ascii	"empty\000"
	.align	2
.LC18:
	.ascii	" %ls\000"
	.align	2
.LC19:
	.ascii	"[ %s ]\000"
	.align	2
.LC20:
	.ascii	"%lc\000"
	.align	2
.LC21:
	.ascii	"Current move: %s.\000"
	.text
	.align	2
	.global	game_display
	.syntax unified
	.arm
	.fpu vfp
	.type	game_display, %function
game_display:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	add	r3, r3, #248
	str	r3, [fp, #-16]
	mov	r1, #0
	mov	r0, #0
	bl	xy
	bl	clear
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L91
.L92:
	ldr	r2, .L105
	ldr	r3, [fp, #-8]
	ldr	r1, [r2, r3, lsl #2]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #244]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	ldr	r0, .L105+4
	bl	printf
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L91:
	ldr	r3, [fp, #-8]
	cmp	r3, #13
	ble	.L92
	mov	r0, #10
	bl	putchar
	mov	r1, #1
	mov	r0, #0
	bl	xy
	ldr	r0, .L105+8
	bl	printf
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L93
.L94:
	ldr	r1, .L105+12
	ldr	r0, .L105+16
	bl	printf
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L93:
	ldr	r3, [fp, #-12]
	ldr	r2, [r3, #232]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L94
	mov	r1, #2
	mov	r0, #0
	bl	xy
	ldr	r0, .L105+20
	bl	printf
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L95
.L96:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r3, r3, #212
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L105
	ldr	r3, [r3, r2, lsl #2]
	mov	r1, r3
	ldr	r0, .L105+24
	bl	printf
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L95:
	ldr	r3, [fp, #-12]
	ldr	r2, [r3, #228]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L96
	mov	r1, #4
	mov	r0, #7
	bl	xy
	ldr	r0, .L105+28
	bl	printf
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #1328]
	cmp	r3, #0
	beq	.L97
	ldr	r2, .L105+32
	b	.L98
.L97:
	ldr	r2, .L105+36
.L98:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #1328]
	mov	r1, r3
	mov	r0, r2
	bl	printf
	mov	r1, #6
	mov	r0, #0
	bl	xy
	ldr	r0, .L105+20
	bl	printf
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L99
.L100:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r3, r3, #212
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L105
	ldr	r3, [r3, r2, lsl #2]
	mov	r1, r3
	ldr	r0, .L105+24
	bl	printf
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L99:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #228]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L100
	mov	r1, #7
	mov	r0, #0
	bl	xy
	ldr	r0, .L105+8
	bl	printf
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L101
.L102:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	add	r3, r3, #4
	mov	r1, r3
	ldr	r0, .L105+40
	bl	printf
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L101:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #232]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L102
	mov	r1, #8
	mov	r0, #0
	bl	xy
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #236]
	mov	r1, r3
	ldr	r0, .L105+44
	bl	printf
	mov	r1, #9
	mov	r0, #0
	bl	xy
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L103
.L104:
	mov	r1, #9472
	ldr	r0, .L105+48
	bl	printf
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L103:
	ldr	r3, [fp, #-8]
	cmp	r3, #34
	ble	.L104
	mov	r1, #10
	mov	r0, #0
	bl	xy
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #1332]
	ldr	r1, [fp, #-24]
	mov	r3, r2
	lsl	r3, r3, #5
	sub	r3, r3, r2
	lsl	r3, r3, #3
	add	r3, r1, r3
	add	r3, r3, #236
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r0, .L105+52
	bl	printf
	ldr	r3, .L105+56
	ldr	r3, [r3]
	mov	r0, r3
	bl	fflush
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L106:
	.align	2
.L105:
	.word	snum
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	stdout
	.size	game_display, .-game_display
	.section	.rodata
	.align	2
.LC22:
	.ascii	"* %s gave %s\000"
	.text
	.align	2
	.global	game_transfer_cards
	.syntax unified
	.arm
	.fpu vfp
	.type	game_transfer_cards, %function
game_transfer_cards:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	strb	r3, [fp, #-25]
	ldr	r3, [fp, #-20]
	ldr	r1, [r3, #236]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #236]
	mov	r2, r3
	ldr	r0, .L117
	bl	printf
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L108
.L110:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L108:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #232]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	ble	.L111
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	ldrb	r2, [fp, #-25]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L110
	b	.L111
.L113:
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-20]
	bl	player_remove_card
	str	r0, [fp, #-12]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-24]
	bl	player_add_card
	ldr	r3, [fp, #-12]
	add	r3, r3, #4
	mov	r1, r3
	ldr	r0, .L117+4
	bl	printf
.L111:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #232]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	ble	.L112
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	ldrb	r2, [fp, #-25]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L113
.L112:
	mov	r0, #10
	bl	putchar
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	mov	r2, r3
	mov	r1, #2
	ldr	r0, [fp, #-24]
	bl	tell_ai
	ldr	r0, [fp, #-24]
	bl	player_book_check
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #232]
	cmp	r3, #0
	bne	.L114
	ldr	r3, [fp, #-16]
	add	r3, r3, #496
	mov	r1, r3
	ldr	r0, [fp, #-20]
	bl	player_draw_card
.L114:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #232]
	cmp	r3, #0
	bne	.L116
	ldr	r3, [fp, #-16]
	add	r3, r3, #496
	mov	r1, r3
	ldr	r0, [fp, #-24]
	bl	player_draw_card
.L116:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L118:
	.align	2
.L117:
	.word	.LC22
	.word	.LC18
	.size	game_transfer_cards, .-game_transfer_cards
	.section	.rodata
	.align	2
.LC23:
	.ascii	"%s won!\012\000"
	.align	2
.LC24:
	.ascii	"%s: \"Got any %lc?\"\012\000"
	.align	2
.LC25:
	.ascii	"\"Yes.\"\000"
	.align	2
.LC26:
	.ascii	"\"Go fish.\"\000"
	.align	2
.LC27:
	.ascii	"* But %s can't go fish because deck is empty\012\000"
	.text
	.align	2
	.global	game_move
	.syntax unified
	.arm
	.fpu vfp
	.type	game_move, %function
game_move:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #1332]
	mov	r1, r3
	mov	r3, r1
	lsl	r3, r3, #5
	sub	r3, r3, r1
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-24]
	bl	game_display
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L120
.L123:
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #5
	sub	r3, r3, r2
	lsl	r3, r3, #3
	add	r3, r1, r3
	add	r3, r3, #228
	ldr	r3, [r3]
	cmp	r3, #6
	ble	.L121
	mov	r1, #10
	mov	r0, #0
	bl	xy
	bl	clear
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #5
	sub	r3, r3, r2
	lsl	r3, r3, #3
	add	r3, r1, r3
	add	r3, r3, #236
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r0, .L130
	bl	printf
	bl	anykey
	mov	r3, #0
	b	.L122
.L121:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L120:
	ldr	r3, [fp, #-8]
	cmp	r3, #1
	ble	.L123
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #240]
	cmp	r3, #0
	beq	.L124
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #240]
	ldr	r0, [fp, #-12]
	blx	r3
	mov	r3, r0
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r2, r3
	mov	r1, #1
	ldr	r0, [fp, #-16]
	bl	tell_ai
	mov	r1, #10
	mov	r0, #0
	bl	xy
	bl	clear
	ldr	r3, [fp, #-12]
	ldr	r1, [r3, #236]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	ldr	r2, .L130+4
	ldr	r3, [r2, r3, lsl #2]
	mov	r2, r3
	ldr	r0, .L130+8
	bl	printf
	mov	r1, #11
	mov	r0, #0
	bl	xy
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #236]
	mov	r1, r3
	ldr	r0, .L130+12
	bl	printf
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	player_has
	mov	r3, r0
	cmp	r3, #0
	beq	.L125
	ldr	r0, .L130+16
	bl	puts
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	ldr	r2, [fp, #-12]
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-24]
	bl	game_transfer_cards
	bl	anykey
	mov	r3, #1
	b	.L122
.L125:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r2, r3
	mov	r1, #2
	ldr	r0, [fp, #-12]
	bl	tell_ai
	ldr	r0, .L130+20
	bl	puts
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #1328]
	cmp	r3, #0
	bne	.L126
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #236]
	mov	r1, r3
	ldr	r0, .L130+24
	bl	printf
	b	.L127
.L126:
	ldr	r3, [fp, #-24]
	add	r3, r3, #496
	mov	r1, r3
	ldr	r0, [fp, #-12]
	bl	player_draw_card
	ldr	r0, [fp, #-12]
	bl	player_book_check
.L127:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #232]
	cmp	r3, #0
	bne	.L128
	ldr	r3, [fp, #-24]
	add	r3, r3, #496
	mov	r1, r3
	ldr	r0, [fp, #-12]
	bl	player_draw_card
.L128:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #232]
	cmp	r3, #0
	bne	.L129
	ldr	r3, [fp, #-24]
	add	r3, r3, #496
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	player_draw_card
.L129:
	bl	anykey
.L124:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #1332]
	cmp	r3, #0
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r3, #1332]
	mov	r3, #1
.L122:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L131:
	.align	2
.L130:
	.word	.LC23
	.word	snum
	.word	.LC24
	.word	.LC0
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.size	game_move, .-game_move
	.section	.rodata
	.align	2
.LC28:
	.ascii	"You may ask for\000"
	.align	2
.LC29:
	.ascii	" [%lc]\000"
	.align	2
.LC30:
	.ascii	". Your choice\000"
	.align	2
.LC31:
	.ascii	"You can't ask for that card. \000"
	.align	2
.LC32:
	.ascii	"Dude, that's not a card. \000"
	.text
	.align	2
	.global	human_ask
	.syntax unified
	.arm
	.fpu vfp
	.type	human_ask, %function
human_ask:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
.L144:
	mov	r1, #11
	mov	r0, #0
	bl	xy
	bl	clear
	ldr	r0, .L146
	bl	printf
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L133
.L135:
	ldr	r3, [fp, #-8]
	uxtb	r3, r3
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	player_has
	mov	r3, r0
	cmp	r3, #0
	beq	.L134
	ldr	r2, .L146+4
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, lsl #2]
	mov	r1, r3
	ldr	r0, .L146+8
	bl	printf
.L134:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L133:
	ldr	r3, [fp, #-8]
	cmp	r3, #13
	ble	.L135
	ldr	r0, .L146+12
	bl	getkey
	mov	r3, r0
	mov	r0, r3
	bl	toupper
	str	r0, [fp, #-12]
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L136
.L141:
	ldr	r2, .L146+4
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	beq	.L137
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L136
.L137:
	ldr	r3, [fp, #-8]
	uxtb	r3, r3
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	player_has
	mov	r3, r0
	cmp	r3, #0
	beq	.L145
	ldr	r3, [fp, #-8]
	uxtb	r3, r3
	b	.L140
.L136:
	ldr	r3, [fp, #-8]
	cmp	r3, #13
	ble	.L141
	b	.L139
.L145:
	nop
.L139:
	mov	r1, #13
	mov	r0, #0
	bl	xy
	ldr	r3, [fp, #-8]
	cmp	r3, #13
	bgt	.L142
	ldr	r3, .L146+16
	b	.L143
.L142:
	ldr	r3, .L146+20
.L143:
	mov	r0, r3
	bl	printf
	bl	anykey
	mov	r3, r0
	cmp	r3, #0
	bne	.L144
	mov	r3, #0
.L140:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L147:
	.align	2
.L146:
	.word	.LC28
	.word	snum
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.size	human_ask, .-human_ask
	.align	2
	.global	computer_ask
	.syntax unified
	.arm
	.fpu vfp
	.type	computer_ask, %function
computer_ask:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-32]
	mov	r3, #1
	str	r3, [fp, #-12]
	mov	r3, #0
	strb	r3, [fp, #-13]
	mov	r2, #0
	mov	r3, #0
	strd	r2, [fp, #-28]
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L149
.L154:
	ldr	r3, [fp, #-8]
	uxtb	r3, r3
	mov	r1, r3
	ldr	r0, [fp, #-32]
	bl	player_has
	mov	r3, r0
	cmp	r3, #0
	beq	.L157
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #244]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	vldr.64	d6, [r3]
	vldr.64	d7, [fp, #-28]
	vcmpe.f64	d6, d7
	vmrs	APSR_nzcv, FPSCR
	ble	.L152
	ldr	r3, [fp, #-8]
	strb	r3, [fp, #-13]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #244]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	strd	r2, [fp, #-28]
.L152:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L151
.L157:
	nop
.L151:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L149:
	ldr	r3, [fp, #-8]
	cmp	r3, #13
	ble	.L154
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	computer_ask, .-computer_ask
	.align	2
	.global	check_opponent_draw
	.syntax unified
	.arm
	.fpu vfp
	.type	check_opponent_draw, %function
check_opponent_draw:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #44
	str	r0, [fp, #-40]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #244]
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L177
	mov	r3, #1
	str	r3, [fp, #-12]
	b	.L161
.L166:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	vldr.64	d7, [r3]
	vcmpe.f64	d7, #0
	vmrs	APSR_nzcv, FPSCR
	bmi	.L178
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	vldr.64	d7, [r3]
	vldr.64	d6, .L181
	vcmpe.f64	d7, d6
	vmrs	APSR_nzcv, FPSCR
	bge	.L178
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-12]
	add	r2, r2, #30
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	b	.L165
.L178:
	nop
.L165:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L161:
	ldr	r3, [fp, #-12]
	cmp	r3, #13
	ble	.L166
	mov	r3, #1
	str	r3, [fp, #-12]
	b	.L167
.L176:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	vldr.64	d7, [r3]
	vcmpe.f64	d7, #0
	vmrs	APSR_nzcv, FPSCR
	bmi	.L179
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	vldr.64	d7, [r3]
	vldr.64	d6, .L181
	vcmpe.f64	d7, d6
	vmrs	APSR_nzcv, FPSCR
	bge	.L179
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-12]
	add	r2, r2, #30
	ldr	r3, [r3, r2, lsl #2]
	cmp	r3, #0
	beq	.L180
	mov	r2, #0
	ldr	r3, .L181+8
	strd	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-12]
	add	r2, r2, #44
	ldr	r3, [r3, r2, lsl #2]
	add	r1, r3, #1
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-12]
	add	r2, r2, #44
	str	r1, [r3, r2, lsl #2]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L173
.L175:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	sub	r2, r2, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [fp, #-12]
	add	r1, r1, #30
	ldr	r3, [r3, r1, lsl #2]
	sub	r3, r2, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d5, s15
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	sub	r3, r2, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d6, s15
	vdiv.f64	d7, d5, d6
	vldr.64	d6, [fp, #-28]
	vmul.f64	d7, d6, d7
	vstr.64	d7, [fp, #-28]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L173:
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-12]
	add	r2, r2, #44
	ldr	r2, [r3, r2, lsl #2]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	ble	.L174
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	blt	.L175
.L174:
	vldr.64	d6, .L181
	vldr.64	d7, [fp, #-28]
	vsub.f64	d7, d6, d7
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	vstr.64	d7, [r3]
	b	.L171
.L179:
	nop
	b	.L171
.L180:
	nop
.L171:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L167:
	ldr	r3, [fp, #-12]
	cmp	r3, #13
	ble	.L176
	b	.L158
.L177:
	nop
.L158:
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L182:
	.align	3
.L181:
	.word	0
	.word	1072693248
	.word	1072693248
	.size	check_opponent_draw, .-check_opponent_draw
	.align	2
	.global	tell_ai
	.syntax unified
	.arm
	.fpu vfp
	.type	tell_ai, %function
tell_ai:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, r2
	strb	r3, [fp, #-21]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #244]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	beq	.L202
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L203
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L187
.L188:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-8]
	add	r2, r2, #30
	mov	r1, #4
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L187:
	ldr	r3, [fp, #-8]
	cmp	r3, #13
	ble	.L188
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L189
.L190:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	ldr	r2, [fp, #-12]
	add	r1, r3, #30
	ldr	r2, [r2, r1, lsl #2]
	sub	r1, r2, #1
	ldr	r2, [fp, #-12]
	add	r3, r3, #30
	str	r1, [r2, r3, lsl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L189:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #232]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L190
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L191
.L192:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r3, r3, #212
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r2, #30
	mov	r1, #0
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L191:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #228]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L192
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L193
.L194:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r3, r3, #212
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r2, #30
	mov	r1, #0
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L193:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	ldr	r2, [r3, #228]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L194
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L195
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L196
.L197:
	ldr	r0, [fp, #-16]
	bl	check_opponent_draw
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L196:
	ldr	r3, [fp, #-8]
	cmp	r3, #8
	ble	.L197
	b	.L183
.L195:
	ldr	r3, [fp, #-20]
	cmp	r3, #5
	bne	.L198
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	ldr	r2, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r1, r2, r3
	mov	r2, #0
	ldr	r3, .L204
	strd	r2, [r1]
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	ldr	r3, [fp, #-12]
	add	r2, r2, #30
	mov	r1, #0
	str	r1, [r3, r2, lsl #2]
	b	.L183
.L198:
	ldr	r3, [fp, #-20]
	cmp	r3, #2
	bne	.L199
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	ldr	r2, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r1, r2, r3
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r1]
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	ldr	r3, [fp, #-12]
	add	r2, r2, #44
	mov	r1, #0
	str	r1, [r3, r2, lsl #2]
	b	.L183
.L199:
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	bne	.L200
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	ldr	r2, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r1, r2, r3
	mov	r2, #0
	ldr	r3, .L204+4
	strd	r2, [r1]
	b	.L183
.L200:
	ldr	r3, [fp, #-20]
	cmp	r3, #4
	bne	.L201
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	ldr	r2, [fp, #-12]
	add	r1, r3, #30
	ldr	r2, [r2, r1, lsl #2]
	sub	r1, r2, #1
	ldr	r2, [fp, #-12]
	add	r3, r3, #30
	str	r1, [r2, r3, lsl #2]
	b	.L183
.L201:
	ldr	r3, [fp, #-20]
	cmp	r3, #3
	bne	.L183
	ldr	r0, [fp, #-16]
	bl	check_opponent_draw
	b	.L183
.L202:
	nop
	b	.L183
.L203:
	nop
.L183:
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L205:
	.align	2
.L204:
	.word	-1074790400
	.word	1072693248
	.size	tell_ai, .-tell_ai
	.section	.rodata
	.align	2
.LC33:
	.ascii	"\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 1568
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #1568
	ldr	r1, .L208
	mov	r0, #0
	bl	setlocale
	mov	r0, #0
	bl	time
	mov	r3, r0
	mov	r0, r3
	bl	srand
	sub	r3, fp, #1568
	sub	r3, r3, #4
	mov	r1, #1
	mov	r0, r3
	bl	game_new
	sub	r3, fp, #1568
	sub	r3, r3, #4
	mov	r0, r3
	bl	game_display
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L209:
	.align	2
.L208:
	.word	.LC33
	.size	main, .-main
	.local	old.7339
	.comm	old.7339,60,4
	.local	new.7340
	.comm	new.7340,60,4
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
