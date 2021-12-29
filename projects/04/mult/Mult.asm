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

// Computes R2 = R0 * R1
//          R2 = R0 + previous R2
// Example: R2 = 2 * 3 = 6
// Trace table:
// a=R0
// n=R1
// R2=a+R2
// cond=i-n   (loop condition)
// 
//                       iterations
//           0      | 1      | 2      | 3     |
//         ------------------------------------
//     R0: | 2      |        |        |       |
//     R1: | 3      |        |        |       |
//      i: | 0      | 1      | 2      | 3     |
//   cond: | 0-3=-3 | 1-3=-2 | 2-3=-1 | 3-3=0 | 
//     R2: | 2+0=2  | 2+2=4  | 2+4=6  | end   |
//
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
  M=0     // reset R2

(LOOP)
  @i
  D=M
  @n
  D=D-M
  @END
  D;JGE   // if i >= n goto END

  @a
  D=M     // read R0
  @R2
  M=D+M   // R2 = a + previous R2

  @i
  M=M+1   // i = i + 1

  @LOOP
  0;JMP

(END)
  @END
  0;JMP