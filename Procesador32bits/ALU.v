module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] CtrlFunc,
    output reg signed [31:0] Result,
    output reg [1:0] Flags
	 );


initial begin
Result <= 0;
Flags <= 0;
end

always@(*)
begin

if(CtrlFunc == 4'b0000) //AND
	Result <= A & B;
	
else if(CtrlFunc == 4'b0001) //OR
	Result <= A | B;

else if(CtrlFunc == 4'b0010) //XOR
	Result <= A ^ B;
	
else if(CtrlFunc == 4'b0011)//Suma
	Result <= A + B;
	
else if(CtrlFunc == 4'b0100) //Resta
	Result <= A - B;

else if(CtrlFunc == 4'b0101) //CMP
	begin
		Result <= A - B;
		if(Result == 32'd0)
			Flags <= 2'b01;

		else if(Result < 0)
			Flags <= 2'b10;
			
		else if(Result > 0)
			Flags <= 2'b00;
	end
else if(CtrlFunc == 4'b0110) //not
	Result <= ~A;
else if(CtrlFunc == 4'b0111) //shifter
	Result <= {A[15:0], {16{1'b0}}};
else if(CtrlFunc == 4'b1000) //mult
	Result <= A*B;
else
	Result <= 0;
end
endmodule
