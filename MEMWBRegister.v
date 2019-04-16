`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - MEMWBRegister.v
// Description - Sign extension module.
////////////////////////////////////////////////////////////////////////////////
module MEMWBRegister(PCAddResult3,PCAddResult4,RegWrite2,MemtoReg2,ReadData,ALUResult_in,EXMEMRTorRd,Clk,Reset,MEMWBRTorRd,RegWrite3,MemtoReg3,ReadData_out,ALUResult_out2);
	input RegWrite2,Clk,Reset;
	input [1:0] MemtoReg2;
	input [31:0] ReadData;
	input [31:0] ALUResult_in,PCAddResult3;
	input [4:0] EXMEMRTorRd;
	output reg [4:0] MEMWBRTorRd;
	output reg RegWrite3;
	output reg [31:0] ReadData_out;
	output reg [31:0] ALUResult_out2,PCAddResult4;
	output reg [1:0]MemtoReg3;

	always @(posedge Clk) begin
		if(Reset==1) begin
			RegWrite3<=0;
			MemtoReg3<=0;
			ReadData_out<=0;
			ALUResult_out2<=0;	
			
		end

		else begin
			RegWrite3<=RegWrite2;
			MemtoReg3<=MemtoReg2;
			ReadData_out<=ReadData;
			ALUResult_out2<=ALUResult_in;
			MEMWBRTorRd<=EXMEMRTorRd;
			PCAddResult4<=PCAddResult3;
		end
	end
			
endmodule
