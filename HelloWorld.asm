;Simple Assembly code that send the string 'Hello World!' to StdOutput

SECTION .data
	message:     db 'Hello World!',10   
	mLen:  equ $-message

SECTION .text
	global _startApp

_startApp:
    mov eax,4
    mov ebx,1
    mov ecx,message
    mov edx,mLen
    int 80h     
    mov eax,1
    mov ebx,0
    int 80h
