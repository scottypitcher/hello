;
;  DOS stub for OS/2 executables.
;
;  Displays "This program cannot be run in a DOS session." and exits.
;
;  Requires the Flat Assembler (FASM) from https://flatassembler.net/
;
;  Build DOSSTUB.EXE with:
;
;  fasm dosstub.asm dosstub.exe

format MZ
entry main:_start
stack 100h

define DOSWRITETOSTDOUT 0x09
define DOSEXIT          0x4C

segment extra

macro DosWriteToStdOut string
{
    mov ax, text
    mov ds, ax

    mov ah, DOSWRITETOSTDOUT
    mov dx, string
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
    DosWriteToStdOut msg
    DosExit 0

segment text

msg:
    db "This program cannot be run in a DOS session.", 0x0D, 0x0D, 0x0A, "$"
