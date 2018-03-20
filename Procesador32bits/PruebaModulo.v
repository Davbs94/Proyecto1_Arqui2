module PruebaModulo (
	input wire clk,
	input wire [31:0] dataA, dataB,
	output wire [1:0] aluFlags,
	output wire [31:0] result, dataOut

);

reg [3:0] aluCod;

initial begin
	aluCod = 4'b0011;
end

ALU alu(dataA, dataB,aluCod, result, aluFlags);
RomDatos (result, clk, dataOut);

endmodule