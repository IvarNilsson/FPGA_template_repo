module simple_SystemVerilog #(
    parameter counter_width = 8

) (
    input sys_clk,
    input rst,
    input a_in,
    input b_in,
    output logic c_out,
    output logic counter_done
);

  logic [counter_width-1:0] current_counter;
  logic [counter_width-1:0] next_counter;

  // Register all inputs
  always_ff @(posedge sys_clk, posedge rst) begin
    if (rst) begin
      current_counter <= 0;
    end else begin
      current_counter <= next_counter;
    end
  end

  // Compute the result
  always_comb begin
    c_out = a_in & b_in;

    if (current_counter == counter_width) begin
      next_counter = 0;
      counter_done = 1;
    end else begin
      next_counter = current_counter + 1;
      counter_done = 0;
    end
  end


endmodule
;
