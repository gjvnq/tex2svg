#!/usr/bin/env bash

# Get command line arguments and otehr stuff
SRC=$1
OUT=$2
BASEDIR=`pwd`

# Check arguments
if [ "$SRC" == "" ] || [ "$OUT" == "" ]; then
    echo "Usage: $0 input.tex output.svg"
    echo "       $0 inline-tex-formula output.svg"
    echo "       $0 inline-tex-formula - (output to stdout)"
    exit 1
fi

# Create temp dir
DIR=`mktemp -d`

# Put input file there
if [ -r "$SRC" ]; then
    cat "$SRC" > "$DIR/a.tex"
else
    echo "\documentclass{standalone}" >> "$DIR/a.tex"
    echo "\begin{document}" >> "$DIR/a.tex"
    echo "\$${SRC}\$" >> "$DIR/a.tex"
    echo "\end{document}" >> "$DIR/a.tex"
fi

# Process
cd $DIR
pdflatex a.tex > $DIR/pdflatex.log
pdf2svg a.pdf a.svg > $DIR/pdf2svg.log

# Output

if [ "$OUT" == "-" ]; then
    # Output to stdout
    cat a.svg
else
    cd "$BASEDIR"
    cp $DIR/a.svg "$OUT"
fi

# Come back
cd "$BASEDIR"

# Clean temp dir
rm -r $DIR