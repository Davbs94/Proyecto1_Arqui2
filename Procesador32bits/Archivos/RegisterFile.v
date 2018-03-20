`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:02:33 11/21/2016 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(
    input clk,
    input WriteFlag,
    input [3:0] DirA,
    input [3:0] DirB,
    input [3:0] DirW,
	 input [31:0] PC,
    input [31:0] WriteData,
    output [31:0] OutputA,
    output [31:0] OutputB
    );
	 
reg [31:0] RF [0:15];

initial begin
RF[0] <= 0; 
RF[1] <= 0;
RF[2] <= 0;
RF[3] <= 0;
RF[4] <= 0;
RF[5] <= 0;
RF[6] <= 0;
RF[7] <= 0;
RF[8] <= 0;
RF[9] <= 0;
RF[10] <= 0;
RF[11] <= 0;
RF[12] <= 0;
RF[13] <= 0;
RF[14] <= 0;
RF[15] <= 0;
end

always @(negedge clk)
begin
RF[15] <= PC + 4'd4;	
	
if(WriteFlag == 1'b1)
	begin
	RF[DirW] <= WriteData;
	end
end

assign OutputA = RF[DirA];
assign OutputB = RF[DirB];


endmodule
