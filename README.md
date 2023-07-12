# The 156 Byte Executable Brainfuck Interpreter

This is a Brainfuck interpreter written in x86 assembly for Linux. It assebmles to a 156 byte binary.

# Building

To build you will need nasm and make. Run make to build the binary.

# Running

Example command: 
`./bf2 "++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++."`

This will output
`Hello, World!`

For ease of testing you can run 
`make hello`

General usage:
`./bf2 <program>`
You must pass the program argument.

Note that the program always exits with exit code 1 but this is expected behavior.
