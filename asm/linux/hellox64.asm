;
;  "Hello world" in AMD64 assembly for Linux.
;
;  Via http://stackoverflow.com/questions/19743373/linux-x86-64-hello-world-and-register-usage-for-parameters
;
;  Build with:
;
;  nasm -f elf64 hellox64.asm
;  ld -s -m elf_x86_64 -o hellox64 hellox64.o
;

%define SYS_WRITE 0x01
%define SYS_EXIT  0x3c

%define stdin  0
%define stdout 1
%define stderr 2

section .data

msg:
    db "Hello world.", 0x0A  ; Note: not null-terminated
    .len: equ $-msg

section .text

global _start

%macro write 3
    mov rdx, %3
    mov rsi, %2
    mov rdi, %1
    mov rax, SYS_WRITE
    syscall
%endmacro

%macro exit 1
    mov rdi, %1
    mov eax, SYS_EXIT
    syscall
%endmacro

_start:
    write stdout, msg, msg.len
    exit 0
