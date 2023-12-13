`timescale 1ns / 1ns
`include "../src/simple_SystemVerilog.sv"

module tb_simple_SystemVerilog;

  logic   clk;
  logic   rst;
  logic   a_in;
  logic   b_out;

  //simple_SystemVerilog uut(A, B);

  integer cycle = 0;

  initial begin
    $dumpfile("tb_simple_verilog.vcd");
    $dumpvars(0, tb_simple_verilog);
    $display("Done!");

  end

  assign #1 clk = ~clk;

  always @(posedge dut.clk_slow) begin
    cycle += 1;
  end

  always_comb begin
    case (cycle)
      1: begin
        rst = 1;
      end
      2: begin
        rst = 0;
      end
      3: begin
        rst = 0;
      end
      4: begin
        rst = 0;
      end
      5: begin
        rst = 0;
      end
      6: begin
        rst = 1;
      end
      8: begin
        $finish;
      end
    endcase
  end

endmodule



//logic rst, clk, change_state;
//logic [STATE_COUNT-1:0] state_active;


//initial begin
//	$dumpfile("signals.fst");
//	$dumpvars();
//end
