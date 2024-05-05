module IR(
    input wire clk,
    input wire reset,
    input wire [7:0] instruction,
    output reg [7:0] ir_instruction
);

// Load instruction into IR
always @(posedge clk or posedge reset) begin
    if (reset) begin
        ir_instruction <= 8'h00;
    end else begin
        ir_instruction <= instruction;
    end
end

endmodule