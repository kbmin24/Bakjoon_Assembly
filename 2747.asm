;https://www.acmicpc.net/problem/2747
section .bss
	i:	resq 1
section .data
	io:	db "%d", 0
section .text
	global main
	extern printf
	extern scanf
main:
	push	rbp
	lea		rsi, [i]
	mov		rdi, io
	xor		rax, rax
	call	scanf
	
	mov		r11, [i]
	
	mov		rcx, 3
	cmp		r11, rcx
	jb		one
	
	dec		r11
	dec		r11
	mov		r8, 1
	mov		r9, 1
	jmp		fibonacci

fibonacci:
	mov		r10, r8
	add		r10, r9
	mov		r8, r9
	mov		r9, r10
	dec		r11
	mov		rcx, 0
	cmp		r11, rcx
	jne		fibonacci
	
	mov		rsi, r10
	mov		rdi, io
	xor		rax, rax
	call	printf
	ret
one:
	mov		rsi, 1
	mov		rdi, io
	xor		rax, rax
	call	printf
	ret
