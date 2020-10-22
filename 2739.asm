;https://www.acmicpc.net/problem/2739
section .bss
	y:		resq 1
section .data
	input:	db	"%d", 0
	output:	db	"%d * %d = %d", 10, 0
	
	x:		dd 1
section .text
	global	main
	extern	printf
	extern	scanf
main:
	push	rbp
	mov		qword[y], 1\
	
	lea		rsi, [x]
	mov		rdi, input
	mov		rax, 0
	call	scanf
	
	jmp		prt
prt:
	;rdi rsi rdx rcx
	mov		rcx, [x]
	mov		rax, [y]
	imul	rcx, rax	;product
	
	mov		rdi, output
	mov		rsi, [x]	;parameter 1
	mov		rdx, [y]	;parameter 2
	mov		rax, 0
	call	printf
	
	inc		qword[y]
	mov		rax, 9
	cmp		rax, qword[y]
	jge		prt
	
	ret
