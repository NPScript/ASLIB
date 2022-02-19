.include "functional.S"

putchar:
	# Create a Buffer of 8bit and
	# store the character in it
	sub $8, %rsp
	mov %rdi, (%rsp)

	fscall $write $1 %rsp $1

	# Restore Stack Pointer
	add $8, %rsp
	ret

putstring:

	test %rsi, %rsi
	jnz putstring_with_size

	mov $0, %rcx
	putstring_count_loop:
		mov (%rdi), %rax
		test %rax, %rax
		jz putstring_count_end
		add $1, %rdi
		add $1, %rcx
		jmp putstring_count_loop

	putstring_count_end:
	sub %rcx, %rdi
	mov %rcx, %rsi

	putstring_with_size:
	fscall $write $1 %rdi %rsi
	ret

	
.global _start
