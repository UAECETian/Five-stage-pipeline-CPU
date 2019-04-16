`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2018 03:35:38 PM
// Design Name: 
// Module Name: ZeroExtension
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


module ZeroExtension(ZeroExtension_in, ZeroExtension_out1);
    input [15:0] ZeroExtension_in;
    output reg [31:0] ZeroExtension_out1;
    
    always @(ZeroExtension_in) begin
    
        ZeroExtension_out1<={16'b0,ZeroExtension_in};
        
    end
   
endmodule
