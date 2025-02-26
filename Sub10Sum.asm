;Code for adding two StdInput numbers when sum < 10

SECTION .data
usrInMsg1 db "Number 1 : ",0xa
usrInMsgLen1 equ $ - usrInMsg1
usrInMsg2 db "Number 2 : ",0xa
usrInMsgLen2 equ $ - usrInMsg2

resultMsg db "Sum: "
resultMsgLen equ $- resultMsg

SECTION .bss
inputNum1 resb 2
inputNum2 resb 2 
res resb 1

SECTION .text
global _startApp
_startApp:
  
    ;Send first user input msg to StdOut
    mov edx,usrInMsgLen1
    mov ecx,usrInMsg1
    mov ebx,1
    mov eax,4
    int 0x80
    
    ;User input for the first number 
    mov edx,2
    mov ecx,inputNum1
    mov ebx,0
    mov eax,3
    int 0x80
    
    ;Send second user input msg to StdOut
    mov edx,usrInMsgLen2
    mov ecx,usrInMsg2
    mov ebx,1
    mov eax,4
    int 0x80
    
    ;User input for the second number 
    mov edx,2
    mov ecx,inputNum2
    mov ebx,0
    mov eax,3
    int 0x80
    
    ;Move input numbers to eax and ebx
    mov eax,[inputNum1]
    sub eax,'0' ;Convert ASCII into decimal
    mov ebx,[inputNum2]
    sub ebx,'0' ;Convert ASCII into decimal
    
    add eax,ebx
    add eax,'0' ;Convert decimal to ASCII
    
    mov [res],eax ;Store sum in memory
    
    ;Print result message
    mov edx,resultMsgLen
    mov ecx,resultMsg
    mov ebx,1
    mov eax,4
    int 0x80
    
    ;Printing the sum
    mov edx,1
    mov ecx,res
    mov ebx,1
    mov eax,4
    int 0x80
    
  
    ;Exit program
    mov ebx,0
    mov eax,1
    int 0x80
