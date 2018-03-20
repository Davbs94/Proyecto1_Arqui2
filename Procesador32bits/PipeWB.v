module PipeWB(
    input clk,

	 input WriteRegIN,
	 
	 input [31:0] DatoWBIN,
	 input [4:0] DirWriteIN,
	 
	 //-------------------------
	 output WriteRegOUT,
	 
	 output [31:0] DatoWBOUT,
	 output [4:0] DirWriteOUT
);

	 reg WriteRegTMP;
	 
	 reg [31:0] DatoWBTMP;
	 reg [4:0] DirWriteTMP;

always @(posedge clk)
begin
	 
	 WriteRegTMP = WriteRegIN;
	 
	 DatoWBTMP = DatoWBIN;
	 DirWriteTMP = DirWriteIN;
end

	 assign WriteRegOUT = WriteRegTMP;
	 
	 assign DatoWBOUT = DatoWBTMP;
	 assign DirWriteOUT = DirWriteTMP;
	 
endmodule
