// |RAM[256]|RAM[300]|RAM[401]|RAM[402]|RAM[3006|RAM[3012|RAM[3015|RAM[11] |

// |    472 |     10 |     21 |     22 |     36 |     42 |     45 |    510 |

// |RAM[256]|RAM[300]|RAM[401]|RAM[402]|RAM[3006|RAM[3012|RAM[3015|RAM[11] |

// |    472 |     10 |     21 |     22 |     36 |     42 |     45 |    510 |

// load BasicTest.asm,

// output-file BasicTest.out,

// compare-to BasicTest.cmp,

// output-list RAM[256]%D1.6.1 RAM[300]%D1.6.1 RAM[401]%D1.6.1

// RAM[402]%D1.6.1 RAM[3006]%D1.6.1 RAM[3012]%D1.6.1

// RAM[3015]%D1.6.1 RAM[11]%D1.6.1;

// set RAM[0] 256,

// set RAM[1] 300,

// set RAM[2] 400,

// set RAM[3] 3000,

// set RAM[4] 3010,

// repeat 600 {

// ticktock;

// }

// output;

// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop local 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push constant 21
@21
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 22
@22
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop argument 2
@ARG
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

// pop argument 1
@ARG
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push constant 36
@36
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop this 6
@THIS
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

// push constant 42
@42
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 45
@45
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop that 5
@THAT
D=M
@5
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// pop that 2
@THAT
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

// push constant 510
@510
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop temp 6
@R5
D=A
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

// push local 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push that 5
@THAT
D=M
@5
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

// push argument 1
@ARG
D=M
@1
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

// push this 6
@THIS
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push this 6
@THIS
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

// sub
@SP
AM=M-1
D=M
A=A-1
M=M-D

// push temp 6
@R5
D=A
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

// load BasicTest.vm,

// output-file BasicTest.out,

// compare-to BasicTest.cmp,

// output-list RAM[256]%D1.6.1 RAM[300]%D1.6.1 RAM[401]%D1.6.1

// RAM[402]%D1.6.1 RAM[3006]%D1.6.1 RAM[3012]%D1.6.1

// RAM[3015]%D1.6.1 RAM[11]%D1.6.1;

// set sp 256,

// set local 300,

// set argument 400,

// set this 3000,

// set that 3010,

// repeat 25 {

// vmstep;

// }

// output;
