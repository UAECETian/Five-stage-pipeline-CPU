`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2018 02:00:24 AM
// Design Name: 
// Module Name: ControllerMux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ControllerMux(instructionincontrol,instructionoutcontrol,ControlMux, newmux, RegDst,Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc,RegWrite,PCSrc,Zero_or_Sign_signal,J_JR_Branch_signal,loadhalf,loadbyte,storehalf,storebyte,loadupperi, newmux1, RegDst1,Branch1, MemRead1, MemtoReg1, ALUOp1, MemWrite1, ALUSrc1,RegWrite1,PCSrc1,Zero_or_Sign_signal_1,J_JR_Branch_signal_1,loadhalf1,loadbyte1,storehalf1,storebyte1,loadupperi1,ControlMuxsignal);

  input  ControlMux, RegWrite, ALUSrc, MemRead, MemWrite, PCSrc,Branch,newmux,Zero_or_Sign_signal,loadhalf,loadbyte,storehalf,storebyte,loadupperi;
  input [31:0] instructionincontrol;
    output reg [31:0] instructionoutcontrol;
   input [5:0] ALUOp;
   input [1:0] RegDst, MemtoReg;
   input [1:0] J_JR_Branch_signal;
    output reg   RegWrite1, ALUSrc1, MemRead1, MemWrite1, PCSrc1,Branch1,newmux1,Zero_or_Sign_signal_1,loadhalf1,loadbyte1,storehalf1,storebyte1,loadupperi1,ControlMuxsignal;
 output reg [5:0] ALUOp1;
     output reg [1:0] RegDst1, MemtoReg1;
     output reg [1:0] J_JR_Branch_signal_1;
    /* Fill in the implementation here ... */ 
    always@( instructionincontrol,ControlMux,newmux, RegDst,Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc,RegWrite,PCSrc,Zero_or_Sign_signal,J_JR_Branch_signal,loadhalf,loadbyte,storehalf,storebyte,loadupperi) begin
    if(ControlMux==0)begin
       RegDst1 <=0; RegWrite1 <= 0; ALUSrc1 <= 0; ALUOp1 <= 6'b000000; MemRead1 <= 0;
             MemWrite1<= 0; MemtoReg1 <= 0; PCSrc1 <= 0;newmux1<=0; Branch1 <=0;J_JR_Branch_signal_1<=2'b00;
             Zero_or_Sign_signal_1<=0;loadhalf1<=0;loadbyte1<=0;storehalf1<=0;storebyte1<=0;loadupperi1<=0;
             ControlMuxsignal<=0;
             
             instructionoutcontrol<=0;
      end 
      else if (ControlMux==1)begin
       RegDst1 <=RegDst; RegWrite1 <=RegWrite; ALUSrc1 <=ALUSrc; ALUOp1 <=  ALUOp; MemRead1 <=MemRead;
                  MemWrite1<= MemWrite; MemtoReg1 <=MemtoReg; PCSrc1 <=PCSrc;newmux1<=newmux; Branch1 <=Branch;J_JR_Branch_signal_1<=J_JR_Branch_signal;
                  Zero_or_Sign_signal_1<= Zero_or_Sign_signal;loadhalf1<=loadhalf;loadbyte1<=loadbyte;storehalf1<=storehalf;storebyte1<=storebyte;loadupperi1<=loadupperi;
        ControlMuxsignal<=1;
        instructionoutcontrol<=instructionincontrol;
    end
    end
    
endmodule
