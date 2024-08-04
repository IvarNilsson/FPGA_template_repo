BOLD=$(tput bold)
UNDERLINE=$(tput smul)
RESET_UNDERLINE=$(tput rmul)
RESET=$(tput sgr0)

UNDERLINE_1=$UNDERLINE"$1"$RESET_UNDERLINE
UNDERLINE_tb_1=$UNDERLINE"tb-$1"$RESET_UNDERLINE

echo "$BOLD Running $UNDERLINE_1 and $UNDERLINE_tb_1 $RESET"

iverilog -o $1 src/$1.v test/tb_$1.v
vvp $1
gtkwave waveform.vcd --script=test/wave/tb_$1.tcl

rm $1
rm waveform.vcd
echo "$BOLD Test Bench $1 Done! $RESET"