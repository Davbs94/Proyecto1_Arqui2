module vect_unit (
	input [31:0] operA, operB,
	input [3:0] CtrlFunc,
	output wire [31:0] result,
	output wire [1:0] flags
	);

alu_8 alu_8b1 (operA[31:24],operB[31:24], CtrlFunc, result[31:24]);
alu_8 alu_8b2 (operA[23:16],operB[23:16], CtrlFunc, result[23:16]);
alu_8 alu_8b3 (operA[15:8],operB[15:8], CtrlFunc, result[15:8]);
alu_8 alu_8b4 (operA[7:0],operB[7:0], CtrlFunc, result[7:0]);
endmodule
