`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2018 10:50:12 AM
// Design Name: 
// Module Name: J_JR_Branch_MUX
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


module J_JR_Branch_MUX(AddResult,JRAddress,JumpAddress,J_JR_Branch_signal_1,NextAddress);
    input [31:0] AddResult,JRAddress,JumpAddress;
    input [1:0] J_JR_Branch_signal_1;
    output reg [31:0] NextAddress;
    
    always@(AddResult,JRAddress,JumpAddress,J_JR_Branch_signal_1) begin
        if (J_JR_Branch_signal_1==2'b00) begin
            NextAddress<=JRAddress;
        end
        else if(J_JR_Branch_signal_1==2'b01) begin
            NextAddress<=JumpAddress;
        end
        else if(J_JR_Branch_signal_1==2'b10) begin
            NextAddress<=AddResult;
        end
    end

endmodule
