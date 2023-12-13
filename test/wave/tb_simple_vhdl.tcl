#python ../run.py --gtkwave-fmt vcd --gui lib.tb_collector.gtkw

set nfacts [ gtkwave::getNumFacs ]
puts "$nfacts"


for {set i 0} {$i < $nfacts} {incr i} {
	set name [gtkwave::getFacName $i]
	puts "$name"

	switch -glob -- $name {

		tb_simple_vhdl.clk_100 -
		tb_simple_vhdl.rst -
		tb_simple_vhdl.simple_vhdl.a -
		tb_simple_vhdl.simple_vhdl.b -
		tb_simple_vhdl.simple_vhdl.c -
		tb_simple_vhdl.simple_vhdl.counter_done -


		tb_tb.a* {
			gtkwave::addSignalsFromList "$name"
		}
	}
}

# zoom full
gtkwave::/Time/Zoom/Zoom_Full
