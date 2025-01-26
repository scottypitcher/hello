//
//  "Hello world" on Linux ARM 64-bit.
//
//  Build with:
//
//  aarch64-linux-gnu-as -o helloaarch64.o helloaarch64.asm
//  aarch64-linux-gnu-ld -o helloaarch64 helloaarch64.o -s
//

.set SYS_WRITE, 64
.set SYS_EXIT,  93

.set stdin,  0
.set stdout, 1
.set stderr, 2

.data

msg:
    .ascii "Hello world.\n"
    msglen = .-msg

.text

.globl _start

_start:
    // ssize_t write(int fd, const void *buf, size_t nbytes);

    mov w8, #SYS_WRITE  // write()
    mov x0, #stdout     // stdout
    ldr x1, =msg        // string text
    ldr x2, =msglen     // string length
    svc 0               // syscall

_exit:
    // void exit(int status);

    mov w8, #SYS_EXIT   // exit()
    mov x0, #0          // return code
    svc 0               // syscall
