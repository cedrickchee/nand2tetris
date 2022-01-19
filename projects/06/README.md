# Assembler.hack

Assembler.hack is a 16-bit machine code assembler for the Hack Assembly
Language.

This was done as part of building a complete 16-bit computer from the grounds up
through the book, *The Elementes of Computing Systems* and
[MOOC](https://www.coursera.org/learn/build-a-computer/), which is informally
known as [nand2tetris](http://www.nand2tetris.org). Hack is also the name of the
computer.

Learn more about the project: [Project 6](https://www.nand2tetris.org/project06)

## Description

Assembler.hack takes a program source code file written in the Hack Assembly
Language, which is a `.asm` text file, and then translates it into binary machine
code (Hack Machine Language). The assembled machine code program is then written
to a new `.hack` text file with the same name.

The Assembling process is implemented in two passes. The first pass scans the
whole program, registering the labels only in the Symbol Table. The second pass
scans the whole program again, registering all variables in the Symbol Table,
substituting the symbols with their respective memory and/or instruction
addresses from the Symbol Table, generating binary machine code and then writing
the assembled machine code to the new `.hack` text file.

Source code is organized into several components, the decisions for their names,
interfaces and APIs were already specified in the book as sort of a
specification-implementation contract. All components of the Assembler reside in
the respective Go Modules, as follows:

1. **main.go**: Main module. Implements the two passes and glues the other
   components together.
2. **parser**: Simple parser. Parses the instructions by looking ahead 1 or 2
   characters to determine their types and structures. Also implements a simple
   lexer which is used by the parser to break an instruction to smaller parts
   and sturcture it in a way that makes it easy to convert it to machine code.
4. **codewriter**: Generates binary machine code for instructions. For
   C-Instructions, it generates machine code for its constituting parts and then
   merges them back altogether.
5. **symboltable**: Implements a lookup table which is used to register symbols
   (labels and variables) and look up their memory addresses.

## Example Usage

Run tests:

```sh
$ go test -v *.go
=== RUN   TestOuput
- test/asm/max/Max.asm           -> test/out_test_1.hack           ✔ done
- test/asm/add/Add.asm           -> test/out_test_0.hack           ✔ done
- test/asm/rect/Rect.asm         -> test/out_test_5.hack           ✔ done
- test/asm/max/MaxL.asm          -> test/out_test_2.hack           ✔ done
- test/asm/rect/RectL.asm        -> test/out_test_6.hack           ✔ done
- test/asm/pong/PongL.asm        -> test/out_test_4.hack           ✔ done
- test/asm/pong/Pong.asm         -> test/out_test_3.hack           ✔ done
--- PASS: TestOuput (0.31s)
PASS
ok  	command-line-arguments	0.314s
```

The test suite checks our work, using the [tests](./test) described
[here](https://www.nand2tetris.org/project06).
