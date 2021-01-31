# "Hello world" in Microsoft C++/CLI for the .NET Framework
#
# Requires Microsoft Visual Studio.
#
# May also work with .NET Core (untested).

BIN=hello.exe
SRC=hello.cpp

CL=cl
CFLAGS=-clr

all: $(BIN)

$(BIN): $(SRC)
	$(CL) $(CFLAGS) $(SRC)

clean:
	del $(BIN)
