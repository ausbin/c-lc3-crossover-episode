TOOLS = tools

.PHONY: default clean

default: runme.asm

main.asm: main.c
	$(TOOLS)/lcc -L $< -o $@

runme.asm: main.asm sumtorial.asm
	cat $^ >$@

clean:
	rm -f main.asm runme.asm
