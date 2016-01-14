* Chris Huelsbeck - Bionic Action

.global memset 

.include "helper.s"

.align	4

memset:
	SAVECONTEXT	d2-d3, 2
	move.l	_ARGS(a7),a0
	move.l	_ARGS+4(a7),d2
	
*	If size = 0 we have nothing to do
	move.l	_ARGS+8(a7),d0
	jeq		4f

	move.b	d2,d1
	lsl.l	#8,d2
	move.b	d1,d2
	lsl.l	#8,d2
	move.b	d1,d2
	lsl.l	#8,d2
	move.b	d1,d2

*	Check if addresses are both odd or both even
	move.l	a0,d3
	and.l	#1,d3
	jeq		0f
	
	move.b	d2,(a0)+
	subq.l	#1,d0
	
*	Set bytes by block of 32
0:	move.l	d0,d1
	lsr.l	#5,d0
	jeq		2f

1:	move.l	d2, (a0)+
	move.l	d2, (a0)+
	move.l	d2, (a0)+
	move.l	d2, (a0)+
	move.l	d2, (a0)+
	move.l	d2, (a0)+
	move.l	d2, (a0)+
	move.l	d2, (a0)+
	subq.l	#1,d0
	jne		1b

*	Set remainder bytes
2:	and.l	#0x1F,d1
	jeq		4f

3:	move.b	d2, (a0)+
	subq.l	#1,d1
	jne		3b
	
4:	move.l	_ARGS(a7),d0
	RESTORECONTEXT	d2-d3, 2
	rts
	

