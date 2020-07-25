## Nimclean - freeing your nim workspace from stray binaries

> DISCLAIMER: Use at your own risk. Nimclean will happily delete your nim compiler and nimble if run from a parent directory! Nimclean always recurses into subdirectories. Only tested on Linux

Don't you just hate it when you are working away on your nim project and all those binaries from compiling your modules start polluting your workspace?

You're in luck! Nimclean will wipe away all files that have an associated .nim file so that your workspace may be clean again.

## Installation
Just clone this repository and run `nimble install`.

Then type `nimclean` to clean recursively from the current directory 
or `nimclean [path/to/directory]` to target another directory.

Nimclean will ask you to confirm the directory before continuing.

Run `nimclean [path/to/directory] -y` to disable confirmation.

## Quirks
If you want to target a directory starting with `-`, such as `-minus` refer to it as `./-minus` or `/absolute/path/-minus`. I'm too lazy to come up with better parameter parsing ;)