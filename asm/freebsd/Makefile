NASM=nasm

BIN1=hellox86
BIN2=hellox64

OBJ1=hellox86.o
OBJ2=hellox64.o

SRC1=hellox86.asm
SRC2=hellox64.asm

all: $(BIN1) $(BIN2)

$(OBJ1): $(SRC1)
	$(NASM) -f elf $(SRC1)

$(OBJ2): $(SRC2)
	$(NASM) -f elf64 $(SRC2)

$(BIN1): $(OBJ1)
	$(LD) -s -m elf_i386_fbsd -o $(BIN1) $(OBJ1)

$(BIN2): $(OBJ2)
	$(LD) -s -m elf_amd64_fbsd -o $(BIN2) $(OBJ2)

clean:
	rm -f $(OBJ1) $(OBJ2) $(BIN1) $(BIN2)
