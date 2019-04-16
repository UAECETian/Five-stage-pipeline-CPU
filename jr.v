`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2018 10:25:37 AM
// Design Name: 
// Module Name: jr
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


module jr(ReadData1_out,Address);
    input [31:0] ReadData1_out;
    output reg [31:0] Address;
    always@(ReadData1_out) begin
        Address<=ReadData1_out;
    end
endmodule
