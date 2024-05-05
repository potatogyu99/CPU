module Decode (
    input wire clk,
    input wire reset,
    input wire [7:0] ir_instruction,
    output reg [7:0] decoded_instruction
);

// Decode operation
always @(posedge clk or posedge reset) begin
    if (reset) begin
        decoded_instruction <= 8'h00;
    end else begin
        decoded_instruction <= ir_instruction;
    end
end

endmodule
