module RegisterBank(
    input clk,
    input WriteFlag,
    input [4:0] DirA,
    input [4:0] DirB,
    input [4:0] DirW,
    input [31:0] WriteData,
	 
	 output [31:0] D0,
	 output [31:0] D1,
	 output [31:0] D2,
	 output [31:0] D3,
	 output [31:0] D4,
	 output [31:0] D5,
	 output [31:0] D6,
	 output [31:0] D7,
	 output [31:0] D8,
	 output [31:0] D9,
	 output [31:0] D10,
	 output [31:0] D11,
	 output [31:0] D12,
	 output [31:0] D13,
	 output [31:0] D14,
	 output [31:0] D15,
	 output [31:0] D16,
	 output [31:0] D17,
	 output [31:0] D18,
	 output [31:0] D19,
	 output [31:0] D20,
	 output [31:0] D21,
	 output [31:0] D22,
	 output [31:0] D23,
	 output [31:0] D24,
	 
	 //------prueba
	 output [31:0] D25,
	 
    output [31:0] OutputA,
    output [31:0] OutputB
    );
	 
reg [31:0] RF [0:31];

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
RF[16] <= 0;
RF[17] <= 0;
RF[18] <= 0;
RF[19] <= 0;
RF[20] <= 0;
RF[21] <= 0;
RF[22] <= 0;
RF[23] <= 0;
RF[24] <= 0;
RF[25] <= 0;
RF[26] <= 0;
RF[27] <= 0;
RF[28] <= 0;
RF[29] <= 0;
RF[30] <= 0;
RF[31] <= 0;
end

always @(posedge clk)
begin
	
if(WriteFlag == 1'b1)
	begin
	RF[DirW] <= WriteData;
	end
end

assign D0 = RF[0];
assign D1 = RF[1];
assign D2 = RF[2];
assign D3 = RF[3];
assign D4 = RF[4];
assign D5 = RF[5];
assign D6 = RF[6];
assign D7 = RF[7];
assign D8 = RF[8];
assign D9 = RF[9];
assign D10 = RF[10];
assign D11 = RF[11];
assign D12 = RF[12];
assign D13 = RF[13];
assign D14 = RF[14];
assign D15 = RF[15];
assign D16 = RF[16];
assign D17 = RF[17];
assign D18 = RF[18];
assign D19 = RF[19];
assign D20 = RF[20];
assign D21 = RF[21];
assign D22 = RF[22];
assign D23 = RF[23];
assign D24 = RF[24];

assign D25 = RF[25];


assign OutputA = RF[DirA];
assign OutputB = RF[DirB];


endmodule
