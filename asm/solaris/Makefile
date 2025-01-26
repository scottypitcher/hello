NASM=nasm

BIN1=hellox64
OBJ1=hellox64.o
SRC1=hellox64.asm

all: $(BIN1)

$(OBJ1): $(SRC1)
	$(NASM) -f elf64 $(SRC1)

$(BIN1): $(OBJ1)
	$(LD) -o $(BIN1) $(OBJ1) -s -d n

clean:
	rm -f $(OBJ1) $(BIN1)
