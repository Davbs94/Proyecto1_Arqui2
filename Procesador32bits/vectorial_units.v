module vect_unit (
	input [31:0] operA, operB,
	input [7:0] Inm,
	input aluMux,
	input [3:0] CtrlFunc,
	output wire [31:0] result,
	output wire [1:0] flags
	);

wire [7:0] operB1, operB2, operB3, operB4;
Mux2x1 muxAlu1(operB[31:24],Inm,aluMux,operB1);	
Mux2x1 muxAlu2(operB[23:16],Inm,aluMux,operB2);	
Mux2x1 muxAlu3(operB[15:8],Inm,aluMux,operB3);	
Mux2x1 muxAlu4(operB[7:0],Inm,aluMux,operB4);	
	
alu_8 alu_8b1 (operA[31:24],operB1, CtrlFunc, result[31:24]);
alu_8 alu_8b2 (operA[23:16],operB2, CtrlFunc, result[23:16]);
alu_8 alu_8b3 (operA[15:8],operB3, CtrlFunc, result[15:8]);
alu_8 alu_8b4 (operA[7:0],operB4, CtrlFunc, result[7:0]);
endmodule
