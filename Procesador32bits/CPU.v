module CPU(
	input wire clk,
	output wire [31:0]reg0,
	output wire [31:0]reg1,
	output wire [31:0]reg2,
	output wire [31:0]reg3,
	output wire [31:0]reg4,
	output wire [31:0]reg5,
	output wire [31:0]reg6,
	output wire [31:0]reg7,
	output wire [31:0]reg8,
	output wire [31:0]reg9,
	output wire [31:0]reg10,
	output wire [31:0]reg11,
	output wire [31:0]reg12,
	output wire [31:0]reg13,
	output wire [31:0]reg14,
	output wire [31:0]reg15,
	output wire [31:0]reg16,
	output wire [31:0]reg17,
	output wire [31:0]reg18,
	output wire [31:0]reg19,
	output wire [31:0]reg20,
	output wire [31:0]reg21,
	output wire [31:0]reg22,
	output wire [31:0]reg23,
	output wire [31:0]reg24,
	output wire [31:0]reg25/**
	//----muxDirMem----
	output wire [4:0] DirMemResult,OpCodeIFDOUT,OpCodeIDEXOUT,
	//---memDatos------
	output wire [31:0] DatoOutMem,InmCorrimIFDOUT, newpc, pcout,ValBDEOUT, ValADEOUT,
	//---pipeEm-------
	output wire MuxDirMemEMOUT,
	output wire MuxDatoEMOUT,
	output wire WriteMemEMOUT,
	output wire WriteRegEMOUT,
	//---MEMINTRUC----
	output wire [31:0] inst,DatoWBIN*/

	);
	
	//----muxDirMem----
	wire [4:0] DirMemResult,OpCodeIFDOUT,OpCodeIDEXOUT;
	//---memDatos------
	wire [31:0] DatoOutMem,InmCorrimIFDOUT, newpc,ValBDEOUT, ValADEOUT, pcout;
	//---pipeEm-------
	wire MuxDirMemEMOUT;
	wire MuxDatoEMOUT;
//	wire WriteMemEMOUT;
	wire WriteRegEMOUT;
	//---MEMINTRUC----
	wire [31:0] inst,DatoWBIN;
//---MUXDIRECCION-
 wire [1:0] crtlMuxDireccionPC;

//---MEMINTRUC----
// wire [31:0] inst;

//---pipeIFD------
 //wire [4:0] OpCodeIFDOUT,OpCodeIDEXOUT;
 wire [1:0] flagsALU;

//wire [15:0] DireccionIFDOUT;
 wire [4:0] DirRegAIFDOUT;
 wire [4:0] DirRegBIFDOUT;
 wire [31:0] InmCorrimDEXOUT;
 wire [4:0] DirWriteIFDOUT, DirRegB;

//---registerBank-
 wire WriteRegMWBOUT;
 wire [31:0] DatoMWBOUT;
 wire [4:0] DirWriteMWBOUT;
 //wire [31:0]newpc;
 //wire [31:0]pcout;
 wire [31:0]DireccionIFDOUT;
 wire crtlMuxValA;
 wire [31:0] ValAREG;

//----muxValB------
 wire crtlMuxValB;
 wire [31:0] ValBREG;



	
wire [31:0] pc4;
assign pc4 = 32'd1;
wire [31:0] outpc4;


wire [31:0] D0REG;
wire [31:0] D1REG;
wire [31:0] D2REG;
wire [31:0] D3REG;
wire [31:0] D4REG;
wire [31:0] D5REG;
wire [31:0] D6REG;
wire [31:0] D7REG;
wire [31:0] D8REG;
wire [31:0] D9REG;
wire [31:0] D10REG;
wire [31:0] D11REG;
wire [31:0] D12REG;
wire [31:0] D13REG;
wire [31:0] D14REG;
wire [31:0] D15REG;
wire [31:0] D16REG;
wire [31:0] D17REG;
wire [31:0] D18REG;
wire [31:0] D19REG;
wire [31:0] D20REG;
wire [31:0] D21REG;
wire [31:0] D22REG;
wire [31:0] D23REG;
wire [31:0] D24REG;

wire [31:0] D25REG;
	 
wire [31:0] OutputAREG;
wire [31:0] OutputBREG;

