`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2018 11:29:16 PM
// Design Name: 
// Module Name: Branch_Mux
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


module Branch_Mux(BrachMux_signal,ALUResult_out,ReadData1,Branch_Mux_out);
    input BrachMux_signal;
    input [31:0] ALUResult_out,ReadData1;
    output reg Branch_Mux_out;
    
    always@(BrachMux_signal,ALUResult_out,ReadData1) begin
        if(BrachMux_signal==1) begin
            Branch_Mux_out<=ALUResult_out;
        end
        else begin
            Branch_Mux_out<=ReadData1;
        end
    
    end

endmodule
