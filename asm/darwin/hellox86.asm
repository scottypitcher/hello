;
;  "Hello world" in Intel 80386 assembly for MacOS X (Darwin)
;
;  Via http://peter.michaux.ca/articles/assembly-hello-world-for-os-x
;  Via https://stackoverflow.com/questions/52830484/nasm-cant-link-object-file-with-ld-on-macos-mojave
;
;  Build with:
;
;  nasm -f macho hellox86.asm
;  ld -lSystem -macosx_version_min 10.4 -o hellox86 hellox86.o
;

%define SYS_EXIT  1
%define SYS_WRITE 4

%define stdin  0
%define stdout 1
%define stderr 2

section .data

msg:
    db "Hello world.", 0Ah
    .len: equ $-msg

section .text

global start

; write(handle, string, length)

%macro write 3
    mov eax, SYS_WRITE

    ; args are pushed to the stack in reverse order
    push dword %3  ; length
    push dword %2  ; string
    push dword %1  ; handle

    ; Darwin system calls need extra space on the stack
    sub esp, 4

    ; syscall
    int 0x80

    ; clean up stack
    add esp, 16
%endmacro

; exit(retval)

%macro exit 1
    mov eax, SYS_EXIT
    push dword %1
    sub esp, 4
    int 0x80
%endmacro

start:
    write stdout, msg, msg.len
    exit 0
