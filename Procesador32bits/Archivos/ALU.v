`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:47:21 11/21/2016 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(
	 input clk,
	 input S,
    input [31:0] A,
    input [31:0] B,
    input [2:0] CtrlFunc,
    output reg signed [31:0] Result,
    output reg [3:0] Flags
	 );

reg [31:0]CMPtemp;

initial begin
Result <= 0;
Flags <= 0;
end

always@(posedge clk)
begin

if(CtrlFunc == 3'b000) //AND
	Result <= A & B;
	
else if(CtrlFunc == 3'b101) //OR
	Result <= A | B;
	
else if(CtrlFunc == 3'b011)//ADD
	Result <= A + B;

else if(CtrlFunc == 3'b001) //XOR
	Result <= A ^ B;
	
else if(CtrlFunc == 3'b010) //SUB
	Result <= A - B;

else if(CtrlFunc == 3'b110) //MUL
	Result <= A * B;

else if(CtrlFunc == 3'b100) //CMP
	begin
		CMPtemp <= A - B;
		if(CMPtemp == 32'd0)
			begin
				Result <= A;
			end
		else
			begin
				Result <= A - B;
			end
	end
end

always @(negedge clk)     //para simular	(Result), para placa (negedge clk)			     //flags  [N,Z,C,V]
begin
	if(S == 1)
		begin
			if(Result == 32'd0)
				Flags <= 4'b0100;

			else if(Result < 0)
				Flags <= 4'b1000;
				
			else if(Result > 0)
				Flags <= 4'b0000;
		end
end

endmodule