//----ModEspecial--
//wire ModEsp;
wire [3:0] CodigoALU;
wire [1:0] MuxResult;
wire MuxDirWrite;
wire MuxDirMem;
wire MuxDato;
wire WriteMem;
wire WriteReg;

//wire ModEspOUT;
wire [3:0] CodigoALUDEOUT;
wire [1:0] MuxResultDEOUT;
wire MuxDirWriteDEOUT;
wire MuxDirMemDEOUT;
wire MuxDatoDEOUT;
wire WriteMemDEOUT;
wire WriteRegDEOUT;
	 
wire [31:0] D0DEOUT;
wire [31:0] D1DEOUT;
wire [31:0] D2DEOUT;
wire [31:0] D3DEOUT;
wire [31:0] D4DEOUT;
wire [31:0] D5DEOUT;
wire [31:0] D6DEOUT;
wire [31:0] D7DEOUT;
wire [31:0] D8DEOUT;
wire [31:0] D9DEOUT;
wire [31:0] D10DEOUT;
wire [31:0] D11DEOUT;
wire [31:0] D12DEOUT;
wire [31:0] D13DEOUT;
wire [31:0] D14DEOUT;
wire [31:0] D15DEOUT;
wire [31:0] D16DEOUT;
wire [31:0] D17DEOUT;
wire [31:0] D18DEOUT;
wire [31:0] D19DEOUT;
wire [31:0] D20DEOUT;
wire [31:0] D21DEOUT;
wire [31:0] D22DEOUT;
wire [31:0] D23DEOUT;
wire [31:0] D24DEOUT;
	 
//wire [31:0] ValADEOUT;
//wire [31:0] ValBDEOUT;

wire [4:0] DirWriteDEOUT;
//wire numero mayor
wire [31:0]numMayor;
//-----ALU/Flags----
//wire [1:0] flagsALU;
wire [31:0] resultALU;
//--MuxResultSelect--
wire [31:0] valorNull;
assign valorNull = 32'd0;
wire [31:0] DatoResp;
//---muxDirW------	
wire [31:0] RegistoEspMayor;
assign RegistoEspMayor = 32'd25;
wire [31:0]DirWriteEMIN;



	 
//wire [31:0] DirMemCargaEMOUT;
wire [31:0] DatoResultEMOUT;
wire [31:0] DirMemRegBOUT;
wire [4:0] DirWriteEMOUT;




//wire [31:0] DireccionVGA;
//wire [31:0] DatoOutMemVGA;
//----muxDato------
//wire [31:0] DatoWBIN; 
//----pipeWB-------
wire [1:0] flagsMWBOUT;
//----RAM------
wire [31:0]SalidaVGARam;		
//--------------------------------------------------------

PC pc(clk,newpc,pcout);


Mux4x1 MuxDireccionPC(outpc4,DireccionIFDOUT, InmCorrimDEXOUT, valorNull,crtlMuxDireccionPC,newpc);

MemInst memInst(pcout,clk,inst);

PipeIFD pipeIFD(clk,inst,OpCodeIFDOUT,DireccionIFDOUT,DirRegAIFDOUT,DirRegBIFDOUT,InmCorrimIFDOUT,
					DirWriteIFDOUT);

Adder pcplus4(pcout,pc4,outpc4);

ControlUnit unidadControl(OpCodeIFDOUT,OpCodeIDEXOUT,flagsALU,crtlMuxDireccionPC,crtlMuxDirB,crtlMuxValA,crtlMuxValB,
								  CodigoALU,MuxResult,MuxDirWrite,MuxDirMem,MuxDato,WriteMem,WriteReg);
								  
Mux2x1 muxDirRegB(DirRegBIFDOUT,DirWriteIFDOUT,crtlMuxDirB,DirRegB);							

RegisterBank registerBank(clk, WriteRegMWBOUT,DirRegAIFDOUT,DirRegB,DirWriteMWBOUT,DatoMWBOUT,
					           D0REG,D1REG,D2REG,D3REG,D4REG,D5REG,D6REG,D7REG,D8REG,D9REG,D10REG,D11REG,
								  D12REG,D13REG,D14REG,D15REG,D16REG,D17REG,D18REG,D19REG,D20REG,D21REG,D22REG,
								  D23REG,D24REG,D25REG,OutputAREG,OutputBREG);
								  
								  
