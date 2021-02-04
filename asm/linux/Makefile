NASM=nasm

ARMAS=arm-linux-gnueabi-as
ARMLD=arm-linux-gnueabi-ld

BIN1=hellox86
BIN2=hellox64
BIN3=helloarm

OBJ1=hellox86.o
OBJ2=hellox64.o
OBJ3=helloarm.o

SRC1=hellox86.asm
SRC2=hellox64.asm
SRC3=helloarm.asm

all: $(BIN1) $(BIN2) $(BIN3)

$(OBJ1): $(SRC1)
	$(NASM) -f elf $(SRC1)

$(BIN1): $(OBJ1)
	$(LD) -s -m elf_i386 -o $(BIN1) $(OBJ1)

$(OBJ2): $(SRC2)
	$(NASM) -f elf64 $(SRC2)

$(BIN2): $(OBJ2)
	$(LD) -s -m elf_x86_64 -o $(BIN2) $(OBJ2)

$(OBJ3): $(SRC3)
	$(ARMAS) -o $(OBJ3) $(SRC3)

$(BIN3): $(OBJ3)
	$(ARMLD) -s -o $(BIN3) $(OBJ3)

clean:
	rm -f $(OBJ1) $(OBJ2) $(OBJ3) $(BIN1) $(BIN2) $(BIN3)
