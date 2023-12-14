`timescale 1ns / 1ns
//`include "../src/tb_simple_verilog.v"

module tb_simple_verilog;

  logic clk;
  logic rst;
  logic a_in;
  logic b_out;

  //simple_SystemVerilog uut(A, B);
  simple_verilog uut (
      sys_clk,
      rst,
      a_in,
      b_in,
      c_out,
      counter_done
  );

  integer cycle = 0;

  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb_simple_verilog);
    $display("Done!");

    a_in = 0;
    #10;  // delay 10
    a_in = 1;
    #10;
    a_in = 0;
    #10;
    a_in = 1;
    #10;
    $finish();
  end


endmodule



//logic rst, clk, change_state;
//logic [STATE_COUNT-1:0] state_active;


//initial begin
//	$dumpfile("signals.fst");
//	$dumpvars();
//end
