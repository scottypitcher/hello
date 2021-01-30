# Makefile for GNU Cobol

COBOL=cobc
CFLAGS=-x
COPTS=-O2
BIN=hello
SRC=hello.cbl

all: $(BIN)

$(BIN): $(SRC)
	$(COBOL) $(COPTS) $(CFLAGS) $(SRC)

clean:
	rm -f $(BIN)
