;
; "Hello world" for 16-bit OS/2 in 80286 assembly.
;
; via https://jeffpar.github.io/kbarchive/kb/072/Q72698/
;
; Tested with Microsoft MASM 6.00B.
;
; Build HELLO16.EXE with:
;
; ml hello16.asm

includelib os2.lib
include c:\masm\include\os2.inc

dgroup group _data

stack segment para stack 'STACK'
    word 256 dup(?)
stack ends

_data segment word public 'DATA'
    msg byte "Hello world.", 0Dh, 0Ah
    written dword ?
_data ends

_text segment word public 'CODE'
    assume cs:_text, ds:_data, ss:stack

_start:
    invoke DosWrite, 1, addr msg, lengthof msg, addr written
    invoke DosExit, 1, 0

_text ends

end _start
