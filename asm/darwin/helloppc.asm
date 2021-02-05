;
;  "Hello world" on 32-bit PowerPC for Apple OS X (Darwin).
;
;  Via https://en.wikibooks.org/wiki/Computer_Programming/Hello_world#RISC_processor:_PowerPC.2C_Mac_OS_X.2C_GAS
;
;
;  Build with:
;
;  as -arch ppc -o helloppc.o helloppc.asm
;  ld -o helloppc helloppc.o
;

.set SYS_WRITE, 4
.set SYS_EXIT,  1

.set stdin,  0
.set stdout, 1
.set stderr, 2

.data

msg:
    .ascii "Hello world.\n"
    msglen = .-msg
 
.text

.globl _main

_main:
    ; write(stdout, msg, msglen)
    li r5, msglen
    addis r4, 0, ha16(msg)   ; load high 16 bits of address of output string
    addi r4, r4, lo16(msg)   ; load low 16 bits of address of output string
    li r3, stdout
    li r0, SYS_WRITE
    sc                       ; syscall
 
    ; exit(0)
    li r3, 0
    li r0, SYS_EXIT
    sc
