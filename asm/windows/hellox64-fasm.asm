;
;  "Hello world" for AMD64 64-bit Windows NT.
;
;  Written for the Flat Assembler (FASM) from https://flatassembler.net/
;
;  Requires win64a.inc and related files, supplied with the Windows
;  distribution of FASM.
;
;  Build HELLOX64.EXE with:
;
;  set INCLUDE=c:\fasm\include
;  fasm hellox64-fasm.asm hellox64.exe
;
;  It's possible to cross-compile from Linux/BSD, etc. Ensure INCLUDE
;  points to the location of win64a.inc.
;

format pe64 console

include 'win64a.inc'

entry _start

section '.text' code readable executable

_start:
    sub rsp, 8 * 5    ; reserve stack for API use and make stack dqword aligned
    invoke GetStdHandle, STD_OUTPUT_HANDLE
    invoke WriteFile, eax, msg, msg.len, 0, 0
    invoke ExitProcess, 0

section '.idata' import data readable writeable
    library kernel32, 'KERNEL32.DLL'
    include 'api/kernel32.inc'

section '.data' data readable writeable
    msg db "Hello world.", 0Dh, 0Ah
    .len = ($-msg)
