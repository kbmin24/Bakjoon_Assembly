;https://www.acmicpc.net/problem/1292
section .bss
	start:	resq 1
	finish:	resq 1
	n:		resq 1
	i:		resq 1
	res:	resq 1
section .data
	input:	db "%d %d", 0
	output:	db "%d", 0
section .text
	global	main
	extern	printf
	extern	scanf

main:
	push	rbp
	lea		rdx, [finish]
	lea		rsi, [start]
	mov		rdi, input
	xor		rax, rax
	call 	scanf
	
	mov		rdx, qword[start]
	dec		rdx 				; the values are shifted by 1 as my logic has a problem. I don't care.
	mov		qword[n], rdx
	
	dec		qword[finish]
	
	jmp		looping
	
looping:
	mov		rdx, [n]
	xor		r9, r9
	mov		r10, 1
	jmp		addition


addition:
	; added to r9, counter: r10
	add		r9, r10
	inc		r10
	mov		r11, [n]
	cmp		r9, r11
	jle		addition
	
	dec		r10 ;got the number
	mov		r9, [res]
	add		r9, r10
	mov		qword[res], r9
	inc		qword[n]
	mov		rdx, [n]
	mov		r8, [finish]
	cmp		rdx, r8
	jle		looping
	
	jmp		print
print:
	mov		rsi, [res]
	mov		rdi, output
	xor		rax, rax
	call	printf
	
	ret
