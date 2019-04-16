`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - EXMEMRegister.v
// Description - Sign extension module.
////////////////////////////////////////////////////////////////////////////////
module EXMEMRegister(IDEXinstruction,EXMEMinstruction,PCSrc3,J_JR_Branch_signal_1,J_JR_Branch_signal_2,PCAddResult2,PCAddResult3,loadhalf1,loadbyte1,storehalf1,storebyte1,loadupperi1,RegWrite1,MemtoReg1,MemRead1,MemWrite1,PCSrc1,AddResult_in,Zero_in,ALUResult_in,outputvalue,Clk,Reset,RegWrite2,MemtoReg2,MemRead2,MemWrite2,PCSrc2,AddResult_out,Zero_out,ALUResult_out,ReadData2_out1,loadhalf2,loadbyte2,storehalf2,storebyte2,loadupperi2,NextAddress,NextAddress1,EXRTorRD,EXMEMRTorRd);
	input RegWrite1,MemRead1,MemWrite1,PCSrc1,loadhalf1,loadbyte1,storehalf1,storebyte1,loadupperi1;
	input [31:0]AddResult_in; //how many bits?
	input Zero_in,Clk,Reset,PCSrc3;
	input [31:0] outputvalue, ALUResult_in,IDEXinstruction;
	
    input [31:0]PCAddResult2;
    input [1:0] MemtoReg1,J_JR_Branch_signal_1;
    input [31:0] NextAddress;
    output reg [31:0] NextAddress1,EXMEMinstruction;
    input [4:0]  EXRTorRD;
    output reg [4:0] EXMEMRTorRd;
	output reg RegWrite2,MemRead2,MemWrite2,PCSrc2,loadhalf2,loadbyte2,storehalf2,storebyte2,loadupperi2;
	output reg [31:0] AddResult_out;
	output reg Zero_out;
	output reg [31:0] ReadData2_out1,ALUResult_out,PCAddResult3;
	
	output reg[1:0] MemtoReg2,J_JR_Branch_signal_2;

	always @(posedge Clk) begin
		if(Reset==1 || (PCSrc3==1 )) begin
			RegWrite2<=0;
			MemtoReg2<=0;
			MemRead2<=0;
			MemWrite2<=0;
			AddResult_out<=0;
			Zero_out<=0;
			ReadData2_out1<=0;
			ALUResult_out<=0;
			EXMEMinstruction<=0;
			PCSrc2<=0;
			loadhalf2<=0;
			loadbyte2<=0;
			storehalf2<=0;
			storebyte2<=0;
			loadupperi2<=0;
			J_JR_Branch_signal_2<=2'b00;
			EXMEMRTorRd<=0;
		end

		else begin
			RegWrite2<=RegWrite1;
			MemtoReg2<=MemtoReg1;
			MemRead2<=MemRead1;
			MemWrite2<=MemWrite1;
			AddResult_out<=AddResult_in;
			Zero_out<=Zero_in;
			ReadData2_out1<=outputvalue;
			ALUResult_out<=ALUResult_in;
			
			PCSrc2<=PCSrc1;
			loadhalf2<=loadhalf1;
            loadbyte2<=loadbyte1;
            storehalf2<=storehalf1;
            storebyte2<=storebyte1;
            loadupperi2<=loadupperi1;
		
			NextAddress1<=NextAddress;
			PCAddResult3<=PCAddResult2;
			J_JR_Branch_signal_2<=J_JR_Branch_signal_1;
			EXMEMinstruction<=IDEXinstruction;
			EXMEMRTorRd<=EXRTorRD;
		end
	end


endmodule
