package main

import (
	"os"
	"path/filepath"

	"github.com/cedrickchee/vmtranslator/codewriter"
	"github.com/cedrickchee/vmtranslator/common/utils"
	"github.com/cedrickchee/vmtranslator/parser"
)

func main() {
	// get source and out files from cli
	path := os.Args[1]

	// normalize dir, file name, depending which option was provided
	name, dir, isFile := utils.PathInfo(path)
	if !isFile {
		path = dir + "*"
	}

	// get all files in path
	files, err := filepath.Glob(path)
	utils.HandleErr(err)

	// init code writer
	cw := codewriter.New(dir + name + ".asm")
	defer cw.Close()

	// parse and process all files
	for _, f := range files {
		currFileName, _, _ := utils.PathInfo(f)
		cw.SetFileName(currFileName)
		p := parser.New(f)
		defer p.Close()

		// parse file lines
		hasMore := true
		for hasMore {
			c, ok := p.Parse()
			hasMore = ok
			if ok {
				cw.WriteComment(c)
				arg1, arg2, arg3 := parser.CommandArgs(c)
				switch parser.CommandType(c) {
				case parser.CmdTypeArithmetic:
					cw.WriteArithmetic(arg1)
				case parser.CmdTypePush:
					cw.WritePush(arg2, arg3)
				case parser.CmdTypePop:
					cw.WritePop(arg2, arg3)
				case parser.CmdTypeComparator:
					cw.WriteComparator(arg1)
				}
			}
		}
	}

	utils.LogDone(path, dir+name+".asm")
}
