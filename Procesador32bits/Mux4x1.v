module Mux4x1(
    input [31:0] A,
    input [31:0] B,
	 input [31:0] C,
	 input [31:0] D,
    input [1:0]ctrl,
    output reg [31:0] O
    );

initial begin
O <= 0;
end

always @(*)
begin

if(ctrl == 2'b00)
	O <= A;	
else if(ctrl == 2'b01)
	O <= B;
else if(ctrl == 2'b10)
	O <= C;
else
	O <= D;

end

endmodule
