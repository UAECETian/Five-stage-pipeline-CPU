`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2018 11:36:11 AM
// Design Name: 
// Module Name: ID
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


module ID(instructionoutcontrol,IDEXrt,J_JR_Branch_signal_2,Branch_Mux_out,ALUResult_out,EXMEMRegWrite,Instruction1,RegWrite3,WriteRegister, WriteData,RegDst, RegWrite, ALUSrc, MemRead,MemWrite,MemtoReg,PCSrc,Branch,newmux,ReadData1,ReadData2,SignExtension_out,ZeroExtension_out,ALUOp, Clk,Reset,Zero_or_Sign_signal,J_JR_Branch_signal,loadhalf,loadbyte,storehalf,storebyte,loadupperi,IDEXMemRead,PCWrite,IFIDWrite,ControlMuxsignal ,EXMEMRD,EXMEMREAD,X,Y,diff);
   // input PCAddResult_out;
    input [31:0] Instruction1;
    input EXMEMRegWrite;
    input [31:0]ALUResult_out;
    output [1:0] RegDst,J_JR_Branch_signal,J_JR_Branch_signal_2;
    input  Clk,Reset,RegWrite3,IDEXMemRead ,EXMEMREAD;
    //input WriteRegister, WriteData;
    input [31:0] WriteData;
    input [4:0]WriteRegister,IDEXrt,EXMEMRD;
    output  PCWrite,IFIDWrite, RegWrite, ALUSrc, MemRead,MemWrite,PCSrc,Branch,newmux,loadhalf,loadbyte,storehalf,storebyte,loadupperi,ControlMuxsignal,Zero_or_Sign_signal;
    output [1:0] MemtoReg;
    output [31:0]ReadData2,SignExtension_out,ZeroExtension_out,instructionoutcontrol;
    output wire [31:0] ReadData1;
    output [5:0] ALUOp;
    output [31:0] Branch_Mux_out,X,Y,diff;
    wire BrachMux_signal;
    wire ControlMux, PCWrite0,IFIDWrite0, RegWrite0, ALUSrc0, MemRead0,MemWrite0,PCSrc0,Branch0,newmux0,loadhalf0,loadbyte0,storehalf0,storebyte0,loadupperi0,Zero_or_Sign_signal0;
       wire [1:0] MemtoReg0, RegDst0,J_JR_Branch_signal0;
     //  output  [31:0]ReadData1,ReadData2,SignExtension_out,ZeroExtension_out;
      wire [5:0] ALUOp0;
     // wire [31:0]IDinstruction;
    RegisterFile a1(Instruction1[25:21], Instruction1[20:16], WriteRegister, WriteData, RegWrite3, Clk, ReadData1, ReadData2,X,Y,diff);
    SignExtension a2(Instruction1[15:0], SignExtension_out);
    ZeroExtension a4(Instruction1[15:0], ZeroExtension_out);
    Controller a3(Instruction1,Instruction1[31:26],Instruction1[5:0],newmux0, RegDst0,Branch0, MemRead0, MemtoReg0, ALUOp0, MemWrite0, ALUSrc0,RegWrite0,PCSrc0,Zero_or_Sign_signal0,J_JR_Branch_signal0,loadhalf0,loadbyte0,storehalf0,storebyte0,loadupperi0);
    HazardDetection a5(Instruction1[25:21], Instruction1[20:16],IDEXrt,MemRead0,IDEXMemRead,ControlMux,PCWrite,IFIDWrite ,EXMEMRD, MemWrite0,storehalf0,storebyte0,EXMEMREAD);
    ControllerMux a6(Instruction1,instructionoutcontrol,ControlMux, newmux0, RegDst0,Branch0, MemRead0, MemtoReg0, ALUOp0, MemWrite0, ALUSrc0,RegWrite0,PCSrc0,Zero_or_Sign_signal0,J_JR_Branch_signal0,loadhalf0,loadbyte0,storehalf0,storebyte0,loadupperi0, newmux, RegDst,Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc,RegWrite,PCSrc,Zero_or_Sign_signal,J_JR_Branch_signal,loadhalf,loadbyte,storehalf,storebyte,loadupperi,ControlMuxsignal);
 //  Branch_Forwarding a7(J_JR_Branch_signal_2,Instruction1[15:11],EXMEMRD,Instruction1[31:26],EXMEMRegWrite,BrachMux_signal);
    //Branch_Mux a8(BrachMux_signal,ALUResult_out,ReadData1,Branch_Mux_out);
endmodule