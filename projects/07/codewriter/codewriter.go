package codewriter

import (
	"fmt"
	"strconv"
	"strings"

	"github.com/cedrickchee/vmtranslator/common/writer"
)

// CodeWriter type
type CodeWriter struct {
	*writer.Writer
	count    int
	fileName string
	funcName string
}

// New initializes CodeWriter
func New(filePath string) *CodeWriter {
	return &CodeWriter{writer.New(filePath), 0, "", ""}
}

// WriteArithmetic ...
func (cw *CodeWriter) WriteArithmetic(cmd string) {
	var asm string
	switch cmd {
	case "add":
		asm = "@SP\nAM=M-1\nD=M\nA=A-1\nM=D+M\n"
	case "sub":
		asm = "@SP\nAM=M-1\nD=M\nA=A-1\nM=M-D\n"
	case "neg":
		asm = "@SP\nA=M-1\nM=-M"
	case "and":
		asm = "@SP\nAM=M-1\nD=M\nA=A-1\nM=D&M\n"
	case "or":
		asm = "@SP\nAM=M-1\nD=M\nA=A-1\nM=D|M\n"
	case "not":
		asm = "@SP\nA=M-1\nM=!M\n"
	}
	cw.WriteLine(asm)
}

// WriteComparator ...
func (cw *CodeWriter) WriteComparator(arg1 string) {
	comp := strings.ToUpper(arg1)
	count := cw.nextCount()
	cw.WriteLine("@SP\nAM=M-1\nD=M\nA=A-1\nD=M-D\n" +
		"@" + comp + ".true." + count + "\nD;J" + comp + "\n" +
		"@SP\nA=M-1\nM=0\n@" + comp + ".after." + count + "\n" +
		"0;JMP\n(" + comp + ".true." + count + ")\n@SP\nA=M-1\n" +
		"M=-1\n(" + comp + ".after." + count + ")\n")
}

// WritePush ...
func (cw *CodeWriter) WritePush(segment string, val int) {
	var asm string
	valStr := strconv.Itoa(val)
	switch segment {
	case "constant":
		asm = "@" + valStr + "\nD=A\n"
	case "local":
		asm = "@LCL\nD=M\n@" + valStr + "\nA=D+A\nD=M\n"
	case "argument":
		asm = "@ARG\nD=M\n@" + valStr + "\nA=D+A\nD=M\n"
	case "this":
		asm = "@THIS\nD=M\n@" + valStr + "\nA=D+A\nD=M\n"
	case "that":
		asm = "@THAT\nD=M\n@" + valStr + "\nA=D+A\nD=M\n"
	case "pointer":
		if val == 0 {
			asm = "@THIS\nD=M\n"
		} else {
			asm = "@THAT\nD=M\n"
		}
	case "static":
		asm = "@" + cw.fileName + "." + valStr + "\nD=M\n"
	case "temp":
		asm = "@R5\nD=A\n@" + valStr + "\nA=D+A\nD=M\n"
	}
	cw.WriteLine(asm + "@SP\nA=M\nM=D\n@SP\nM=M+1\n")
}

// WritePop ...
func (cw *CodeWriter) WritePop(segment string, val int) { // arg2, arg3
	var asm string
	valStr := strconv.Itoa(val)
	switch segment {
	case "local":
		asm = "@LCL\nD=M\n@" + valStr + "\nD=D+A\n"
	case "argument":
		asm = "@ARG\nD=M\n@" + valStr + "\nD=D+A\n"
	case "this":
		asm = "@THIS\nD=M\n@" + valStr + "\nD=D+A\n"
	case "that":
		asm = "@THAT\nD=M\n@" + valStr + "\nD=D+A\n"
	case "pointer":
		if val == 0 {
			asm = "@THIS\nD=A\n"
		} else {
			asm = "@THAT\nD=A\n"
		}
	case "static":
		asm = "@" + cw.fileName + "." + valStr + "\nD=A\n"
	case "temp":
		asm = "@R5\nD=A\n@" + valStr + "\nD=D+A\n"
	}
	cw.WriteLine(asm + "@R13\nM=D\n@SP\nAM=M-1\nD=M\n@R13\nA=M\nM=D\n")
}

// WriteComment ...
func (cw *CodeWriter) WriteComment(s string) {
	cw.WriteLine("// " + s)
}

// SetFileName ...
func (cw *CodeWriter) SetFileName(fn string) {
	cw.fileName = fn
}

// Increment counter, return stringified count
func (cw *CodeWriter) nextCount() string {
	cw.count++
	return fmt.Sprintf("%d", cw.count)
}
