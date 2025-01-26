NASM=nasm

ARM_AS=arm-linux-gnueabi-as
ARM_LD=arm-linux-gnueabi-ld

MIPS_AS=mips-linux-gnu-as
MIPS_LD=mips-linux-gnu-ld

PPC_AS=powerpc-linux-gnu-as
PPC_LD=powerpc-linux-gnu-ld

AARCH64_AS=aarch64-linux-gnu-as
AARCH64_LD=aarch64-linux-gnu-ld

RISCV64_AS=riscv64-linux-gnu-as
RISCV64_LD=riscv64-linux-gnu-ld

PPC64_AS=powerpc64-linux-gnu-as
PPC64_LD=powerpc64-linux-gnu-ld

BIN1=hellox86
BIN2=hellox64
BIN3=helloarm
BIN4=hellomips
BIN5=helloppc
BIN6=helloaarch64
BIN7=helloriscv64
BIN8=helloppc64

OBJ1=hellox86.o
OBJ2=hellox64.o
OBJ3=helloarm.o
OBJ4=hellomips.o
OBJ5=helloppc.o
OBJ6=helloaarch64.o
OBJ7=helloriscv64.o
OBJ8=helloppc64.o

SRC1=hellox86.asm
SRC2=hellox64.asm
SRC3=helloarm.asm
SRC4=hellomips.asm
SRC5=helloppc.asm
SRC6=helloaarch64.asm
SRC7=helloriscv64.asm
SRC8=helloppc64.asm

all: $(BIN1) $(BIN2) $(BIN3) $(BIN4) $(BIN5) $(BIN6) $(BIN7) $(BIN8)
	file $(BIN1) $(BIN2) $(BIN3) $(BIN4) $(BIN5) $(BIN6) $(BIN7) $(BIN8)

$(OBJ1): $(SRC1)
	$(NASM) -f elf $(SRC1)

$(BIN1): $(OBJ1)
	$(LD) -s -m elf_i386 -o $(BIN1) $(OBJ1)

$(OBJ2): $(SRC2)
	$(NASM) -f elf64 $(SRC2)

$(BIN2): $(OBJ2)
	$(LD) -s -m elf_x86_64 -o $(BIN2) $(OBJ2)

$(OBJ3): $(SRC3)
	$(ARM_AS) -o $(OBJ3) $(SRC3)

$(BIN3): $(OBJ3)
	$(ARM_LD) -s -o $(BIN3) $(OBJ3)

$(OBJ4): $(SRC4)
	$(MIPS_AS) -o $(OBJ4) $(SRC4)

$(BIN4): $(OBJ4)
	$(MIPS_LD) -s -o $(BIN4) $(OBJ4)

$(OBJ5): $(SRC5)
	$(PPC_AS) -o $(OBJ5) $(SRC5)

$(BIN5): $(OBJ5)
	$(PPC_LD) -s -o $(BIN5) $(OBJ5)

$(OBJ6): $(SRC6)
	$(AARCH64_AS) -o $(OBJ6) $(SRC6)

$(BIN6): $(OBJ6)
	$(AARCH64_LD) -s -o $(BIN6) $(OBJ6)

$(OBJ7): $(SRC7)
	$(RISCV64_AS) -march=rv64imac -o $(OBJ7) $(SRC7)

$(BIN7): $(OBJ7)
	$(RISCV64_LD) -s -o $(BIN7) $(OBJ7)

$(OBJ8): $(SRC8)
	$(PPC64_AS) -o $(OBJ8) $(SRC8)

$(BIN8): $(OBJ8)
	$(PPC64_LD) -s -o $(BIN8) $(OBJ8)

clean:
	rm -f $(BIN1) $(BIN2) $(BIN3) $(BIN4) $(BIN5) $(BIN6) $(BIN7) $(BIN8)
	rm -f $(OBJ1) $(OBJ2) $(OBJ3) $(OBJ4) $(OBJ5) $(OBJ6) $(OBJ7) $(OBJ8)
