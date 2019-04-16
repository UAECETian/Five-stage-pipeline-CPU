`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2018 12:48:58 PM
// Design Name: 
// Module Name: Mux4bits_2to1
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


module Mux4bits_2to1(out, inA, inB, sel);

    output reg [4:0] out;
    
    input [4:0] inA;
    input [4:0] inB;
    input [1:0]sel;

    /* Fill in the implementation here ... */ 
    always@(sel,inA,inB) begin
        if (sel==0) begin
            out<=inA;
        end
        else if (sel==1) begin
            out<=inB;
        end
        else if(sel==2'b10) begin
            out<=5'd31;
        end
        
    end
endmodule
