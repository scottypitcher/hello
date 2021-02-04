;
;  "Hello world" for FreeBSD Intel 80386.
;
;  Via https://thebrownnotebook.wordpress.com/2009/10/27/native-64-bit-hello-world-with-nasm-on-freebsd/
;  https://www.freebsd.org/doc/en_US.ISO8859-1/books/developers-handbook/x86-first-program.html
;
;  See /usr/src/sys/kern/syscalls.master for list of syscalls
;
;  Build "hellox86" with:
;
;  nasm -f elf hellox86.asm
;  ld -s -m elf_i386_fbsd -o hellox86 hellox86.o
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
    push dword %3
    push dword %2
    push dword %1
    mov eax, SYS_WRITE
    sub esp, 4   ; extra stack space
    int 0x80
    add esp, 16  ; clean up stack (4 * 3 + 4)
%endmacro

; exit(int retval)

%macro exit 1
    push dword %1
    mov eax, SYS_EXIT
    sub esp, 4   ; extra stack space
    int 0x80

    ; don't bother cleaning up stack because exit() never returns
    ;add esp, 4
%endmacro

_start:
    write stdout, msg, msg.len
    exit 0
