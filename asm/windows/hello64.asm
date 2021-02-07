;
;  "Hello world" for AMD64 64-bit Windows NT.
;
;  Written for the Netwide Assembler (NASM) from http://www.nasm.us/
;  and LINK.EXE from Microsoft Visual C++ (or Visual Studio).
;
;  Build HELLO64.EXE with:
;
;  nasm -fwin32 hello64.asm
;  link /subsystem:console /nodefaultlib /entry:_start hello64.obj kernel32.lib
;
;  A free alternative to Microsoft LINK is GoLink from http://www.godevtool.com/.
;
;  golink /files /console /entry _start hello64.obj kernel32.dll
;

section .data

msg:
    db 'Hello world.', 0x0A
    .len: equ $-msg

global _start

extern GetStdHandle
extern WriteFile
extern ExitProcess

section .text

%macro _GetStdHandle 1
    ; 32 bytes of shadow space
    sub rsp, 32
    ; HANDLE WINAPI GetStdHandle(nStdHandle)
    mov rcx, %1                ; nStdHandle
    call GetStdHandle          ; GetStdHandle()
    ; remove previous 32 bytes of shadow space
    add rsp, 32
%endmacro

%macro _WriteFile 5
    ; 32 bytes of shadow space
    ; plus 8 bytes for the 5th parameter
    ; then align the stack to a multiple of 16 bytes (48)
    sub rsp, 32 + 8 + 8

    ; BOOL WriteFile(hFile, lpBuffer, nNumberOfBytesToWrite, lpNumberOfBytesWritten, lpOverlapped)
    ; Note: Parameters are pushed in reverse order.
    mov rcx, %1                       ; hFile
    mov rdx, %2                       ; lpBuffer
    mov r8, %3                        ; nNumberOfBytesToWrite
    mov r9, %4                        ; lpNumberOfBytesWritten
    mov qword [rsp + 4 * 8], %5       ; lpOverlapped
    call WriteFile                    ; WriteFile()
    ; remove previous 48 bytes of shadow space
    add rsp, 48
%endmacro

%macro _ExitProcess 1
    ; 32 bytes of shadow space
    sub rsp, 32
    ; VOID ExitProcess(uExitCode)
    mov rcx, %1                       ; uExitCode
    call ExitProcess                  ; ExitProcess()
    ; remove previous 32 bytes of shadow space
    add rsp, 32
%endmacro

STD_OUTPUT_HANDLE equ -11

_start:
    ; align stack to a multiple of 16 bytes
    sub rsp, 8

    _GetStdHandle STD_OUTPUT_HANDLE

    ; the return value of GetStdHandle() is in RAX

    _WriteFile rax, msg, msg.len, 0, 0

    _ExitProcess 0
