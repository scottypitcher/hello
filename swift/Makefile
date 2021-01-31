# "Hello world" in Apple's Swift language
#
# Tested in Ubuntu Linux & MacOS.

BIN=hello
SRC=hello.swift

SWC=swiftc
LFLAGS=-Xlinker -s

all: $(BIN)

$(BIN): $(SRC)
	$(SWC) $(SRC) $(LFLAGS)

clean:
	rm -f $(BIN)
