module PipeDE(
    input clk,
	 input [4:0] OpCodeIDEXIN,
	 input [31:0] InmCorrimIFDIN,
    //input ModEspIN,
	 input [3:0] CodigoALUIN,
	 input [1:0] MuxResultIN,
	 input MuxDirWriteIN,
	 input MuxDirMemIN,
	 input MuxDatoIN,
	 input WriteMemIN,
	 input WriteRegIN,
	 
	 input [31:0] D0IN,
	 input [31:0] D1IN,
	 input [31:0] D2IN,
	 input [31:0] D3IN,
	 input [31:0] D4IN,
	 input [31:0] D5IN,
	 input [31:0] D6IN,
	 input [31:0] D7IN,
	 input [31:0] D8IN,
	 input [31:0] D9IN,
	 input [31:0] D10IN,
	 input [31:0] D11IN,
	 input [31:0] D12IN,
	 input [31:0] D13IN,
	 input [31:0] D14IN,
	 input [31:0] D15IN,
	 input [31:0] D16IN,
	 input [31:0] D17IN,
	 input [31:0] D18IN,
	 input [31:0] D19IN,
	 input [31:0] D20IN,
	 input [31:0] D21IN,
	 input [31:0] D22IN,
	 input [31:0] D23IN,
	 input [31:0] D24IN,
	 
	 input [31:0] ValAIN,
	 input [31:0] ValBIN,
	 input [4:0] DirWriteIN,
	 
	 //-------------------------
	 //output ModEspOUT,
	 output [3:0] CodigoALUOUT,
	 output [1:0] MuxResultOUT,
	 output MuxDirWriteOUT,
	 output MuxDirMemOUT,
	 output MuxDatoOUT,
	 output WriteMemOUT,
	 output WriteRegOUT,
	 
	 output [31:0] D0OUT,
	 output [31:0] D1OUT,
	 output [31:0] D2OUT,
	 output [31:0] D3OUT,
	 output [31:0] D4OUT,
	 output [31:0] D5OUT,
	 output [31:0] D6OUT,
	 output [31:0] D7OUT,
	 output [31:0] D8OUT,
	 output [31:0] D9OUT,
	 output [31:0] D10OUT,
	 output [31:0] D11OUT,
	 output [31:0] D12OUT,
	 output [31:0] D13OUT,
	 output [31:0] D14OUT,
	 output [31:0] D15OUT,
	 output [31:0] D16OUT,
	 output [31:0] D17OUT,
	 output [31:0] D18OUT,
	 output [31:0] D19OUT,
	 output [31:0] D20OUT,
	 output [31:0] D21OUT,
	 output [31:0] D22OUT,
	 output [31:0] D23OUT,
	 output [31:0] D24OUT,
	 
	 output [31:0] ValAOUT,
	 output [31:0] ValBOUT,
	 output [4:0] DirWriteOUT,
	 output [4:0] OpCodeIDEXOUT,
	 output [31:0] InmCorrimIFDOUT
);

	 //reg ModEspTMP;
	 reg [3:0] CodigoALUTMP;
	 reg [1:0] MuxResultTMP;
	 reg MuxDirWriteTMP;
	 reg MuxDirMemTMP;
	 reg MuxDatoTMP;
	 reg WriteMemTMP;
	 reg WriteRegTMP;
	 
	 reg [31:0] D0TMP;
	 reg [31:0] D1TMP;
	 reg [31:0] D2TMP;
	 reg [31:0] D3TMP;
	 reg [31:0] D4TMP;
	 reg [31:0] D5TMP;
	 reg [31:0] D6TMP;
	 reg [31:0] D7TMP;
	 reg [31:0] D8TMP;
	 reg [31:0] D9TMP;
	 reg [31:0] D10TMP;
	 reg [31:0] D11TMP;
	 reg [31:0] D12TMP;
	 reg [31:0] D13TMP;
	 reg [31:0] D14TMP;
	 reg [31:0] D15TMP;
	 reg [31:0] D16TMP;
	 reg [31:0] D17TMP;
	 reg [31:0] D18TMP;
	 reg [31:0] D19TMP;
	 reg [31:0] D20TMP;
	 reg [31:0] D21TMP;
	 reg [31:0] D22TMP;
	 reg [31:0] D23TMP;
	 reg [31:0] D24TMP;
	 
	 reg [31:0] ValATMP;
	 reg [31:0] ValBTMP;
	 reg [4:0] DirWriteTMP;
	 reg [4:0] OpCodeIDEXOUTTMP;
	 reg [31:0] InmCorrimIFDOUTTEMP;

