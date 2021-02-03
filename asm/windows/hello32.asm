;
;  "Hello world" for Intel 80386 32-bit Windows NT.
;
;  Written for the Netwide Assembler (NASM) from http://www.nasm.us/
;  and LINK.EXE from Microsoft Visual C++ (or Visual Studio).
;
;  Build HELLO32.EXE with:
;
;  nasm -fwin32 hello32.asm
;  link /subsystem:console /nodefaultlib /entry:_start hello32.obj kernel32.lib
;
;  Optional:
;
;  Add "/align:16" to the LINK command above to shrink HELLO32.EXE
;  from 3072 bytes down to 784.
;
;  A free alternative to Microsoft LINK is GoLink from http://www.godevtool.com/.
;
;  golink /files /console /entry _start hello32.obj kernel32.dll
;

section .data

STD_OUTPUT_HANDLE equ -11

msg:
    db 'Hello world.', 0x0A
    .len: equ $-msg

global _start

extern  _GetStdHandle@4
extern  _WriteFile@20
extern  _ExitProcess@4

section .text

_start:
    ; establish a new stack frame
    mov ebp, esp
    sub esp, 4

    ; HANDLE WINAPI GetStdHandle(nStdHandle)
    push STD_OUTPUT_HANDLE        ; nStdHandle
    call _GetStdHandle@4          ; GetStdHandle()

    ; the return value of GetStdHandle() is in EAX

    ; BOOL WriteFile(hFile, lpBuffer, nNumberOfBytesToWrite, lpNumberOfBytesWritten, lpOverlapped)
    ; Note: Parameters are pushed in reverse order.
    push 0                        ; lpOverlapped
    push 0                        ; lpNumberOfBytesWritten (set to NULL)
    push msg.len                  ; nNumberOfBytesToWrite
    push msg                      ; lpBuffer
    push eax                      ; hFile; EAX still has the result from GetStdHandle()
    call _WriteFile@20            ; WriteFile()

    ; VOID ExitProcess(uExitCode)
    push 0                        ; uExitCode
    call _ExitProcess@4           ; ExitProcess()
