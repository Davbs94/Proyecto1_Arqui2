// Copyright (C) 2016  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Intel and sold by Intel or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.


// Generated by Quartus Prime Version 16.1 (Build Build 196 10/24/2016)
// Created on Thu Oct 12 18:33:47 2017

CPU CPU_inst
(
	.clk(clk_sig) ,	// input  clk_sig
	.crtlMuxDireccionPC(crtlMuxDireccionPC_sig) ,	// output  crtlMuxDireccionPC_sig
	.inst(inst_sig) ,	// output [31:0] inst_sig
	.OpCodeIFDOUT(OpCodeIFDOUT_sig) ,	// output [4:0] OpCodeIFDOUT_sig
	.DirRegAIFDOUT(DirRegAIFDOUT_sig) ,	// output [4:0] DirRegAIFDOUT_sig
	.DirRegBIFDOUT(DirRegBIFDOUT_sig) ,	// output [4:0] DirRegBIFDOUT_sig
	.InmCorrimIFDOUT(InmCorrimIFDOUT_sig) ,	// output [31:0] InmCorrimIFDOUT_sig
	.DirWriteIFDOUT(DirWriteIFDOUT_sig) ,	// output [4:0] DirWriteIFDOUT_sig
	.WriteRegMWBOUT(WriteRegMWBOUT_sig) ,	// output  WriteRegMWBOUT_sig
	.DatoMWBOUT(DatoMWBOUT_sig) ,	// output [31:0] DatoMWBOUT_sig
	.DirWriteMWBOUT(DirWriteMWBOUT_sig) ,	// output [4:0] DirWriteMWBOUT_sig
	.newpc(newpc_sig) ,	// output [31:0] newpc_sig
	.pcout(pcout_sig) ,	// output [31:0] pcout_sig
	.DireccionIFDOUT(DireccionIFDOUT_sig) 	// output [31:0] DireccionIFDOUT_sig
);

