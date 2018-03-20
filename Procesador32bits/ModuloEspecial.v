module ModuloEsp(
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
	 output reg [31:0] NumMayor
);

reg [31:0] MayorTMP0;
reg [31:0] MayorTMP1;
reg [31:0] MayorTMP2;
reg [31:0] MayorTMP3;
reg [31:0] MayorTMP4;
reg [31:0] MayorTMP5;
reg [31:0] MayorTMP6;
reg [31:0] MayorTMP7;
reg [31:0] MayorTMP8;
reg [31:0] MayorTMP9;
reg [31:0] MayorTMP10;
reg [31:0] MayorTMP11;
reg [31:0] MayorTMP12;
reg [31:0] MayorTMP13;
reg [31:0] MayorTMP14;
reg [31:0] MayorTMP15;
reg [31:0] MayorTMP16;
reg [31:0] MayorTMP17;
reg [31:0] MayorTMP18;
reg [31:0] MayorTMP19;
reg [31:0] MayorTMP20;
reg [31:0] MayorTMP21;
reg [31:0] MayorTMP22;
reg [31:0] MayorTMP23;

initial begin
MayorTMP0 <= 0;
MayorTMP1 <= 0;
MayorTMP2 <= 0;
MayorTMP3 <= 0;
MayorTMP4 <= 0;
MayorTMP5 <= 0;
MayorTMP6 <= 0;
MayorTMP7 <= 0;
MayorTMP8 <= 0;
MayorTMP9 <= 0;
MayorTMP10 <= 0;
MayorTMP11 <= 0;
MayorTMP12 <= 0;
MayorTMP13 <= 0;
MayorTMP14 <= 0;
MayorTMP15 <= 0;
MayorTMP16 <= 0;
MayorTMP17 <= 0;
MayorTMP18 <= 0;
MayorTMP19 <= 0;
MayorTMP20 <= 0;
MayorTMP21 <= 0;
MayorTMP22 <= 0;
MayorTMP23 <= 0;
end

always@(*)
begin
	if(D0IN > D1IN)
		MayorTMP0 <= D0IN;
	else
		MayorTMP0 <= D1IN;
		
	if(MayorTMP0 > D2IN)
		MayorTMP1 <= MayorTMP0;
	else
		MayorTMP1 <= D2IN;
		
	if(MayorTMP1 > D3IN)
		MayorTMP2 <= MayorTMP1;
	else
		MayorTMP2 <= D3IN;
		
	if(MayorTMP2 > D4IN)
		MayorTMP3 <= MayorTMP2;
	else
		MayorTMP3 <= D4IN;
		
	if(MayorTMP3 > D5IN)
		MayorTMP4 <= MayorTMP3;
	else
		MayorTMP4 <= D5IN;
		
	if(MayorTMP4 > D6IN)
		MayorTMP5 <= MayorTMP4;
	else
		MayorTMP5 <= D6IN;
		
	if(MayorTMP5 > D7IN)
		MayorTMP6 <= MayorTMP5;
	else
		MayorTMP6 <= D7IN;
		
	if(MayorTMP6 > D8IN)
		MayorTMP7 <= MayorTMP6;
	else
		MayorTMP7 <= D8IN;
		
	if(MayorTMP7 > D9IN)
		MayorTMP8 <= MayorTMP7;
	else
		MayorTMP8 <= D9IN;
		
	if(MayorTMP8 > D10IN)
		MayorTMP9 <= MayorTMP8;
	else
		MayorTMP9 <= D10IN;
		
	if(MayorTMP9 > D11IN)
		MayorTMP10 <= MayorTMP9;
	else
		MayorTMP10 <= D11IN;
		
	if(MayorTMP10 > D12IN)
		MayorTMP11 <= MayorTMP10;
	else
		MayorTMP11 <= D12IN;
		
	if(MayorTMP11 > D13IN)
		MayorTMP12 <= MayorTMP11;
	else
		MayorTMP12 <= D13IN;
		
	if(MayorTMP12 > D14IN)
		MayorTMP13 <= MayorTMP12;
	else
		MayorTMP13 <= D14IN;
		
	if(MayorTMP13 > D15IN)
		MayorTMP14 <= MayorTMP13;
	else
		MayorTMP14 <= D15IN;
		
	if(MayorTMP14 > D16IN)
		MayorTMP15 <= MayorTMP14;
	else
		MayorTMP15 <= D16IN;
		
	if(MayorTMP15 > D17IN)
		MayorTMP16 <= MayorTMP15;
	else
		MayorTMP16 <= D17IN;
		
	if(MayorTMP16 > D18IN)
		MayorTMP17 <= MayorTMP16;
	else
		MayorTMP17 <= D18IN;
		
	if(MayorTMP17 > D19IN)
		MayorTMP18 <= MayorTMP17;
	else
		MayorTMP18 <= D19IN;
		
	if(MayorTMP18 > D20IN)
		MayorTMP19 <= MayorTMP18;
	else
		MayorTMP19 <= D20IN;
		
	if(MayorTMP19 > D21IN)
		MayorTMP20 <= MayorTMP19;
	else
		MayorTMP20 <= D21IN;
		
	if(MayorTMP20 > D22IN)
		MayorTMP21 <= MayorTMP20;
	else
		MayorTMP21 <= D22IN;
		
	if(MayorTMP21 > D23IN)
		MayorTMP22 <= MayorTMP21;
	else
		MayorTMP22 <= D23IN;
		
	if(MayorTMP22 > D24IN)
		MayorTMP23 <= MayorTMP22;
	else
		MayorTMP23 <= D24IN;
		
	NumMayor <= MayorTMP23;
end

endmodule
