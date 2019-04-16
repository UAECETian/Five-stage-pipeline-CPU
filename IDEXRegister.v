`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - IDEXRegister.v

////////////////////////////////////////////////////////////////////////////////
module IDEXRegister(Instructionoutcontrolmux,IDEXInstruction,PCSrc3,J_JR_Branch_signal_2,ControlMuxsignal,RegDst, RegWrite, ALUSrc, MemRead,MemWrite,MemtoReg,PCSrc,Branch,newmux,ALUOp,PCAddResult1,ReadData1,ReadData2,SignExtension_out1,ZeroExtension_out1,Clk,Reset, RegDst1, RegWrite1, ALUSrc1, MemRead1,MemWrite1,MemtoReg1,PCSrc1,Branch1,newmux1,ALUOp1,PCAddResult2,ReadData1_out,ReadData2_out,SignExtension_out2,ZeroExtension_out2,Zero_or_Sign_signal,J_JR_Branch_signal,loadhalf,loadbyte,storehalf,storebyte,loadupperi,Zero_or_Sign_signal_1,J_JR_Branch_signal_1,loadhalf1,loadbyte1,storehalf1,storebyte1,loadupperi1);
	input ControlMuxsignal,RegWrite,ALUSrc,MemRead,MemWrite,PCSrc,Branch,newmux,Zero_or_Sign_signal;
	input loadhalf,loadbyte,storehalf,storebyte,loadupperi,PCSrc3;
	input [1:0] RegDst,MemtoReg,J_JR_Branch_signal,J_JR_Branch_signal_2;
	input [31:0] Instructionoutcontrolmux;
	input [5:0] ALUOp;
	input [31:0] ReadData1,ReadData2,SignExtension_out1,ZeroExtension_out1;
	
	input [31:0] PCAddResult1;
	input Clk,Reset;

	output reg RegWrite1,ALUSrc1,MemRead1,MemWrite1,PCSrc1,Branch1,newmux1;
	output reg [1:0]  RegDst1,MemtoReg1;
	output reg [5:0] ALUOp1;
	output reg [31:0] ReadData1_out,ReadData2_out,SignExtension_out2,ZeroExtension_out2;
	
	output reg [31:0] PCAddResult2;
	output reg Zero_or_Sign_signal_1,loadhalf1,loadbyte1,storehalf1,storebyte1,loadupperi1;
	output reg [1:0] J_JR_Branch_signal_1;
	output reg [31:0] IDEXInstruction;

	always@(posedge Clk) begin

		if(Reset==1||(PCSrc3==1 )) begin
		
			RegDst1<=0;
			RegWrite1<=0;
			ALUSrc1<=0;
			MemRead1<=0;
			MemWrite1<=0;
			MemtoReg1<=0;
			PCSrc1<=0;
			Branch1<=0;
			newmux1<=0;
			ReadData1_out<=0;
			ReadData2_out<=0;
			SignExtension_out2<=0;
		
			ALUOp1<=6'd0;
			Zero_or_Sign_signal_1<=0;loadhalf1<=0;loadbyte1<=0;storehalf1<=0;storebyte1<=0;loadupperi1<=0;
			ZeroExtension_out2<=0;
			J_JR_Branch_signal_1<=2'b00;
			IDEXInstruction<=0;
		end
  /*else if(ControlMuxsignal==0) begin
                
                    RegDst1<=0;
                    RegWrite1<=0;
                    ALUSrc1<=0;
                    MemRead1<=0;
                    MemWrite1<=0;
                    MemtoReg1<=0;
                    PCSrc1<=0;
                    Branch1<=0;
                    newmux1<=0;
                   ReadData1_out<=0;
                   //ReadData1_out<=ReadData1;
                              // ReadData2_out<=ReadData2;
                              // SignExtension_out2<=SignExtension_out1;
                   ReadData2_out<=0;
                   SignExtension_out2<=0;
                    Instruction20_16_out<=0;
                    Instruction15_11_out<=0;
                    ALUOp1<=6'b000000;
                    Zero_or_Sign_signal_1<=0;loadhalf1<=0;loadbyte1<=0;storehalf1<=0;storebyte1<=0;loadupperi1<=0;
                    ZeroExtension_out2<=0;
                    J_JR_Branch_signal_1<=2'b00;
                end
  
  */
  
		else begin	
			RegDst1<=RegDst;
			RegWrite1<=RegWrite;
			ALUSrc1<=ALUSrc;
			MemRead1<=MemRead;
			MemWrite1<=MemWrite;
			MemtoReg1<=MemtoReg;
			PCSrc1<=PCSrc;
			Branch1<=Branch;
			newmux1<=newmux;
			ReadData1_out<=ReadData1;
			ReadData2_out<=ReadData2;
			SignExtension_out2<=SignExtension_out1;
			
			ALUOp1<=ALUOp;
			ZeroExtension_out2<=ZeroExtension_out1;
			Zero_or_Sign_signal_1<=Zero_or_Sign_signal;
			loadhalf1<=loadhalf;
			loadbyte1<=loadbyte;
			storehalf1<=storehalf;
			storebyte1<=storebyte;
			loadupperi1<=loadupperi;
			J_JR_Branch_signal_1<=J_JR_Branch_signal;
			IDEXInstruction<=Instructionoutcontrolmux;
			PCAddResult2<=PCAddResult1;
		end

	end



		


   
endmodule
