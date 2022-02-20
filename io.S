.include "functional.S"

putchar:
	push %rdi

	mov %rsp, %rax
	fscall $write $1 %rax $1

	add $8, %rsp

	# Restore Stack Pointer
	ret

putstring:
	test %rsi, %rsi
	jnz putstring_with_size

	xor %rcx, %rcx
	putstring_count_loop:
		cmpb $0, (%rdi)
		jz putstring_count_end
		inc %rdi
		inc %rcx
		jmp putstring_count_loop

	putstring_count_end:
	sub %rcx, %rdi
	mov %rcx, %rsi

	putstring_with_size:
	fscall $write $1 %rdi %rsi
	ret

putuint:
	mov %rdi, %rax
	mov %rsp, %rbx
	mov $10, %r10

	putuint_push_loop:
	xor %rdx, %rdx
	div %r10
	push %rdx
	test %rax, %rax
	jnz putuint_push_loop

	putuint_print_loop:
	pop %rax
	add $'0', %rax
	fcall putchar %rax
	cmp %rbx, %rsp
	jne putuint_print_loop

	ret

