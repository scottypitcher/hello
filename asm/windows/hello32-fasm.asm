;
;  "Hello world" for Intel 80386 32-bit Windows NT.
;
;  Written for the Flat Assembler (FASM) from https://flatassembler.net/
;
;  Requires win32a.inc and related files, supplied with the Windows
;  distribution of FASM.
;
;  Build HELLO32.EXE with:
;
;  set INCLUDE=c:\fasm\include
;  fasm hello32-fasm.asm hello32.exe
;
;  It's possible to cross-compile from Linux/BSD, etc. Ensure INCLUDE
;  points to the location of win32a.inc.
;

format pe console

include 'win32a.inc'

entry _start

_start:
    invoke GetStdHandle, STD_OUTPUT_HANDLE
    invoke WriteFile, eax, msg, msg.len, 0, 0
    invoke ExitProcess, 0

section '.idata' import data readable writeable
    library kernel32, 'KERNEL32.DLL'
    include 'api/kernel32.inc'

section '.data' data readable writeable
    msg db "Hello world.", 0Dh, 0Ah
    .len = ($-msg)
