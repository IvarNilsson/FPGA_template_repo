module simple_verilog (
    input sys_clk,
    input rst,
    input a_in,
    input b_in,
    output reg c_out,
    output reg counter_done
);

  parameter counter_width = 8;

  reg [counter_width-1:0] current_counter;
  reg [counter_width-1:0] next_counter;

  // Register all inputs
  always @(posedge sys_clk or posedge rst) begin
    if (rst) begin
      current_counter <= 0;
    end else begin
      current_counter <= next_counter;
    end
  end

  // Compute the result
  always @* begin
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
