module Register(
    input wire clk,
    input wire reset,
    input wire [3:0] read_address1,
    input wire [3:0] read_address2,
    input wire [3:0] write_address,
    input wire write_enable,
    input wire [7:0] write_data,
    output reg [7:0] read_data1,
    output reg [7:0] read_data2
);

reg [7:0] registers[15:0]; 
// Initialize registers to 0
integer i;
always @(posedge clk or posedge reset) begin
    if (reset) begin
        for (i = 0; i < 16; i = i + 1) begin
            registers[i] <= 8'h00;
        end
    end else begin
        if (write_enable) begin
            registers[write_address] <= write_data;
        end
    end
end

// Read data from registers
always @(posedge clk or posedge reset) begin
    if (reset) begin
        read_data1 <= 8'h00;
        read_data2 <= 8'h00;
    end else begin
        read_data1 <= registers[read_address1];
        read_data2 <= registers[read_address2];
    end
end

endmodule