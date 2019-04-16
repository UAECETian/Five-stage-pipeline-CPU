`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2018 10:19:20 AM
// Design Name: 
// Module Name: jump
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


module jump(PCAddResult2,Instruction_25_0,Address);
    input [25:0] Instruction_25_0;
    input [31:0] PCAddResult2;
    output reg [31:0] Address;
    
    always@(PCAddResult2,Instruction_25_0) begin 
        Address<={PCAddResult2[31:28],Instruction_25_0<<2};
    
    end

endmodule
