module Tester(
    input clk,
    output wire [20:0] led_Reg
    );

	
	 wire [31:0] Reg0;
	 wire [31:0] Reg1;
	 wire [31:0] Reg2;
	 wire [31:0] Reg3;
	 wire [31:0] Reg4;
	 wire [31:0] Reg5;
	 wire [31:0] Reg6;
	 wire [31:0] Reg7;
	 wire [31:0] Reg8;
	 wire [31:0] Reg9; 
	 wire [31:0] Reg10;
	 wire [31:0] Reg11;
	 wire [31:0] Reg12;
	 wire [31:0] Reg13;
	 wire [31:0] Reg14;
	 wire [31:0] Reg15;
	 wire [31:0] Reg16;
	 wire [31:0] Reg17;
	 wire [31:0] Reg18;
	 wire [31:0] Reg19; 
	 wire [31:0] Reg20;
	 wire [31:0] Reg21;
	 wire [31:0] Reg22;
	 wire [31:0] Reg23;
	 wire [31:0] Reg24;
	 wire [31:0] Reg25;
	
	 

parameter N = 500;
//-- Señal de reloj de 100Hz. Salida del divisor
wire clk_xHZ;
//-- Instanciar el divisor
clock_divider #(N)
  DIV1 (
	.clk_in(clk),
	.clk_out(clk_xHZ)
);

CPU cpu(clk_xHZ, Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7, Reg8, Reg9,
Reg10, Reg11, Reg12, Reg13, Reg14, Reg15, Reg16, Reg17, Reg18, Reg19,
Reg20, Reg21, Reg22, Reg23, Reg24, Reg25);
	
seven_segments sevenSegs1 ( .num(Reg5), //input 
									.seven_Segs(led_Reg) //output
);
						
endmodule
