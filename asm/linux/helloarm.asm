//
//  "Hello world" on Linux ARM 32-bit.
//
//  Build with:
//
//  arm-linux-gnueabi-as -o helloarm.o helloarm.asm
//  arm-linux-gnueabi-ld -o helloarm helloarm.o -s
//

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

.global _start

_start:
    mov r7, #SYS_WRITE  // write()
    mov r0, #stdout     // stdout
    ldr r1, =msg        // string text
    ldr r2, =msglen     // string length
    swi 0               // software interrupt

_exit:
    mov r7, #SYS_EXIT   // exit()
    mov r0, #0          // return code
    swi 0               // software interrupt
