package main

import "os"
import "os/exec"
import "errors"

func must(err error) {
	if err != nil {
		panic(err)
	}
	return
}

func must1[T any](v T, err error) T {
	if err != nil {
		panic(err)
	}
	return v
}

func isSymlink(path string) bool {
	i, err := os.Lstat(path)
	if errors.Is(err, os.ErrNotExist) {
		return false
	}
	if err != nil {
		panic(err)
	}

	return i.Mode()&os.ModeSymlink != 0
}

func forceSymlink(src, target string) {
	must(os.Remove(target))
	must(os.Symlink(src, target))
}

func main() {
var (
homedir=must1(os.UserHomeDir())
macism=homedir + "/.local/bin/macism"
im_last="com.apple.keylayout.ABC"
im_ko="com.apple.inputmethod.Korean.2SetKorean"
// im_en="com.apple.keylayout.ABC"
data_symlink=homedir + "/.config/karabiner/last_input_source"
)

	if isSymlink(data_symlink) {
		im_last=must1(os.Readlink(data_symlink))
	}

	im_cur := string(must1(exec.Command(macism).Output()))
	im_cur = im_cur[:len(im_cur)-1]

	if im_cur == im_ko {
		must(exec.Command(macism, im_last).Run())
	} else {
		forceSymlink(im_cur, data_symlink)
		must(exec.Command(macism, im_ko).Run())
	}
}
