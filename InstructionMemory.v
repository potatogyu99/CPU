module InstructionMemory (
    input wire clk,
    input wire reset,
    input wire [7:0] address,
    output reg [7:0] instruction
);

// Always block to read instruction from memory
always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Reset instruction memory
        instruction <= 8'h00; // Reset instruction to 0
    end else begin
        // Simulate reading instruction from memory based on address
        // In real implementation, this would read from actual memory
        case(address)
            8'h00: instruction <= 8'h01; // Example: Load instruction 01 for address 00
            // Add more cases for other addresses as needed
            default: instruction <= 8'h00; // Default case
        endcase
    end
end

endmodule
