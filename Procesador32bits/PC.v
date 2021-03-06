module PC(
    input clk,
    input [31:0] PCin,
    output reg [31:0] PCout
    );

initial begin
PCout <= 0;
end

always @(posedge clk)
begin
	PCout <= PCin;
end

endmodule
