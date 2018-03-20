module ControlUnit(
    input [4:0] Opcode,OpCodeIDEXOUT,
	 input [1:0] Flags,
	 
	 output reg[1:0] MuxDireccionPC,
	 output reg MuxSelDirRegB,
	 output reg crtlMuxValA,
	 output reg crtlMuxValB,
	 output reg [3:0] CodigoALUIN,
	 output reg [1:0] MuxResultIN,
	 output reg MuxDirWriteIN,
	 output reg MuxDirMemIN,
	 output reg MuxDatoIN,
	 output reg WriteMemIN,
	 output reg WriteRegIN
    );

initial begin
	 MuxDireccionPC <= 0;
	 MuxSelDirRegB <= 0;
	 crtlMuxValA <= 0;
	 crtlMuxValB <= 0;
	 CodigoALUIN <= 4'b0000;
	 MuxResultIN <= 2'b00;
	 MuxDirWriteIN <= 0;
	 MuxDirMemIN <= 1;
	 MuxDatoIN <= 0;
	 WriteMemIN <= 0;
	 WriteRegIN <= 0;
end

always @(*)
begin
	//suma registro
	if(Opcode == 5'b00000)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 4'b0011;
		 MuxResultIN <= 2'b10;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 1;
		 MuxDatoIN <= 1;
		 WriteMemIN <= 0;
		 WriteRegIN <= 1;
	end
	//suma inmediato
	else if(Opcode == 5'b00001)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 1;
		 CodigoALUIN <= 4'b0011;
		 MuxResultIN <= 2'b10;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 1;
		 MuxDatoIN <= 1;
		 WriteMemIN <= 0;
		 WriteRegIN <= 1;
	end
	//resta registro
	else if(Opcode == 5'b00010)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 4'b0100;
		 MuxResultIN <= 2'b10;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 1;
		 MuxDatoIN <= 1;
		 WriteMemIN <= 0;
		 WriteRegIN <= 1;
	end
	//resta inmediato
	else if(Opcode == 5'b00011)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 1;
		 CodigoALUIN <= 4'b0100;
		 MuxResultIN <= 2'b10;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 1;
		 MuxDatoIN <= 1;
		 WriteMemIN <= 0;
		 WriteRegIN <= 1;
	end
	//comparar registros
	else if(Opcode == 5'b00100)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 4'b0101;
		 MuxResultIN <= 2'b10;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 1;
		 MuxDatoIN <= 1;
		 WriteMemIN <= 0;
		 WriteRegIN <= 1;
	end
	//comparar inmediato
	else if(Opcode == 5'b00101)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 1;
		 CodigoALUIN <= 4'b0101;
		 MuxResultIN <= 2'b10;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 1;
		 MuxDatoIN <= 1;
		 WriteMemIN <= 0;
		 WriteRegIN <= 1;
	end
	//and
	else if(Opcode == 5'b00110)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 4'b0000;
		 MuxResultIN <= 2'b10;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 1;
		 MuxDatoIN <= 1;
		 WriteMemIN <= 0;
		 WriteRegIN <= 1;
	end
	//or
	else if(Opcode == 5'b00111)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 4'b0001;
		 MuxResultIN <= 2'b10;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 1;
		 MuxDatoIN <= 1;
		 WriteMemIN <= 0;
		 WriteRegIN <= 1;
	end
	//not
	else if(Opcode == 5'b01000)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 4'b0110;
		 MuxResultIN <= 2'b10;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 1;
		 MuxDatoIN <= 1;
		 WriteMemIN <= 0;
		 WriteRegIN <= 1;
	end
	//xor
	else if(Opcode == 5'b01001)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 3'b0010;
		 MuxResultIN <= 2'b10;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 1;
		 MuxDatoIN <= 1;
		 WriteMemIN <= 0;
		 WriteRegIN <= 1;
	end
	//cargar registro
	else if(Opcode == 5'b01010)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 4'b0000;
		 MuxResultIN <= 2'b11;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 0;
		 MuxDatoIN <= 0;
		 WriteMemIN <= 0;
		 WriteRegIN <= 1;
	end
	//cargar inmediato
	else if(Opcode == 5'b01011)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 1;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 4'b0000;
		 MuxResultIN <= 2'b11;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 0;
		 MuxDatoIN <= 0;
		 WriteMemIN <= 0;
		 WriteRegIN <= 1;
	end
	//almacenar registro
	//preguntarmuxdato
	else if(Opcode == 5'b01100)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 1;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 4'b0000;
		 MuxResultIN <= 2'b00;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 1;
		 MuxDatoIN <= 0;
		 WriteMemIN <= 1;
		 WriteRegIN <= 0;
	end
	//almacenar inmediato
	else if(Opcode == 5'b01101)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 1;
		 crtlMuxValA <= 1;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 4'b0000;
		 MuxResultIN <= 2'b00;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 1;
		 MuxDatoIN <= 0;
		 WriteMemIN <= 1;
		 WriteRegIN <= 0;
	end
	//mover registro
	else if(Opcode == 5'b01110)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 4'b0000;
		 MuxResultIN <= 2'b00;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 1;
		 MuxDatoIN <= 1;
		 WriteMemIN <= 0;
		 WriteRegIN <= 1;
	end
	//mover inmediato
	else if(Opcode == 5'b01111)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 1;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 4'b0000;
		 MuxResultIN <= 2'b00;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 1;
		 MuxDatoIN <= 1;
		 WriteMemIN <= 0;
		 WriteRegIN <= 1;
	end
	//corrimiento a la izquierda(como se hace,quien lo hace?)
	else if(Opcode == 5'b10000)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 4'b0111;
		 MuxResultIN <= 2'b10;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 1;
		 MuxDatoIN <= 1;
		 WriteMemIN <= 0;
		 WriteRegIN <= 1;
	end
	//corrimiento a la derecha(como se hace,quien lo hace?)
	else if(Opcode == 5'b10001)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 4'b0000;
		 MuxResultIN <= 2'b00;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 0;
		 MuxDatoIN <= 0;
		 WriteMemIN <= 0;
		 WriteRegIN <= 0;
	end
	//rotacion(como se hace,quien lo hace?)
	else if(Opcode == 5'b10010)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 4'b0000;
		 MuxResultIN <= 2'b00;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 0;
		 MuxDatoIN <= 0;
		 WriteMemIN <= 0;
		 WriteRegIN <= 0;
	end
	//salto
	else if(Opcode == 5'b10011)
	begin
		 MuxDireccionPC <= 1;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 4'b0000;
		 MuxResultIN <= 2'b00;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 0;
		 MuxDatoIN <= 0;
		 WriteMemIN <= 0;
		 WriteRegIN <= 0;
	end
	//salto con condicion diferente
	else if(Opcode == 5'b10100)
	begin
		MuxDireccionPC <= 0;
		MuxSelDirRegB <= 1;
		crtlMuxValA <= 0;
		crtlMuxValB <= 0;
		CodigoALUIN <= 4'b0101;
		MuxResultIN <= 2'b00;
		MuxDirWriteIN <= 0;
		MuxDirMemIN <= 1;
		MuxDatoIN <= 1;
		WriteMemIN <= 0;
		WriteRegIN <= 0;		
	end
	//salto con condicion igual 
	else if(Opcode == 5'b10101)
	begin
		MuxDireccionPC <= 2'b00;
		MuxSelDirRegB <= 1;
		crtlMuxValA <= 0;
		crtlMuxValB <= 0;
		CodigoALUIN <= 4'b0101;
		MuxResultIN <= 2'b00;
		MuxDirWriteIN <= 0;
		MuxDirMemIN <= 1;
		MuxDatoIN <= 1;
		WriteMemIN <= 0;
		WriteRegIN <= 0;
	end
	//salto con condicion diferente comparacion
	else if(OpCodeIDEXOUT == 5'b10100)
	begin
		if(Flags == 2'b10 | Flags == 2'b00)
		begin
			MuxDireccionPC <= 2'b10;
			MuxSelDirRegB <= 0;
			crtlMuxValA <= 0;
			crtlMuxValB <= 0;
			CodigoALUIN <= 4'b0000;
			MuxResultIN <= 2'b11;
			MuxDirWriteIN <= 0;
			MuxDirMemIN <= 0;
			MuxDatoIN <= 0;
			WriteMemIN <= 0;
			WriteRegIN <= 0;
		end
		else
		begin
			MuxDireccionPC <= 0;
			MuxSelDirRegB <= 0;
			crtlMuxValA <= 0;
			crtlMuxValB <= 0;
			CodigoALUIN <= 4'b0000;
			MuxResultIN <= 2'b00;
			MuxDirWriteIN <= 0;
			MuxDirMemIN <= 0;
			MuxDatoIN <= 1;
			WriteMemIN <= 0;
			WriteRegIN <= 0;
		end
	end
	//salto con condicion igual comparacion
	else if(OpCodeIDEXOUT == 5'b10101)
	begin
		if(Flags == 2'b01)
		begin
			MuxDireccionPC <= 2'b10;
			MuxSelDirRegB <= 0;
			crtlMuxValA <= 0;
			crtlMuxValB <= 0;
			CodigoALUIN <= 4'b0000;
			MuxResultIN <= 2'b00;
			MuxDirWriteIN <= 0;
			MuxDirMemIN <= 0;
			MuxDatoIN <= 0;
			WriteMemIN <= 0;
			WriteRegIN <= 0;
		end
		else
		begin
			MuxDireccionPC <= 2'b00;
			MuxSelDirRegB <= 0;
			crtlMuxValA <= 0;
			crtlMuxValB <= 0;
			CodigoALUIN <= 4'b0000;
			MuxResultIN <= 2'b11;
			MuxDirWriteIN <= 0;
			MuxDirMemIN <= 0;
			MuxDatoIN <= 1;
			WriteMemIN <= 0;
			WriteRegIN <= 0;
		end
	end	
	//mult
	else if(Opcode == 5'b10110)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 4'b1000;
		 MuxResultIN <= 2'b10;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 1;
		 MuxDatoIN <= 1;
		 WriteMemIN <= 0;
		 WriteRegIN <= 1;
		 
	end
	//NOP
	else if(Opcode == 5'b10111)
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 4'b0000;
		 MuxResultIN <= 2'b11;
		 MuxDirWriteIN <= 1;
		 MuxDirMemIN <= 1;
		 MuxDatoIN <= 1;
		 WriteMemIN <= 0;
		 WriteRegIN <= 0;
	end
	else
	begin
		 MuxDireccionPC <= 0;
		 MuxSelDirRegB <= 0;
		 crtlMuxValA <= 0;
		 crtlMuxValB <= 0;
		 CodigoALUIN <= 3'b000;
		 MuxResultIN <= 2'b00;
		 MuxDirWriteIN <= 0;
		 MuxDirMemIN <= 0;
		 MuxDatoIN <= 0;
		 WriteMemIN <= 0;
		 WriteRegIN <= 0;
	end
end
endmodule
