#
#  "Hello world" in 64-bit PowerPC assembly for Linux.
#
#  Via https://github.com/matja/asm-examples/blob/master/ppc64/hello.ppc64.linux.syscall.gas.asm
#
#  Build with:
#
#  powerpc64-linux-gnu-as -o helloppc.o helloppc.asm
#  powerpc64-linux-gnu-ld -o helloppc helloppc.o -s
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

_start: .quad ._start, .TOC.@tocbase, 0

._start:
    # write(stdout, msg, msglen)
    li     0, SYS_WRITE
    li     3, stdout
    lis    4, msg@highest
    ori    4, 4, msg@higher
    rldicr 4, 4, 32, 31
    oris   4, 4, msg@h
    ori    4, 4, msg@l
    li     5, msglen
    sc     # syscall

    # exit(0)
    li     0, SYS_EXIT
    li     3, 0
    sc     # syscall
