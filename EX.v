`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2018 01:06:29 PM
// Design Name: 
// Module Name: EX
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


module EX( EXMEMRd,MEMWBRd,IDEXinstruction,EXMEMRegWrite,MEMWBRegWrite,ALUResult_out,WriteData,J_JR_Branch_signal_1,RegDst1, RegWrite1, ALUSrc1, MemRead1,MemWrite1,MemtoReg1,Branch1,newmux1,ALUOp1,PCAddResult2,ReadData1_out,ReadData2_out,SignExtension_out2,Zero_in,ALUResult_in,Clk,Hiout,Loout,ZeroExtension_out2,ExtensionResult,Zero_or_Sign_signal_1,NextAddress,ForwardB_out,EXRTorRD);
    input  RegWrite1, ALUSrc1, MemRead1,MemWrite1,Branch1,newmux1;
    input [5:0] ALUOp1;
    
    input EXMEMRegWrite,MEMWBRegWrite;
    input [31:0] PCAddResult2,ReadData1_out,ReadData2_out,SignExtension_out2,ZeroExtension_out2,IDEXinstruction;
    input Clk,Zero_or_Sign_signal_1;
   input [4:0] EXMEMRd,MEMWBRd;
    input [1:0] RegDst1,MemtoReg1,J_JR_Branch_signal_1;
    input [31:0]ALUResult_out,WriteData;
    output  [31:0]ExtensionResult;
    output  Zero_in;
    output  [31:0] ALUResult_in;
    output [4:0] EXRTorRD;
    output [31:0] Hiout,Loout,NextAddress,ForwardB_out;
    wire [31:0]MuxTop,MuxBottom;
    wire [31:0] AddResult,JRAddress,JumpAddress;
    wire [31:0]ForwardA_out;
    wire [1:0] ForwardA_signal,ForwardB_signal;
    wire ForwardC,Forwardsignal;
    
    Zero_or_Sign_mux a0(SignExtension_out2,ZeroExtension_out2,ExtensionResult,Zero_or_Sign_signal_1);
    AddResult a1(ExtensionResult,PCAddResult2,AddResult);
    jr a4(MuxTop,JRAddress);
    jump a5(PCAddResult2,IDEXinstruction[25:0],JumpAddress);
    J_JR_Branch_MUX a6(AddResult,JRAddress,JumpAddress,J_JR_Branch_signal_1,NextAddress);

    TopMux TOP(MuxTop,ForwardA_out,ForwardB_out,newmux1);
    BotMux bottom(MuxBottom,ForwardB_out,ExtensionResult,ALUSrc1);
    
    Forwarding_Unit B1(ALUOp1,IDEXinstruction[25:21],IDEXinstruction[20:16],EXMEMRd,MEMWBRd,EXMEMRegWrite,MEMWBRegWrite,ForwardA_signal,ForwardB_signal);
    ForwardA_Mux B2(ForwardA_out,ReadData1_out,ALUResult_out,WriteData, ForwardA_signal);
    ForwardB_Mux B3(ForwardB_out,ReadData2_out,ALUResult_out,WriteData,ForwardB_signal);
   // DataMWriteMux B4(outputvalue,ForwardB_out,ALUResult_out,Forwardsignal);
    
    ALU32Bit a2( ALUOp1, MuxTop, MuxBottom, ALUResult_in, Zero_in,Clk,Hiout,Loout);
       
    Mux4bits_2to1 a3(EXRTorRD,IDEXinstruction[20:16],IDEXinstruction[15:11],RegDst1);   
   // RdRtMux a4(IDEXRd,IDEXRt,sel,RdRtoutput);
endmodule
