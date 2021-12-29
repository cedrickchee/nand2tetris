// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// The Hack machine language doesn't have a multiplication operation.
//
// All we have is addition and subtraction. So we're faced with a challenge of
// expressing a multiplication operation using addition and subtraction.

// Computes RAM[2] = a * n
// Example: RAM[2] = 2 * 3 = 2 + 2 + 2 = 6
// Usage: put a number (a) in RAM[0] and another number (n) in RAM[1]

// Declare and initialize variables
  @R0
  D=M
  @a
  M=D     // a = R0

  @R1
  D=M
  @n
  M=D     // n = R1

  @i
  M=0     // i = 0

  @R2
  M=0
  @sum
  M=0     // sum = 0

(LOOP)
  @i
  D=M
  @n
  D=D-M
  @STOP
  D;JGE   // if i >= n goto STOP

  @sum
  D=M
  @a
  D=D+M
  @sum
  M=D     // sum = sum + a
  @i
  M=M+1   // i = i + 1
  
  @LOOP
  0;JMP

(STOP)
  @sum
  D=M
  @R2
  M=D     // RAM[2] = sum

(END)
  @END
  0;JMP