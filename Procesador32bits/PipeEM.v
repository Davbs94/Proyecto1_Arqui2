module PipeEM(
    input clk,

	 input MuxDirMemIN,
	 input MuxDatoIN,
	 input WriteMemIN,
	 input WriteRegIN,
	 
	 input [31:0] DirMemCargaIN,
	 input [31:0] DatoResultIN,
	 input [31:0] DirMemRegBIN,
	 input [4:0] DirWriteIN,
	 
	 //-------------------------
	 output MuxDirMemOUT,
	 output MuxDatoOUT,
	 output WriteMemOUT,
	 output WriteRegOUT,
	 
	 output [31:0] DirMemCargaOUT,
	 output [31:0] DatoResultOUT,
	 output [31:0] DirMemRegBOUT,
	 output [4:0] DirWriteOUT
);

	 reg MuxDirMemTMP;
	 reg MuxDatoTMP;
	 reg WriteMemTMP;
	 reg WriteRegTMP;
	 
	 reg [31:0] DirMemCargaTMP;
	 reg [31:0] DatoResultTMP;
	 reg [31:0] DirMemRegBTMP;
	 reg [4:0] DirWriteTMP;

always @(posedge clk)
begin
	 
	 MuxDirMemTMP = MuxDirMemIN;
	 MuxDatoTMP = MuxDatoIN;
	 WriteMemTMP = WriteMemIN;
	 WriteRegTMP = WriteRegIN;
	 
	 DirMemCargaTMP = DirMemCargaIN;
	 DatoResultTMP = DatoResultIN;
	 DirMemRegBTMP = DirMemRegBIN;
	 DirWriteTMP = DirWriteIN;
	
end

	 assign MuxDirMemOUT = MuxDirMemTMP;
	 assign MuxDatoOUT = MuxDatoTMP;
	 assign WriteMemOUT = WriteMemTMP;
	 assign WriteRegOUT = WriteRegTMP;
	 
	 assign DirMemCargaOUT = DirMemCargaTMP;
	 assign DatoResultOUT = DatoResultTMP;
	 assign DirMemRegBOUT = DirMemRegBTMP;
	 assign DirWriteOUT = DirWriteTMP;
	 
endmodule
