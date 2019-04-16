`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - IF/ID register
////////////////////////////////////////////////////////////////////////////////
module IFIDRegister(PCSrc3,IFIDWrite,PCAddResult,Instruction,Clk,Reset,PCAddResult1,Instruction1,instructionback,pcback);

	input [31:0] PCAddResult,Instruction,instructionback,pcback;
	input Clk,Reset,IFIDWrite,PCSrc3;
	output reg [31:0] PCAddResult1,Instruction1;
	
	always@(posedge Clk) begin
		if(Reset==1||PCSrc3==1) begin
          PCAddResult1<=32'd0;
			Instruction1<=32'd0;
		end
    else if(IFIDWrite==0) begin
                  PCAddResult1<=pcback;
                  Instruction1<=instructionback;
                end
		else begin

			PCAddResult1<=PCAddResult;
			Instruction1<=Instruction;
		end
	end
	

endmodule
