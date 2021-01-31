# "Hello world" in Common Intermediate Language (CIL) for the Microsoft .NET Framework
#
# Linux/BSD makefile, building with Mono.

BIN=hello.exe
SRC=hello.il
ILASM=ilasm

all: $(BIN)

$(BIN): $(SRC)
	$(ILASM) $(SRC)

clean:
	rm -f $(BIN)
