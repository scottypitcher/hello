NASM=nasm

# Require MacOS X 10.4 "Tiger" for our i386 & x86_64 binaries.
LDFLAGS=-L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -macosx_version_min 10.4

BIN1=hellox86
OBJ1=hellox86.o
SRC1=hellox86.asm

BIN2=hellox64
OBJ2=hellox64.o
SRC2=hellox64.asm

all: $(BIN1) $(BIN2)

$(OBJ1): $(SRC1)
	$(NASM) -f macho $(SRC1)

$(BIN1): $(OBJ1)
	$(LD) $(LDFLAGS) -o $(BIN1) $(OBJ1)

$(OBJ2): $(SRC2)
	$(NASM) -f macho64 $(SRC2)

$(BIN2): $(OBJ2)
	$(LD) $(LDFLAGS) -o $(BIN2) $(OBJ2)

clean:
	rm -f $(BIN1) $(BIN2)
	rm -f $(OBJ1) $(OBJ2)