always @(posedge clk)
begin
	 //ModEspTMP = ModEspIN;
	 CodigoALUTMP = CodigoALUIN;
	 MuxResultTMP = MuxResultIN;
	 MuxDirWriteTMP = MuxDirWriteIN;
	 MuxDirMemTMP = MuxDirMemIN;
	 MuxDatoTMP = MuxDatoIN;
	 WriteMemTMP = WriteMemIN;
	 WriteRegTMP = WriteRegIN;
	 
	 D0TMP = D0IN;
	 D1TMP = D1IN;
	 D2TMP = D2IN;
	 D3TMP = D3IN;
	 D4TMP = D4IN;
	 D5TMP = D5IN;
	 D6TMP = D6IN;
	 D7TMP = D7IN;
	 D8TMP = D8IN;
	 D9TMP = D9IN;
	 D10TMP = D10IN;
	 D11TMP = D11IN;
	 D12TMP = D12IN;
	 D13TMP = D13IN;
	 D14TMP = D14IN;
	 D15TMP = D15IN;
	 D16TMP = D16IN;
	 D17TMP = D17IN;
	 D18TMP = D18IN;
	 D19TMP = D19IN;
	 D20TMP = D20IN;
	 D21TMP = D21IN;
	 D22TMP = D22IN;
	 D23TMP = D23IN;
	 D24TMP = D24IN;
	 
	 ValATMP = ValAIN;
	 ValBTMP = ValBIN;
	 DirWriteTMP = DirWriteIN;
	 
	 OpCodeIDEXOUTTMP = OpCodeIDEXIN;
	 
	 InmCorrimIFDOUTTEMP = InmCorrimIFDIN;
end

	 //assign ModEspOUT = ModEspTMP;
	 assign CodigoALUOUT = CodigoALUTMP;
	 assign MuxResultOUT = MuxResultTMP;
	 assign MuxDirWriteOUT = MuxDirWriteTMP;
	 assign MuxDirMemOUT = MuxDirMemTMP;
	 assign MuxDatoOUT = MuxDatoTMP;
	 assign WriteMemOUT = WriteMemTMP;
	 assign WriteRegOUT = WriteRegTMP;
	 
	 assign D0OUT = D0TMP;
	 assign D1OUT = D1TMP;
	 assign D2OUT = D2TMP;
	 assign D3OUT = D3TMP;
	 assign D4OUT = D4TMP;
	 assign D5OUT = D5TMP;
	 assign D6OUT = D6TMP;
	 assign D7OUT = D7TMP;
	 assign D8OUT = D8TMP;
	 assign D9OUT = D9TMP;
	 assign D10OUT = D10TMP;
	 assign D11OUT = D11TMP;
	 assign D12OUT = D12TMP;
	 assign D13OUT = D13TMP;
	 assign D14OUT = D14TMP;
	 assign D15OUT = D15TMP;
	 assign D16OUT = D16TMP;
	 assign D17OUT = D17TMP;
	 assign D18OUT = D18TMP;
	 assign D19OUT = D19TMP;
	 assign D20OUT = D20TMP;
	 assign D21OUT = D21TMP;
	 assign D22OUT = D22TMP;
	 assign D23OUT = D23TMP;
	 assign D24OUT = D24TMP;
	 
	 assign ValAOUT = ValATMP;
	 assign ValBOUT = ValBTMP;
	 assign DirWriteOUT = DirWriteTMP;
	 assign OpCodeIDEXOUT = OpCodeIDEXOUTTMP;
	 assign InmCorrimIFDOUT = InmCorrimIFDOUTTEMP;
	 
endmodule
