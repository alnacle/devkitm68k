* Chris Huelsbeck - Bionic Action 

.globl	memcpy

.include "helper.s"

.align	4

memcpy:
	SAVECONTEXT	d2, 1
	move.l	_ARGS(a7),a1
	move.l	_ARGS+4(a7),a0

9:
*	If size = 0 we have nothing to do
	move.l	_ARGS+8(a7),d0
	jeq		4f

*	Check if addresses are both odd or both even
	move.l	a0,d1
	move.l	a1,d2
	and.l	#1,d1
	and.l	#1,d2

*	If not do unaligned copy
	cmp.l	d1,d2
	jne		5f
	
*	If addresses are both odd, copy one byte to make then even
	tst.b	d1
	jeq		0f
	
	move.b	(a0)+,(a1)+
	subq.l	#1,d0
	
*	Copy Bytes by block of 32
0:	move.l	d0,d1
	lsr.l	#5,d0
	jeq		2f

1:	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	subq.l	#1,d0
	jne		1b

*	Copy remainder bytes
2:	and.l	#0x1F,d1
	jeq		4f

3:	move.b	(a0)+,(a1)+
	subq.l	#1,d1
	jne		3b
	
4:	move.l	_ARGS(a7),d0
	RESTORECONTEXT	d2, 1
	rts

5:	move.l	d0,d1
	jra		3b

