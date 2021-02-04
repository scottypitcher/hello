;
;  "Hello world" in AMD64 assembly for MacOS X (Darwin)
;
;  Via https://gist.github.com/FiloSottile/7125822
;  Via https://stackoverflow.com/questions/52830484/nasm-cant-link-object-file-with-ld-on-macos-mojave
;
;  Build with:
;
;  nasm -f macho64 hellox64.asm
;  ld -lSystem -macosx_version_min 10.5 -o hellox64 hellox64.o
;

%define SYS_EXIT  0x02000000 + 1
%define SYS_WRITE 0x02000000 + 4

%define stdin  0
%define stdout 1
%define stderr 2

section .data

msg:
    db "Hello world.", 10
    .len: equ $-msg

section .text

global start

; write(handle, string, length)

%macro write 3
    mov rax, SYS_WRITE
    mov rdi, %1
    mov rsi, %2
    mov rdx, %3
    syscall
%endmacro

%macro exit 1
    mov rax, SYS_EXIT
    mov rdi, %1
    syscall
%endmacro

start:
    write stdout, msg, msg.len
    exit 0
