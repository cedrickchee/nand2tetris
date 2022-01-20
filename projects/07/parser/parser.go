package parser

import (
	"strconv"
	"strings"

	p "github.com/cedrickchee/vmtranslator/common/parser"
)

// Command types
const (
	CmdTypePush       = iota // push
	CmdTypePop               // pop
	CmdTypeArithmetic        // arithmetic
	CmdTypeComparator        // gt, lt, eq
)

// New initializes Parser
func New(sourceFile string) *p.Parser {
	return p.New(sourceFile)
}

// CommandArgs returns command args
func CommandArgs(c string) (arg1 string, arg2 string, arg3 int) {
	args := strings.Split(c, " ")
	arg1 = args[0]
	if len(args) > 1 {
		arg2 = args[1]
	}
	if len(args) == 3 {
		arg3, _ = strconv.Atoi(args[2])
	}
	return
}

// CommandType returns command type constant
func CommandType(c string) int {
	arg1, _, _ := CommandArgs(c)
	switch {
	case arg1 == "push":
		return CmdTypePush
	case arg1 == "pop":
		return CmdTypePop
	case arg1 == "eq" || arg1 == "gt" || arg1 == "lt":
		return CmdTypeComparator
	default:
		return CmdTypeArithmetic
	}
}
