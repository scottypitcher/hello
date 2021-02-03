;
;  TODO header
;

.model small
.stack 256
.code

; TODO consts

; TODO func macros

_start:
    mov ax, @data
    mov ds, ax
    lea dx, msg
    mov ah, 09h
    int 21h

    mov ax, 4C00h
    int 21h

.data
    msg byte "This program cannot be run in a DOS session.", 0Dh, 0Dh, 0Ah, "$"

end _start
