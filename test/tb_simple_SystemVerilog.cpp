#include "Vsimple_SystemVerilog.h"
#include <iostream>
#include <stdlib.h>
#include <verilated.h>
#include <verilated_vcd_c.h>
// #include "Vsimple_SystemVerilog___024unit.h"

#define MAX_SIM_TIME 2000
vluint64_t sim_time = 0;

int main(int argc, char **argv, char **env) {
	Vsimple_SystemVerilog *dut = new Vsimple_SystemVerilog;

	Verilated::traceEverOn(true);
	VerilatedVcdC *m_trace = new VerilatedVcdC;
	dut->trace(m_trace, 5);
	m_trace->open("waveform.vcd");

	while (sim_time < MAX_SIM_TIME) {
		dut->sys_clk ^= 1;
		if (sim_time < 2) {
			dut->rst = 1;
		} else {
			dut->rst = 0;
		}

		if (sim_time == 4) {
			dut->a_in = 1;
		} else if (sim_time == 10) {
			dut->a_in = 1;
		} else {
			dut->a_in = 0;
		}

		dut->eval();
		m_trace->dump(sim_time);
		sim_time++;
	}

	m_trace->close();
	delete dut;
	exit(EXIT_SUCCESS);
}
