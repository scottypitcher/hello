;
;  "Hello world" for MacOS on 64-bit ARM.
;
;  Untested!
;

.set SYS_WRITE, 4
.set SYS_EXIT,  1

.set stdin,  0
.set stdout, 1
.set stderr, 2

.global _main

msg:
    .ascii "Hello world.\n"
    msglen = .-msg

.align 4

_main:
    ;  write(stdout, msg, msglen)
    mov X0, stdout
    adr X1, msg
    mov X2, msglen
    mov X16, SYS_WRITE
    svc 0x80

    ;  exit(0)
    mov X0, 0
    mov X16, SYS_EXIT
    svc 0x80
