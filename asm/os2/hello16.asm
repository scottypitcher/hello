;
;  "Hello world" for 16-bit OS/2 in 80286 assembly.
;
;  Via https://jeffpar.github.io/kbarchive/kb/072/Q72698/
;
;  Tested with Microsoft MASM 6.00B.
;
;  Build HELLO16.EXE with:
;
;  set INCLUDE=c:\masm\include
;  set LIB=c:\masm\lib
;  ml hello16.asm hello.def
;

includelib os2.lib
include os2.inc

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

STDIN_FILENO = 0
STDOUT_FILENO = 1
STDERR_FILENO = 2

_start:
    invoke DosWrite, STDOUT_FILENO, addr msg, lengthof msg, addr written
    invoke DosExit, 1, 0

_text ends

end _start
