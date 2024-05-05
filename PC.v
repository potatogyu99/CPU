module PC(
    input wire clk,
    input wire reset,
    output reg [7:0] pc_address
);

// Initialize PC to 0
always @(posedge clk or posedge reset) begin
    if (reset) begin
        pc_address <= 8'h00;
    end else begin
        pc_address <= pc_address + 1;
    end
end

endmodule