Mux2x1 muxValA(OutputAREG,InmCorrimIFDOUT,crtlMuxValA,ValAREG);

Mux2x1 muxValB(OutputBREG,InmCorrimIFDOUT,crtlMuxValB,ValBREG);

PipeDE pipeDE(clk,OpCodeIFDOUT,InmCorrimIFDOUT,CodigoALU,MuxResult,MuxDirWrite,MuxDirMem,MuxDato,WriteMem,WriteReg,
				  D0REG,D1REG,D2REG,D3REG,D4REG,D5REG,D6REG,D7REG,D8REG,D9REG,D10REG,D11REG,
				  D12REG,D13REG,D14REG,D15REG,D16REG,D17REG,D18REG,D19REG,D20REG,D21REG,D22REG,
				  D23REG,D24REG,ValAREG,ValBREG,DirWriteIFDOUT,CodigoALUDEOUT,MuxResultDEOUT,
				  MuxDirWriteDEOUT,MuxDirMemDEOUT,MuxDatoDEOUT,WriteMemDEOUT,WriteRegDEOUT,D0DEOUT,
				  D1DEOUT,D2DEOUT,D3DEOUT,D4DEOUT,D5DEOUT,D6DEOUT,D7DEOUT,D8DEOUT,D9DEOUT,D10DEOUT,
				  D11DEOUT,D12DEOUT,D13DEOUT,D14DEOUT,D15DEOUT,D16DEOUT,D17DEOUT,D18DEOUT,D19DEOUT,
				  D20DEOUT,D21DEOUT,D22DEOUT,D23DEOUT,D24DEOUT,ValADEOUT,ValBDEOUT,DirWriteDEOUT,OpCodeIDEXOUT,InmCorrimDEXOUT);

						 
ALU alu(ValADEOUT,ValBDEOUT,CodigoALUDEOUT,resultALU,flagsALU);

Mux4x1 MuxResultSelect(ValADEOUT,numMayor,resultALU,valorNull,MuxResultDEOUT,DatoResp);

Mux2x1 muxDirW(DirWriteDEOUT,RegistoEspMayor,MuxDirWriteDEOUT,DirWriteEMIN);

PipeEM pipeEm(clk,MuxDirMemDEOUT,MuxDatoDEOUT,WriteMemDEOUT,WriteRegDEOUT,ValADEOUT,DatoResp,ValBDEOUT,
				  DirWriteEMIN,MuxDirMemEMOUT,MuxDatoEMOUT,WriteMemEMOUT,WriteRegEMOUT,DirMemCargaEMOUT,
				  DatoResultEMOUT,DirMemRegBOUT,DirWriteEMOUT);

Mux2x1 muxDirMem(DirMemCargaEMOUT,DirMemRegBOUT,MuxDirMemEMOUT,DirMemResult);

MemDatos memDatos(ValAREG,clk,DatoResultEMOUT,WriteMemEMOUT,DatoOutMem);	

Mux2x1 muxDato(DatoOutMem,DatoResultEMOUT,MuxDatoEMOUT,DatoWBIN);

PipeWB pipeWB(clk,WriteRegEMOUT,DatoWBIN,DirWriteEMOUT,WriteRegMWBOUT,DatoMWBOUT,DirWriteMWBOUT);


				  
assign reg0 = D0REG;
assign reg1 = D1REG;
assign reg2 = D2REG;
assign reg3 = D3REG;
assign reg4 = D4REG;
assign reg5 = D5REG;
assign reg6 = D6REG;
assign reg7 = D7REG;
assign reg8 = D8REG;
assign reg9 = D9REG;
assign reg10 = D10REG;
assign reg11 = D11REG;
assign reg12 = D12REG;
assign reg13 = D13REG;
assign reg14 = D14REG;
assign reg15 = D15REG;
assign reg16 = D16REG;
assign reg17 = D17REG;
assign reg18 = D18REG;
assign reg19 = D19REG;
assign reg20 = D20REG;
assign reg21 = D21REG;
assign reg22 = D22REG;
assign reg23 = D23REG;
assign reg24 = D24REG;
assign reg25 = D25REG;
						
endmodule
