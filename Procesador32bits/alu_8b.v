module alu_8 (
	input [7:0] A,
    input [7:0] B,
    input [3:0] CtrlFunc,
    output reg signed [7:0] Result
	 );
	 
initial begin
Result <= 0;
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
else if(CtrlFunc == 4'b0110) //not
	Result <= ~A;
else if(CtrlFunc == 4'b1000) //mult
	Result <= A*B;
else if (CtrlFunc == 4'b1001) //right shift
	Result <= A >> B;
else if (CtrlFunc == 4'b1010) //left shift
	Result <= A << B;
else if (CtrlFunc == 4'b1011) begin// circular left shift
	Result <= ((A << B) | (A >> (8 - B)));
	end
else if (CtrlFunc == 4'b1100) begin// circular right shift	
	Result <= ((A >> B) | (A << (8 - B)));	
	end
else begin
	Result <= 0;
	end
end
endmodule