#
#  "Hello world" in 32-bit MIPS assembly for Linux.
#
#  Via https://ehrt74.medium.com/assembly-on-mips-and-linux-syscalls-d395a7b54426
#
#
#  Build with:
#
#  mips-linux-gnu-as -o hellomips.o hellomips.asm
#  mips-linux-gnu-ld -o hellomips hellomips.o
#

#  MIPS32 Linux syscalls begin at 4000.
#  See /usr/mips-linux-gnu/include/asm/unistd.h.

.set SYS_WRITE, 4000 + 4
.set SYS_EXIT,  4000 + 1

.set stdin, 0
.set stdout, 1
.set stderr, 2

.rdata
.align 2

msg:
    .ascii "Hello world.\n"
    msglen = .-msg

.align 4

.text

.global __start

__start:
    li $v0, SYS_WRITE
    la $a0, stdout
    la $a1, msg
    li $a2, msglen
    syscall

    li $v0, SYS_EXIT
    li $a0, 0
    syscall
