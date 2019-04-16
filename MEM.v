`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2018 02:05:59 PM
// Design Name: 
// Module Name: MEM
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


module MEM (MemRead2,MemWrite2,PCSrc2,Zero_out,ALUResult_out,ReadData2_out1,PCSrc3,ReadData,Clk,loadhalf2,loadbyte2,storehalf2,storebyte2,loadupperi2,Instruction3);
    input MemRead2,MemWrite2,PCSrc2,Zero_out, Clk,loadhalf2,loadbyte2,storehalf2,storebyte2,loadupperi2;
    input [31:0] ALUResult_out,ReadData2_out1;
    input [31:0] Instruction3;
    output  PCSrc3;
    output [31:0] ReadData;
    
    Branch a1(PCSrc2,Zero_out,PCSrc3);
    DataMemory d2(ALUResult_out, ReadData2_out1, Clk, MemWrite2, MemRead2, loadhalf2,loadbyte2,storehalf2,storebyte2,loadupperi2, ReadData,Instruction3[15:0]); 
   
endmodule
