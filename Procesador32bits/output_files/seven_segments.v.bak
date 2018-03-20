 module seven_segments (
	input wire [31:0] num,
	output reg [6:0] seven_seg
);

	always @num begin
		 case (num)
			  8'h00000000 : seven_seg <= 7'b1000000; //put 0 on display 1
			  8'h00000001 : seven_seg <= 7'b1111001; //put 1 on display 1
			  8'h00000002 : seven_seg <= 7'b0100100; //put 2 on display 1			  
			  8'h00000003 : seven_seg <= 7'b0110000; //put 3 on display 1
			  8'h00000004 : seven_seg <= 7'b0011001; //put 4 on display 1
			  8'h00000005 : seven_seg <= 7'b0010010; //put 5 on display 1
			  8'h00000006 : seven_seg <= 7'b0000010; //put 6 on display 1
			  8'h00000007 : seven_seg <= 7'b1111000; //put 7 on display 1
			  8'h00000008 : seven_seg <= 7'b0000000; //put 8 on display 1
			  8'h00000009 : seven_seg <= 7'b0011000; //put 9 on display 1
		  endcase
	end

endmodule