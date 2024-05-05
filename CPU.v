module CPU (
  input wire clk,
  input wire reset
);

  // Internal Wires
  wire [7:0] pc_address;
  wire [7:0] instruction;
  wire [7:0] ir_instruction;
  wire [7:0] decoded_instruction;
  wire [7:0] read_data1;
  wire [7:0] read_data2;
  wire [7:0] result;
  
  // Example wires for register access (modify as needed)
  wire [3:0] read_address1;
  wire [3:0] read_address2;
  wire [3:0] write_address;
  wire write_enable;

  // Instantiate Modules
  PC pc_inst (
    .clk(clk),
    .reset(reset),
    .pc_address(pc_address)
  );

  Fetch fetch_inst (
    .clk(clk),
    .reset(reset),
    .pc_address(pc_address),
    .instruction(instruction)
  );

  IR ir_inst (
    .clk(clk),
    .reset(reset),
    .instruction(instruction),
    .ir_instruction(ir_instruction)
  );

  Decode decode_inst (
    .clk(clk),
    .reset(reset),
    .ir_instruction(ir_instruction),
    .decoded_instruction(decoded_instruction)
  );
  
  Register register_inst (
    .clk(clk),
    .reset(reset),
    .read_address1(read_address1),
    .read_address2(read_address2),
    .write_address(write_address),
    .write_enable(write_enable),
    .write_data(result), // Assuming result is written back to register
    .read_data1(read_data1),
    .read_data2(read_data2)
  );

  Execute execute_inst (
    .clk(clk),
    .reset(reset),
    .decoded_instruction(decoded_instruction),
    .read_data1(read_data1),
    .read_data2(read_data2),
    .result(result)
  );

endmodule