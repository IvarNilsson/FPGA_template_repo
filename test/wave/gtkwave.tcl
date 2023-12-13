#python ../run.py --gtkwave-fmt vcd --gui lib.tb_collector.gtkw

set nfacts [ gtkwave::getNumFacs ]
puts "$nfacts"

# TOP.simple_SystemVerilog.sys_clk -

for {set i 0} {$i < $nfacts} {incr i} {
	set name [gtkwave::getFacName $i]
	puts "$name"

	switch -glob -- $name {

		tb_tb.a* {
			gtkwave::addSignalsFromList "$name"
		}
	}
}

# zoom full
gtkwave::/Time/Zoom/Zoom_Full
