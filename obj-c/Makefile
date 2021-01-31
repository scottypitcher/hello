# "Hello world" in Objective C.
#
# Makefile for Linux.
#
# Requires gnustep-config.
#
# In Ubuntu: sudo apt install gnustep-devel

CFLAGS=-W -Wall -Wno-expansion-to-defined
LFLAGS=-lgnustep-base -lobjc
GNUSTEPCFG=gnustep-config --objc-flags

BIN=hello
SRC=hello.m

all: $(BIN)

$(BIN): $(SRC)
	 $(CC) $(CFLAGS) $(SRC) `$(GNUSTEPCFG)` -o $(BIN) $(LFLAGS)

clean:
	rm -f $(BIN) $(BIN).d
