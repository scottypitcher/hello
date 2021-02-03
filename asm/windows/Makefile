NASM=nasm
LINK=link
RM=del

BIN1=hello32.exe
SRC1=hello32.asm
OBJ1=hello32.obj

all: $(BIN1)

$(BIN1): $(OBJ1)
	$(LINK) /subsystem:console /nodefaultlib /entry:start hello32.obj kernel32.lib

$(OBJ1): $(SRC1)
	$(NASM) -fwin32 $(SRC1)

clean:
	$(RM) $(BIN1)
	$(RM) $(OBJ1)
