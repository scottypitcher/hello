NIM=nim
NOPT=--verbosity:0 --opt:size -d:quick --threads:off -d:strip

hello: hello.nim
	$(NIM) c $(NOPT) hello.nim

clean:
	rm -f hello
