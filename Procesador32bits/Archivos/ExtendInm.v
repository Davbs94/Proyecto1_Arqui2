`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:07:43 11/21/2016 
// Design Name: 
// Module Name:    ExtendInm 
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
module ExtendInm(
	input [7:0]InputInm,
	input [3:0]Rotate,
	output [31:0]OutputInm
   );
	
	reg [31:0]Inm32;
	reg [4:0]RotateTemp;
	
	always @(*)
		begin
			Inm32 = {{24{1'b0}}, InputInm};
			
			RotateTemp = Rotate<<1;
		end
		
		assign OutputInm = (Inm32>>RotateTemp) | (Inm32<<(32-RotateTemp));

endmodule
