;
;  "Hello world" on 32-bit PowerPC for Apple OS X (Darwin).
;
;  Via https://en.wikibooks.org/wiki/Computer_Programming/Hello_world#RISC_processor:_PowerPC.2C_Mac_OS_X.2C_GAS
;  Via http://index-of.es/Exploit/PowerPC-OS%20X%20(Darwin)%20Shellcode%20Assembly.pdf
;  Via http://uninformed.org/?v=1&a=1&t=pdf  "Mac OS X PPC Shellcode Tricks" by H D Moore
;
;
;  Build with:
;
;  as -arch ppc -o helloppc.o helloppc.asm
;  ld -o helloppc helloppc.o
;

.data

.align 2

msg:
    .ascii "Hello world.\n"
    msglen = .-msg

.set SYS_WRITE, 4
.set SYS_EXIT,  1

.set stdin,  0
.set stdout, 1
.set stderr, 2

.text

.align 2

.globl _main

_main:
    ; write(stdout, msg, msglen)
    li r0, SYS_WRITE
    li r3, stdout
    lis r4, ha16(msg)
    ori r4, r4, lo16(msg)
    li r5, msglen
    sc  ; syscall

    ;  "An interesting feature of Mac OS X [on PowerPC] is that a
    ;  successful system call will return to the address 4 bytes
    ;  after the end of ’sc’ instruction and a failed system call
    ;  will return directly after the ’sc’ instruction. This allows
    ;  you to execute a specific instruction only when the system
    ;  call fails." - H D Moore

    ; exit(0)
    nop
    li r0, SYS_EXIT
    li r3, 0
    sc
