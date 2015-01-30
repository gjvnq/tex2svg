# tex2svg

Tex2svg is a simple shell script that converts a LaTeX formula into a SVG file.

## Usage

`./tex2svg.sh input.tex output.svg` converts the `input.tex` LaTeX file into `output.svg` SVG file.
`./tex2svg.sh inline-formula output.svg` converts the `inline-formula` into `output.svg` SVG file.
`./tex2svg.sh inline-formula -` converts the `inline-formula` into SVG and prints to the stdout.

### Examples

  * `./tex2svg.sh my-crazy-formulas.tex my-crazy-formulas.svg`
  * `./tex2svg.sh my-crazy-formulas.tex -`
  * `./tex2svg.sh "a^2 = b^2+c^2" pythagorean-theorem.svg`

## Dependencies

  * Bash (you probably already have it)
  * pdflatex
  * pdf2svg

## Installation

Just download and run the script. If you want, you can copy it to `/usr/bin` so you can use it like any other command.

## License

Tex2svg is licensed under the MIT License.
