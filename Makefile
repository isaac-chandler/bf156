build:
	nasm -f bin bf156.S
	chmod +x ./bf156

hello: build
#The || true is required because the interpreter always returns an exit code of 1 (this saves 2 bytes)
	./bf156 "++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++." || true