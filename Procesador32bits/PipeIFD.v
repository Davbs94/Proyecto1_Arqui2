module PipeIFD(
    input clk,
    input [31:0] InstructionIN,
	 output reg[4:0] OpCodeOUT,
	 output reg[15:0] DireccionOUT,
	 output reg[4:0] DirRegAOUT,
	 output reg[4:0] DirRegBOUT,
	 output reg[31:0] InmCorrimOUT,
	 output reg[4:0] DirWriteOUT
);

	 reg [4:0] OpCodeTMP;
	 reg [15:0] DireccionTMP;
	 reg [4:0] DirRegATMP;
	 reg [4:0] DirRegBTMP;
	 reg [31:0] InmCorrimTMP;
	 reg [4:0] DirWriteTMP;

always @(posedge clk)
begin
	OpCodeOUT <= InstructionIN[31:27];
	DireccionOUT <= InstructionIN[15:0];
	DirRegAOUT <= InstructionIN[21:17];
	DirRegBOUT <= InstructionIN[16:12];
	InmCorrimOUT <= {{16{1'b0}}, InstructionIN[15:0]};
	DirWriteOUT <= InstructionIN[26:22];
	
end
/*
	 assign OpCodeOUT = OpCodeTMP;
	 assign DireccionOUT = DireccionTMP;
	 assign DirRegAOUT = DirRegATMP;
	 assign DirRegBOUT = DirRegBTMP;
	 assign InmCorrimOUT = InmCorrimTMP;
	 assign DirWriteOUT = DirWriteTMP;
	 */
endmodule
