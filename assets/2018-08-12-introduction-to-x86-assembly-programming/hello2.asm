section .data

str: db "Hello world", 0x00

new_line: db 0x0a

section .text
	global _start

_start:
	call print_string	
	jmp end_prog



print_string:
	
	lea rdi, [str]

_loop:
	mov rax, 0x04
	mov rbx, 0x01
	mov rcx, rdi
	mov rdx, 0x01
	int 0x80

	mov rax, 0x04
	mov rbx, 0x01
	lea rcx, [new_line]
	mov rdx, 0x01
	int 0x80

	inc rdi
	cmp byte [rdi], 0x00
	je return
	jmp _loop
	

return:
	ret


end_prog: 
	mov rax, 0x01
	mov rbx, 0x00
	int 0x80
