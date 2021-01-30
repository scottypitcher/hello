BIN=hello
SRC=hello.rs

RUST=rustc
LOPTS=-C link-args=-s

all: $(BIN)

$(BIN): $(SRC)
	$(RUST) $(SRC) $(LOPTS)

clean:
	rm -f $(BIN)
