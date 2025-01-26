#
#  "Hello world" on Linux RISC-V 64-bit.
#
#  Build with:
#
#  riscv64-linux-gnu-as -o helloriscv64.o helloriscv64.asm
#  riscv64-linux-gnu-ld -o helloriscv64 helloriscv64.o -s
#

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

.global _start

_start:
    # ssize_t write(int fd, const void *buf, size_t nbytes);

    addi a7, x0, SYS_WRITE  # write()
    addi a0, x0, stdout     # stdout
    la a1, msg              # string text
    addi a2, x0, msglen     # string length
    ecall                   # syscall

_exit:
    # void exit(int status);

    addi a7, x0, SYS_EXIT   # exit()
    addi a0, x0, 0          # return code
    ecall                   # syscall
