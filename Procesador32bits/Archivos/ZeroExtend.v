`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:57:43 11/21/2016 
// Design Name: 
// Module Name:    ZeroExtend 
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
module ZeroExtend(
	in,
	out
	);
	
input [11:0] in;
output [31:0] out;

assign out = {{20{1'b0}}, in};


endmodule
