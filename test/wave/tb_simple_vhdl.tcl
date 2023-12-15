#python ../run.py --gtkwave-fmt vcd --gui lib.tb_collector.gtkw

set nfacts [gtkwave::getNumFacs]
puts "$nfacts"

# Function to add a signal and handle errors if it doesn't exist
proc addSignal {signal} {
	set result [catch {gtkwave::addSignalsFromList "$signal"} error_message]
	if {$result != 0} {
		puts "Error adding signal $signal: $error_message"
	}
}

# List of signals to add
set signals {
	tb_simple_vhdl.clk_100 -
	tb_simple_vhdl.rst -
	tb_simple_vhdl.simple_vhdl.a -
	tb_simple_vhdl.simple_vhdl.b -
	tb_simple_vhdl.simple_vhdl.c -
	tb_simple_vhdl.simple_vhdl.counter_done -
}

# Iterate through the list of signals and add them
foreach signal $signals {
	addSignal $signal
}

# zoom full
gtkwave::/Time/Zoom/Zoom_Full


