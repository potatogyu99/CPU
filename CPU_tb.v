module cpu_tb;

  // Inputs
  reg clk;
  reg reset;

  // Outputs
  wire [7:0] pc_address;
  wire [7:0] instruction;
  wire [7:0] ir_instruction;
  wire [7:0] decoded_instruction;
  wire [7:0] read_data1;
  wire [7:0] read_data2;
  wire [7:0] result;

  // Internal Wires for Register Access
  wire [3:0] read_address1;
  wire [3:0] read_address2;
  wire [3:0] write_address;
  wire write_enable;

  // Instantiate the Unit Under Test (UUT)
  CPU cpu_inst (
    .clk(clk),
    .reset(reset),
    // Outputs
    .pc_address(pc_address),
    .instruction(instruction),
    .ir_instruction(ir_instruction),
    .decoded_instruction(decoded_instruction),
    .read_data1(read_data1),
    .read_data2(read_data2),
    .result(result),
    // Internal Wires for Register Access
    .read_address1(read_address1),
    .read_address2(read_address2),
    .write_address(write_address),
    .write_enable(write_enable)
  );

  // Clock generation
  always begin
    clk = 1'b0;
    #5;
    clk = 1'b1;
    #5;
  end

  // Reset generation
  initial begin
    reset = 1'b1;
    #10;
    reset = 1'b0;
  end

  // Add your test cases here
  // For example, you can monitor values of pc_address, instruction, etc.
  // and compare them with expected values. You can also use assertions
  // to verify the functionality of the CPU.

  // Example: Monitor PC address
  initial begin
    $monitor("PC Address: %h", pc_address);
  end

endmodule