`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2018 02:00:35 PM
// Design Name: 
// Module Name: AddResult
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


module AddResult(ExtentionResult,PCAddResult,AddResult);
    input [31:0] ExtentionResult;
    input [31:0] PCAddResult;
    output reg [31:0] AddResult;
    
    always@(ExtentionResult,PCAddResult) begin
        AddResult<=PCAddResult+ExtentionResult*4;
    end
    
endmodule
