;
;  DOS stub for OS/2 executables.
;
;  Displays "This program cannot be run in a DOS session." and exits.
;
;  Requires Microsoft Macro Assembler. Tested with MASM 6.00B.
;
;  Build DOSSTUB.EXE with:
;
;  ml -c dosstub.asm
;  link dosstub.obj,,,,,

.model small
.stack 100h
.code

_DOSWRITETOSTDOUT = 09h
_DOSEXIT          = 4Ch

DosWriteToStdOut macro string
    mov ax, @data
    mov ds, ax
    lea dx, string
    mov ah, _DOSWRITETOSTDOUT
    int 21h
endm

DosExit macro retval
    mov ah, _DOSEXIT
    mov al, retval
    int 21h
endm

_start:
    DosWriteToStdout msg
    DosExit 0

.data
    msg byte "This program cannot be run in a DOS session.", 0Dh, 0Dh, 0Ah, "$"

end _start
