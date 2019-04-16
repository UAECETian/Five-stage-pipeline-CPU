`timescale 1ns / 1ps
///////////tian%50  weishi%50
////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
//TopModule.v
////////////////////////////////////////////////////////////////////////////////
///////////Tian Yang 50%  Guoshi Wei50%
/////////// 5 pipeline
//////////  Branch in MEM stage
//////////  4 pipeline register

module TopModule(Clk,Reset,PCResult,WriteData);
//, hiout, loout
    input  Clk,Reset;
  //  wire [31:0] PCAddResult,Instruction; 
    wire [31:0] PCAddResult1,Instruction1;
    wire [4:0] WriteRegister;
   output wire [31:0] WriteData;
    wire [5:0] ALUOp_in;
    wire [31:0] ReadData1_in,ReadData2_in,SignExtension_in;
    wire [5:0]ALUOp_out;
    wire [31:0]PCAddResult_out,ReadData1_out,ReadData2_out,SignExtension_out;
    wire [4:0]Instruction20_16_out,Instruction15_11_out;
    wire [31:0] AddResult_in;
    wire Zero_in,Zero_out,ControlMuxsignal;
    wire [31:0] ALUResult_in;
    wire [4:0]Instr_in;
    wire [31:0] AddResult_out;
    wire [31:0] IDEXinstruction;
   output wire [31:0] PCResult;
     wire [31:0]X,Y,diff; ////////////sdsdsds////////
    wire [31:0] Instruction;  //////changed
    wire  RegWrite, ALUSrc, MemRead,MemWrite,PCSrc,Branch,newmux,loadhalf,loadbyte,storehalf,storebyte;
    wire [31:0]ReadData1,ReadData2,SignExtension_out1,ReadData2_out2;
    wire [5:0]ALUOp,ALUOp1;
    //
    wire [4:0] Instruction20_16,Instruction15_11;
    wire  ControlMux, RegWrite1, ALUSrc1, MemRead1,MemWrite1,PCSrc1,Branch1,newmux1;
    wire [31:0]PCAddResult2;
    wire [31:0]SignExtension_out2,ReadData_out,ALUResult_out2,ZeroExtension_out1,ZeroExtension_out2;
     wire [31:0] ALUResult_out,ExtensionResult,Instruction2,Instruction3;
    wire [4:0] EXRTorRD,EXMEMRTorRd,MEMWBRTorRd;
    wire [1:0] RegDst,J_JR_Branch_signal_1;
    wire [31:0] ReadData,ReadData2_out1,NextAddress,NextAddress1;
    wire Zero_or_Sign_signal_1,loadhalf1,loadbyte1,storehalf1,storebyte1,loadupperi1,loadhalf2,loadbyte2,storehalf2,storebyte2,loadupperi2,Zero_or_Sign_signal;
    wire PCWrite,IFIDWrite;
    wire RegWrite2,MemRead2,MemWrite2,PCSrc2,PCSrc3,RegWrite3,loadupperi;
    wire [1:0] RegDst1,MemtoReg,MemtoReg1,MemtoReg2, MemtoReg3;
     wire [31:0] Hiout,Loout;
    wire [31:0] PCAddResult3,PCAddResult4;
    wire [1:0] J_JR_Branch_signal,J_JR_Branch_signal_2;
    wire [31:0] PCAddResult,EXMEMinstruction;
    wire [31:0] Branch_Mux_out,outputvalue,instructionoutcontrol;
    InstructionFetchUnit i1(J_JR_Branch_signal,Branch_Mux_out,PCWrite,Instruction,PCResult,PCAddResult, Reset, Clk,NextAddress1,PCSrc3);
    IFIDRegister i2(PCSrc3,IFIDWrite,PCAddResult,Instruction,Clk,Reset,PCAddResult1,Instruction1,Instruction1,PCAddResult1);  
    ID i3(instructionoutcontrol,IDEXinstruction[20:16],J_JR_Branch_signal_2,Branch_Mux_out,NextAddress1,RegWrite2,Instruction1, RegWrite3, MEMWBRTorRd, WriteData,RegDst, RegWrite, ALUSrc, MemRead,MemWrite,MemtoReg,PCSrc,Branch,newmux,ReadData1,ReadData2,SignExtension_out1,ZeroExtension_out1,ALUOp, Clk,Reset,Zero_or_Sign_signal,J_JR_Branch_signal,loadhalf,loadbyte,storehalf,storebyte,loadupperi,MemRead1,PCWrite,IFIDWrite,ControlMuxsignal,EXMEMRTorRd,MemRead2,X,Y,diff);
	IDEXRegister i4(instructionoutcontrol,IDEXinstruction,PCSrc3,J_JR_Branch_signal_2,ControlMuxsignal,RegDst, RegWrite, ALUSrc, MemRead,MemWrite,MemtoReg,PCSrc,Branch,newmux,ALUOp,PCAddResult1,ReadData1,ReadData2,SignExtension_out1,ZeroExtension_out1,Clk,Reset, RegDst1, RegWrite1, ALUSrc1, MemRead1,MemWrite1,MemtoReg1,PCSrc1,Branch1,newmux1,ALUOp1,PCAddResult2,ReadData1_out,ReadData2_out,SignExtension_out2,ZeroExtension_out2,Zero_or_Sign_signal,J_JR_Branch_signal,loadhalf,loadbyte,storehalf,storebyte,loadupperi,Zero_or_Sign_signal_1,J_JR_Branch_signal_1,loadhalf1,loadbyte1,storehalf1,storebyte1,loadupperi1);
    EX i5(EXMEMRTorRd,MEMWBRTorRd,IDEXinstruction,RegWrite2,RegWrite3,ALUResult_out,WriteData,J_JR_Branch_signal_1,RegDst1, RegWrite1, ALUSrc1, MemRead1,MemWrite1,MemtoReg1,Branch1,newmux1,ALUOp1,PCAddResult2,ReadData1_out,ReadData2_out,SignExtension_out2,Zero_in,ALUResult_in,Clk,Hiout,Loout,ZeroExtension_out2,ExtensionResult,Zero_or_Sign_signal_1,NextAddress,outputvalue,EXRTorRD);
    EXMEMRegister i6(IDEXinstruction,EXMEMinstruction,PCSrc3,J_JR_Branch_signal_1,J_JR_Branch_signal_2,PCAddResult2,PCAddResult3,loadhalf1,loadbyte1,storehalf1,storebyte1,loadupperi1,RegWrite1,MemtoReg1,MemRead1,MemWrite1,PCSrc1,AddResult_in,Zero_in,ALUResult_in,outputvalue,Clk,Reset,RegWrite2,MemtoReg2,MemRead2,MemWrite2,PCSrc2,AddResult_out,Zero_out,ALUResult_out,ReadData2_out1,loadhalf2,loadbyte2,storehalf2,storebyte2,loadupperi2,NextAddress,NextAddress1,EXRTorRD,EXMEMRTorRd);
    MEM i7(MemRead2,MemWrite2,PCSrc2,Zero_out,ALUResult_out,ReadData2_out1,PCSrc3,ReadData,Clk,loadhalf2,loadbyte2,storehalf2,storebyte2,loadupperi2,EXMEMinstruction);
    MEMWBRegister i8(PCAddResult3,PCAddResult4,RegWrite2,MemtoReg2,ReadData,ALUResult_out,EXMEMRTorRd,Clk,Reset,MEMWBRTorRd,RegWrite3,MemtoReg3,ReadData_out,ALUResult_out2);
    WB i9(PCAddResult4,ReadData_out,ALUResult_out2,MemtoReg3,WriteData);
endmodule

