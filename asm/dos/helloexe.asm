;
;  "Hello world" for Intel 8086 16-bit MS-DOS.
;
;  Requires the Flat Assembler (FASM) from https://flatassembler.net/
;
;  Build HELLO.EXE with:
;
;  fasm helloexe.asm hello.exe

format MZ
entry main:_start
stack 100h

define STDIN  0
define STDOUT 1
define STDERR 2

define DOSWRITE 0x40
define DOSEXIT  0x4C

segment extra

macro DosWrite handle, string, len
{
    mov ax, text
    mov ds, ax

    mov ah, DOSWRITE
    mov bx, handle
    mov dx, string
    mov cx, len
    int 21h
}

macro DosExit retval
{
    mov ah, DOSEXIT
    mov al, retval
    int 21h
}

segment main

_start:
    DosWrite STDOUT, msg, msg.len
    DosExit 0

segment text

msg:
    db 'Hello world.', 0x0D, 0x0A
    .len = $-msg
