// |RAM[256]| RAM[3] | RAM[4] |RAM[3032|RAM[3046|

// |   6084 |   3030 |   3040 |     32 |     46 |

// |RAM[256]| RAM[3] | RAM[4] |RAM[3032|RAM[3046|

// |   6084 |   3030 |   3040 |     32 |     46 |

// load PointerTest.asm,

// output-file PointerTest.out,

// compare-to PointerTest.cmp,

// output-list RAM[256]%D1.6.1 RAM[3]%D1.6.1

// RAM[4]%D1.6.1 RAM[3032]%D1.6.1 RAM[3046]%D1.6.1;

// set RAM[0] 256,

// repeat 450 {

// ticktock;

// }

// output;

// push constant 3030
@3030
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop pointer 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push constant 3040
@3040
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop pointer 1
@THAT
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop this 2
@THIS
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push constant 46
@46
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop that 6
@THAT
D=M
@6
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push pointer 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// push pointer 1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
A=A-1
M=D+M

// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
AM=M-1
D=M
A=A-1
M=M-D

// push that 6
@THAT
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
A=A-1
M=D+M

// load PointerTest.vm,

// output-file PointerTest.out,

// compare-to PointerTest.cmp,

// output-list RAM[256]%D1.6.1 RAM[3]%D1.6.1 RAM[4]%D1.6.1

// RAM[3032]%D1.6.1 RAM[3046]%D1.6.1;

// set RAM[0] 256,

// repeat 15 {

// vmstep;

// }

// output;
