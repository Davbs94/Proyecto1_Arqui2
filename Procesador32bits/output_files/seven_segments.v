 module seven_segments (
	input wire [31:0] num,
	output reg[20:0] seven_Segs
);
	
	reg [3:0] unidad,decimal,centena;
	
	always @(num) begin
		unidad <= (num%10)%10;
		decimal <= (num/10)%10;
		centena <= num/100;
		case (unidad)
			  4'b0000 : seven_Segs[6:0] <= 7'b1000000; //put 0 on display 1
			  4'b0001 : seven_Segs[6:0] <= 7'b1111001; //put 1 on display 1
			  4'b0010 : seven_Segs[6:0] <= 7'b0100100; //put 2 on display 1			  
			  4'b0011 : seven_Segs[6:0] <= 7'b0110000; //put 3 on display 1
			  4'b0100 : seven_Segs[6:0] <= 7'b0011001; //put 4 on display 1
			  4'b0101 : seven_Segs[6:0] <= 7'b0010010; //put 5 on display 1
			  4'b0110 : seven_Segs[6:0] <= 7'b0000010; //put 6 on display 1
			  4'b0111 : seven_Segs[6:0] <= 7'b1111000; //put 7 on display 1
			  4'b1000 : seven_Segs[6:0] <= 7'b0000000; //put 8 on display 1
			  4'b1001 : seven_Segs[6:0] <= 7'b0011000; //put 9 on display 1
		endcase
		case (decimal)
			  4'b0000 : seven_Segs[13:7] <= 7'b1000000; //put 0 on display 2
			  4'b0001 : seven_Segs[13:7] <= 7'b1111001; //put 1 on display 2
			  4'b0010 : seven_Segs[13:7] <= 7'b0100100; //put 2 on display 2			  
			  4'b0011 : seven_Segs[13:7] <= 7'b0110000; //put 3 on display 2
			  4'b0100 : seven_Segs[13:7] <= 7'b0011001; //put 4 on display 2
			  4'b0101 : seven_Segs[13:7] <= 7'b0010010; //put 5 on display 2
			  4'b0110 : seven_Segs[13:7] <= 7'b0000010; //put 6 on display 2
			  4'b0111 : seven_Segs[13:7] <= 7'b1111000; //put 7 on display 2
			  4'b1000 : seven_Segs[13:7] <= 7'b0000000; //put 8 on display 2
			  4'b1001 : seven_Segs[13:7] <= 7'b0011000; //put 9 on display 2
		  endcase
		  case (centena)
			  4'b0000 : seven_Segs[20:14] <= 7'b1000000; //put 0 on display 3
			  4'b0001 : seven_Segs[20:14] <= 7'b1111001; //put 1 on display 3
			  4'b0010 : seven_Segs[20:14] <= 7'b0100100; //put 2 on display 3			  
			  4'b0011 : seven_Segs[20:14] <= 7'b0110000; //put 3 on display 3
			  4'b0100 : seven_Segs[20:14] <= 7'b0011001; //put 4 on display 3
			  4'b0101 : seven_Segs[20:14] <= 7'b0010010; //put 5 on display 3
			  4'b0110 : seven_Segs[20:14] <= 7'b0000010; //put 6 on display 3
			  4'b0111 : seven_Segs[20:14] <= 7'b1111000; //put 7 on display 3
			  4'b1000 : seven_Segs[20:14] <= 7'b0000000; //put 8 on display 3
			  4'b1001 : seven_Segs[20:14] <= 7'b0011000; //put 9 on display 3
		  endcase
	end/*
	always@(num) begin
		case(num)
			8'b01001100: seven_Segs <= 21'b100000010000001000111;
			8'b01101111: seven_Segs <= 21'b100000010000001000000;
			8'b01100101: seven_Segs <= 21'b100000010000001000110;
		endcase
	
	end*/
	
endmodule