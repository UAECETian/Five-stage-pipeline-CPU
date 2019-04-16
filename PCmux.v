`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2018 09:54:55 AM
// Design Name: 
// Module Name: PCmux
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


module PCmux(J_JR_Branch_signal,PCAddResult2,NextAddress1,PCSrc3,PC_address,Branch_Mux_out);
    input [31:0]PCAddResult2,NextAddress1,Branch_Mux_out;
    input PCSrc3;
    input [1:0] J_JR_Branch_signal;
    output reg [31:0] PC_address;
    
    always @(J_JR_Branch_signal,PCAddResult2,NextAddress1,PCSrc3,Branch_Mux_out) begin
        if(PCSrc3==0) begin
            PC_address<=PCAddResult2;
        end
        else if (PCSrc3==1) begin
           PC_address<=NextAddress1;
        end
      
        
        
    end
endmodule
