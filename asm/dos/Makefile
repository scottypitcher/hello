# Makefile for Linux, cross-compiling to MS-DOS

NASM=nasm
FASM=fasm
RM=rm -f

BIN1=hello.com
BIN2=hello.exe

all: $(BIN1) $(BIN2)

hello.com: hellocom.asm
	$(NASM) -f bin hellocom.asm -o hello.com

hello.exe: helloexe.asm
	$(FASM) helloexe.asm hello.exe

clean:
	$(RM) $(BIN1) $(BIN2)
