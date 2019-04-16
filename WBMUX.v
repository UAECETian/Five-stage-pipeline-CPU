`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2018 01:02:10 AM
// Design Name: 
// Module Name: WBMUX
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

module WBMux(PCAddResult4,out2, inA2, inB2, sel2);

    output reg [31:0] out2;
    
    input [31:0] inA2;
    input [31:0] inB2,PCAddResult4;
    input [1:0] sel2;

    /* Fill in the implementation here ... */ 
    always@(sel2,inA2,inB2,PCAddResult4) begin
        if (sel2==2'b00) begin
            out2<=inA2;
        end
        else if (sel2==2'b01) begin
            out2<=inB2;
        end
        else if(sel2==2'b10) begin
            out2<=PCAddResult4;
        end
    end
endmodule

