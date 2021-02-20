ML=ml
LINK=link
LINK386=link386
RM=del

DEF=hello.def

BIN0=dosstub.exe
SRC0=dosstub.asm
OBJ0=dosstub.obj

BIN1=hello16.exe
SRC1=hello16.asm
OBJ1=hello16.obj

BIN2=hello32.exe
SRC2=hello32.asm
OBJ2=hello32.obj

all: $(BIN0) $(BIN1) $(BIN2)

$(OBJ0): $(SRC0)
	$(ML) -c $(SRC0)

$(BIN0): $(OBJ0)
	$(LINK) $(OBJ0),, nul,,,

$(OBJ1): $(SRC1)
	$(ML) -c $(SRC1)

$(BIN1): $(BIN0) $(OBJ1)
	$(LINK) $(OBJ1),, nul,, $(DEF)

$(OBJ2): $(SRC2)
	$(ML) -c $(SRC2)

$(BIN2): $(BIN1) $(OBJ2)
	$(LINK386) $(OBJ2),, nul,, $(DEF)

clean:
	$(RM) $(BIN0)
	$(RM) $(OBJ0)
	$(RM) $(BIN1)
	$(RM) $(OBJ1)
	$(RM) $(BIN2)
	$(RM) $(OBJ2)
