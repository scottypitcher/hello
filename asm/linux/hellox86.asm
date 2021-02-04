;
;  "Hello world" in Intel 80386 assembly for Linux.
;
;  Via http://www.csee.umbc.edu/portal/help/nasm/sample.shtml
;
;  Build with:
;
;  nasm -f elf hellox86.asm
;  ld -s -m elf_i386 -o hellox86 hellox86.o
;

%define SYS_EXIT  1
%define SYS_WRITE 4

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
    mov edx, %3
    mov ecx, %2
    mov ebx, %1
    mov eax, SYS_WRITE
    int 0x80
%endmacro

%macro exit 1
    mov ebx, %1
    mov eax, SYS_EXIT
    int 0x80
%endmacro

_start:
    write stdout, msg, msg.len
    exit 0
