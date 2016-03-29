#!/bin/sh
case "$1" in
    *.md)
        pandoc -s -f markdown -t man "$1" | man -l -
        ;;
    *)
        # We don't handle this format.
        exit 1
esac

# No further processing by lesspipe necessary
exit 0

# Read markdown
# alias rdmd='sh ~/Development/Script-and-dotfiles/Tools/read-markdown.sh'
