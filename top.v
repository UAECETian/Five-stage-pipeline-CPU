`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2018 03:02:21 PM
// Design Name: 
// Module Name: top
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


module top(Clk,Reset,Reset_1, out7, en_out);
 input Clk,Reset,Reset_1;
 output [6:0] out7; 
 output  [7:0] en_out;
wire [31:0] PCResult,diff;// wire [15:0]Instruction1;
 //wire [15:0]Instruction2;
 wire ClkOut;
  wire [31:0] X,Y;
 ClkDiv a1(Clk, Reset, ClkOut);
  TopModule a2(ClkOut,Reset,PCResult,X,Y,diff);
 
// assign Instruction1=Instruction[31:16];
 //assign Instruction2=Instruction[15:0];
 
// Two4DigitDisplay a3(Clk, Instruction1, Instruction2, out7, en_out);
 Two4DigitDisplay a3(Clk,X[15:0],Y[15:0], out7, en_out);
 
  
 
 
endmodule
