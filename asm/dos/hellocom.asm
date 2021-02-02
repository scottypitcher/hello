;
;  "Hello world" for Intel 8086 16-bit MS-DOS.
;
;  Via https://eli.thegreenplace.net/2009/12/21/creating-a-tiny-hello-world-executable-in-assembly
;
;  Requires the Netwide Assembler (NASM) from http://www.nasm.us/
;
;  Build HELLO.COM with:
;
;  nasm -f bin hellocom.asm -o hello.com
;

%define STDIN  0
%define STDOUT 1
%define STDERR 2

%define DOSWRITE 0x40
%define DOSEXIT  0x4C

%macro DosWrite 3
    mov ah, DOSWRITE
    mov bx, %1
    mov dx, %2
    mov cx, %3
    int 21h
%endmacro

%macro DosExit 1
    mov ah, DOSEXIT
    mov al, %1
    int 21h
%endmacro

_start:
    org 0x100
    DosWrite STDOUT, msg, msg.len
    DosExit 0

msg:
    db 'Hello world.', 0x0D, 0x0A
    .len: equ $-msg
