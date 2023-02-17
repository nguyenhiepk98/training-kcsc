section .data
    msg db "Input string: ", 0
    len equ $-msg

section .bss
    str: resb 32

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    ; nhap chuoi
    mov eax, 3   ; read
    mov ebx, 0   ; stdin
    mov ecx, str
    mov edx, 32  ; 32 byte
    int 0x80     ; call kernel  

    ;to_uppercase
    mov edi, str
    mov cl, 32   ; loop 32 lan

to_uppercase:
    cmp byte [edi], 0x61
    jl _repeat  ; < 'a'
    cmp byte [edi], 0x7a 
    jg _repeat ; > 'z'
    sub byte [edi], 0x20 ; 'a' - 32 = 'A'
    jmp _repeat 

_repeat:
    inc edi
    dec cl           ; giam dan loop
    jnz to_uppercase ; cl != 0
    jmp end_loop

end_loop:
    ; in chuoi hoa
    mov eax, 4 ; write
    mov ebx, 1 ; stdout
    mov ecx, str
    mov edx, 32
    int 0x80

    ;ket thuc
    mov eax, 1 ; call exit
    int 0x80
