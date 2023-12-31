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
    TOP.simple_verilog.sys_clk -
    TOP.simple_verilog.rst -
    TOP.simple_verilog.counter_done -

    tb_simple_verilog.uut.sys_clk -
    tb_simple_verilog.uut.rst -
    tb_simple_verilog.uut.counter_done -

}

# Iterate through the list of signals and add them
foreach signal $signals {
    addSignal $signal
}

# zoom full
gtkwave::/Time/Zoom/Zoom_Full
