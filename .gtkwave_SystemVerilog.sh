BOLD=$(tput bold)
UNDERLINE=$(tput smul)
RESET_UNDERLINE=$(tput rmul)
RESET=$(tput sgr0)

UNDERLINE_1=$UNDERLINE"$1"$RESET_UNDERLINE
UNDERLINE_tb_1=$UNDERLINE"tb-$1"$RESET_UNDERLINE

echo "$BOLD Running $UNDERLINE_1 and $UNDERLINE_tb_1 $RESET"

verilator --cc src/$1.sv
verilator -Wall --trace -cc src/$1.sv --exe test/tb_$1.cpp
make -C obj_dir -f V$1.mk V$1
./obj_dir/V$1
gtkwave waveform.vcd --script=test/wave/tb_$1.tcl

rm waveform.vcd
echo "$BOLD Test Bench $1 Done! $RESET"
