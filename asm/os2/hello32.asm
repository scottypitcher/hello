;
; "Hello world" for 32-bit OS/2 in 80386 assembly.
;
; Via https://jeffpar.github.io/kbarchive/kb/094/Q94577/
;
; Tested with Microsoft MASM 6.00B and OS/2's LINK386.
;
; Build HELLO32.EXE with:
;
; ml -c hello32.asm
; link386 hello32.obj,,,,,
;
; You may see two warnings from LINK386:
;
; LINK386 :  warning L4071: application type not specified; assuming WINDOWCOMPAT
; LINK386 :  warning L4036: no automatic data segment
;
; Both of these can be safely ignored.
;

includelib os2386.lib

.386
.model flat, syscall

DosWrite PROTO NEAR32 syscall, hf:WORD, pvBuf:NEAR32, cbBuf:WORD, pcbBytesWritten:NEAR32
DosExit PROTO NEAR32 syscall, fTerminate:WORD, ulExitCode:WORD

.stack 4096

.data

msg db "Hello world.", 0Dh, 0Ah
written dw 0

.code

STDIN_FILENO = 0
STDOUT_FILENO = 1
STDERR_FILENO = 2

_start:
    invoke DosWrite, STDOUT_FILENO, NEAR32 PTR msg, LENGTHOF msg, NEAR32 PTR written
    invoke DosExit, 0, 0

end _start
