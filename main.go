package main

import (
	"io"
	"os"
	"os/exec"

	"github.com/creack/pty"
)

func main() {
	var command []string
	if len(os.Args) < 2 {
		command = []string{"/bin/sh"}
	} else {
		command = os.Args[1:]
	}
	c := exec.Command(command[0], command[1:]...)
	f, err := pty.Start(c)
	if err != nil {
		panic(err)
	}

	go func() {
		io.Copy(f, os.Stdin)
	}()

	go func() {
		io.Copy(os.Stdout, f)
	}()

	if err := c.Wait(); err != nil {
		panic(err)
	}
}
