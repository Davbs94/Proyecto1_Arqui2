`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:25:35 11/21/2016 
// Design Name: 
// Module Name:    Shifter2 
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
module Shifter2(
	input [23:0]Inm24,
	output [31:0]InmShifter
   );
	
	assign InmShifter = Inm24[23] ? {{6{1'b1}}, Inm24, {2{1'b0}}} : {{6{1'b0}}, Inm24, {2{1'b0}}};

endmodule
