section .data 
    msg1 db "Num1: "
    len1 equ $-msg1

    msg2 db "Num2: "
    len2 equ $-msg2

    msg3 db "Sum: "
    len3 equ $-msg3

section .bss           ;khoi tao du lieu
    num1 resd 4
    num2 resd 4
    res  resd 4
section .text
    global _start

_start: 
    ; input num1    
    mov edx, len1
    mov ecx, msg1
    mov ebx, 1
    mov eax, 4
    int 0x80
    ;
    mov edx, 4
    mov ecx, num1
    mov ebx, 0  ; stdin
    mov eax, 3  ; read
    int 0x80

    ; input num2
    mov edx, len2
    mov ecx, msg2
    mov ebx, 1
    mov eax, 4
    int 0x80
    ;
    mov edx, 4
    mov ecx, num2
    mov ebx, 0  ; stdin
    mov eax, 3  ; read
    int 0x80

    ; output sum 
    mov edx, len3
    mov ecx, msg3
    mov ebx, 1
    mov eax, 4
    int 0x80
    
    ; add num1 + num2;
    mov eax, [num1]
    sub eax, '0'
                        ; sub '0' de chuyen ve he thap phan
    mov ebx, [num2]
    sub ebx, '0'

    add eax, ebx
    add eax, '0'        ; add '0' chuyen tu thap phan sang ascii

    mov [res], eax      ; luu tru bo nho vao res

    ; ouput sum
    mov edx, 4
    mov ecx, res
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; call exit
    mov eax, 1
    int 0x80
    
