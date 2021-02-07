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

msg:
    db 'Hello world.', 0x0A
    .len: equ $-msg

global _start

extern _GetStdHandle@4
extern _WriteFile@20
extern _ExitProcess@4

section .text

%macro GetStdHandle 1
    ; HANDLE WINAPI GetStdHandle(nStdHandle)
    push %1                       ; nStdHandle
    call _GetStdHandle@4          ; GetStdHandle()
%endmacro

%macro WriteFile 5
    ; BOOL WriteFile(hFile, lpBuffer, nNumberOfBytesToWrite, lpNumberOfBytesWritten, lpOverlapped)
    ; Note: Parameters are pushed in reverse order.
    push %5                       ; lpOverlapped
    push %4                       ; lpNumberOfBytesWritten
    push %3                       ; nNumberOfBytesToWrite
    push %2                       ; lpBuffer
    push %1                       ; hFile
    call _WriteFile@20            ; WriteFile()
%endmacro

%macro ExitProcess 1
    ; VOID ExitProcess(uExitCode)
    push %1                       ; uExitCode
    call _ExitProcess@4           ; ExitProcess()
%endmacro

STD_OUTPUT_HANDLE equ -11

_start:
    ; establish a new stack frame
    mov ebp, esp
    sub esp, 4

    GetStdHandle STD_OUTPUT_HANDLE

    ; the return value of GetStdHandle() is in EAX

    WriteFile eax, msg, msg.len, 0, 0
    ExitProcess 0
