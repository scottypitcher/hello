ML=ml
LINK286=link
LINK386=link386
LOPT=/align:16
RM=del

DEF=hello.def

BIN1=hello16.exe
SRC1=hello16.asm
OBJ1=hello16.obj

BIN2=hello32.exe
SRC2=hello32.asm
OBJ2=hello32.obj

all: $(BIN1) $(BIN2)

$(OBJ1): $(SRC1)
	$(ML) -c $(SRC1)

$(BIN1): $(OBJ1)
	$(LINK286) $(LOPT) $(OBJ1),, nul,, $(DEF)

$(OBJ2): $(SRC2)
	$(ML) -c $(SRC2)

$(BIN2): $(OBJ2)
	$(LINK386) $(LOPT) $(OBJ2),, nul,, $(DEF)

clean:
	$(RM) $(BIN1)
	$(RM) $(OBJ1)
	$(RM) $(BIN2)
	$(RM) $(OBJ2)
