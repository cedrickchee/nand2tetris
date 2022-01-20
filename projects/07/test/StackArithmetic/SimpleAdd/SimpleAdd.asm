// |  RAM[0]  | RAM[256] |

// |     257  |      15  |

// |  RAM[0]  | RAM[256] |

// |     257  |      15  |

// load SimpleAdd.asm,

// output-file SimpleAdd.out,

// compare-to SimpleAdd.cmp,

// output-list RAM[0]%D2.6.2 RAM[256]%D2.6.2;

// set RAM[0] 256,

// repeat 60 {

// ticktock;

// }

// output;

// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 8
@8
D=A
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

// load SimpleAdd.vm,

// output-file SimpleAdd.out,

// compare-to SimpleAdd.cmp,

// output-list RAM[0]%D2.6.2 RAM[256]%D2.6.2;

// set RAM[0] 256,

// repeat 3 {

// vmstep;

// }

// output;
