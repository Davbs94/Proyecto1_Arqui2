`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:37:31 11/21/2016 
// Design Name: 
// Module Name:    Mux2x1 
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
module Mux2x1(
    input [31:0] A,
    input [31:0] B,
    input ctrl,
    output reg [31:0] C
    );

initial begin
C <= 0;
end

always @(*)
begin

if(~ctrl)
	C <= A;
	
else
	C <= B;

end

endmodule
