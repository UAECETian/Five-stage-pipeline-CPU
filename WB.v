`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2018 03:17:44 PM
// Design Name: 
// Module Name: WB
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


module WB(PCAddResult4,ReadData_out,ALUResult_out2,MemtoReg3,WriteData);
    input [31:0]ReadData_out,ALUResult_out2,PCAddResult4;
    input [1:0]MemtoReg3;
    output [31:0] WriteData;
    
    
    WBMux m1(PCAddResult4,WriteData, ReadData_out, ALUResult_out2, MemtoReg3);
    
endmodule
