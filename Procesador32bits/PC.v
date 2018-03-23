/**
 * @brief modulo PC
 * @details Modulo que representa el registro de PC, es dependiente del ciclo de clk
 * 
 * @param PCin pc que se desea poner
 * @param clk clock del micro
 * @param PCout PC 
 * 
 * @return PCout
 */
module PC(
    input clk,
    input [31:0] PCin,
    output reg [31:0] PCout
    );

initial begin
	PCout <= 0;
end

always @(posedge clk)
begin
	PCout <= PCin;
end

endmodule
