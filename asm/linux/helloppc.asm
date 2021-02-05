#
#  "Hello world" in 32-bit PowerPC assembly for Linux.
#
#  Via https://developer.ibm.com/technologies/linux/articles/l-ppc/
#
#
#  Build with:
#
#  powerpc-linux-gnu-as -o helloppc.o helloppc.asm
#  powerpc-linux-gnu-ld -o helloppc helloppc.o
#

.set SYS_WRITE, 4
.set SYS_EXIT,  1

.set stdin,  0
.set stdout, 1
.set stderr, 2

.rdata

msg:
    .ascii "Hello world.\n"
    msglen = .-msg

.text

.global _start

_start:
    # write(stdout, msg, msglen)
    li 0, SYS_WRITE
    li 3, stdout
    lis 4, msg@ha      # load top 16 bits of output string
    addi 4, 4, msg@l   # load bottom 16 bits of output string
    li 5, msglen
    sc                 # syscall

    # exit(0)
    li 0, SYS_EXIT
    li 3, 0
    sc
