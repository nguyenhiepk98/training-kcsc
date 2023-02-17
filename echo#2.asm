section .data
    msg db "Nhap chuoi: ", 0
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
    mov eax, 3
    mov ebx, 0
    mov ecx, str
    mov edx, 32
    int 0x80

    ; in chuoi
    mov eax, 4
    mov ebx, 1
    mov ecx, str
    mov edx, 32
    int 0x80

    ;ket thuc
    mov eax, 1
    int 0x80