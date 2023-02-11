section .data
say db 'Hello word' ; hello world duoc luu trong say
len equ $-say       ; kich thuoc cua hello world

section .text
    global _start   ; 

_start:
    mov edx, len    ; luu kich thuoc vao thanh ghi edx
    mov ecx, say    ; luu chuoi vao thanh ghi ecx
    mov ebx, 1      ; stdout
    mov eax, 4      ; write
    int 0x80

    mov eax, 1      ;system call number (sys_exit)
    int 0x80
