.macro farg a1=$0 a2=$0 a3=$0 a4=$0 a5=$0 a6=$0
	push \a1
	push \a2
	push \a3
	push \a4
	push \a5
	push \a6
	pop %r9
	pop %r8
	pop %r10
	pop %rdx
	pop %rsi
	pop %rdi
.endm

.macro fcall fn a1=$0 a2=$0 a3=$0 a4=$0 a5=$0 a6=$0
	farg \a1 \a2 \a3 \a4 \a5 \a6
	call \fn
.endm

.macro fscall cn a1=$0 a2=$0 a3=$0 a4=$0 a5=$0 a6=$0
	farg \a1 \a2 \a3 \a4 \a5 \a6
	mov \cn, %rax
	syscall
.endm

.include "constants.S"
