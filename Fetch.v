module Fetch(
    input wire clk,
    input wire reset,
    input wire [7:0] pc_address,
    output wire [7:0] instruction
);

// Instantiate InstructionMemory module
InstructionMemory instruction_memory_inst(
    .clk(clk),
    .reset(reset),
    .address(pc_address),
    .instruction(instruction)
);

endmodule
