`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:35:31 05/02/2017 
// Design Name: 
// Module Name:    clock_divider 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clock_divider(input wire clk_in, output wire clk_out);



	//-- Valor por defecto del divisor
	//-- Lo ponemos a 25MHz
	parameter M = 4;
	
	//-- Numero de bits para almacenar el divisor
	//-- Se calculan con la funcion de verilog $clog2, que nos devuelve el 
	//-- numero de bits necesarios para representar el numero M
	//-- Es un parametro local, que no se puede modificar al instanciar
	parameter N = $clog2(M);
		
	//-- Registro para implementar el contador modulo M
	reg [N-1:0] divcounter = 0;
		
	//-- Contador módulo M
	always @(posedge clk_in)
	  divcounter <= (divcounter == M - 1) ? 0 : divcounter + 1;
		
	//-- Sacar el bit mas significativo por clk_out
	assign clk_out = divcounter[N-1];

endmodule
