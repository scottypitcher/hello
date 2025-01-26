;
;  "Hello world" on Solaris AMD64 64-bit.
;  Tested on OmniOS.
;
;  This code is identical to the FreeBSD/AMD64 version.
;
;  Build "hellox64" with:
;
;  nasm -f elf64 hellox64.asm
;  ld -o hellox64 hellox64.o -s -d n
;
;  -s: strip debug info
;  -d n: generate a static binary
;

%define SYS_EXIT  1
%define	SYS_WRITE 4

%define	stdin  0
%define	stdout 1
%define	stderr 2

section .data

msg:
    db "Hello world.", 0x0A  ; Note: not null-terminated
    .len: equ $-msg

section .text

global _start

; write(fd, buf, nbytes)

%macro write 3
    mov rdi, %1
    mov rsi, %2
    mov rdx, %3
    mov rax, SYS_WRITE
    syscall
%endmacro

; exit(rval)

%macro exit 1
    mov rdi, %1
    mov rax, SYS_EXIT
    syscall
%endmacro

_start:
    write stdout, msg, msg.len
    exit 0
