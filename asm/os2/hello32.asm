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

.386
.model flat

DosWrite proto syscall :dword, :ptr byte, :dword, :ptr dword
DosExit  proto syscall :dword

includelib <os2386.lib>

.stack 4096

.data

msg db "Hello world", 0Dh, 0Ah
written dd 0

.code

_start:
    invoke DosWrite, 1, addr msg, sizeof msg, addr written
    invoke DosExit, 0

end _start
