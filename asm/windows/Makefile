NASM=nasm
FASM=fasm
LINK=link
RM=del

BIN1=hellox86.exe
OBJ1=hellox86.obj
SRC1=hellox86.asm

BIN2=hellox86-fasm.exe
SRC2=hellox86-fasm.asm

BIN3=hellox64.exe
OBJ3=hellox64.obj
SRC3=hellox64.asm

BIN4=hellox64-fasm.exe
SRC4=hellox64-fasm.asm

all: $(BIN1) $(BIN2) $(BIN3) $(BIN4)

$(BIN1): $(OBJ1)
	$(LINK) /subsystem:console /nodefaultlib /entry:_start $(OBJ1) kernel32.lib

$(OBJ1): $(SRC1)
	$(NASM) -fwin32 $(SRC1)

$(BIN2): $(SRC2)
	$(FASM) $(SRC2) $(BIN2)

$(BIN3): $(OBJ3)
	$(LINK) /subsystem:console /nodefaultlib /entry:_start $(OBJ3) kernel32.lib

$(OBJ3): $(SRC3)
	$(NASM) -fwin64 $(SRC3)

$(BIN4): $(SRC4)
	$(FASM) $(SRC4) $(BIN4)

clean:
	$(RM) $(BIN1)
	$(RM) $(OBJ1)
