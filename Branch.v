`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2018 02:16:52 PM
// Design Name: 
// Module Name: Branch
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


module Branch(PCSrc2,Zero_out,PCSrc3);
    input PCSrc2,Zero_out;
    output reg PCSrc3;
    
    always@(PCSrc2,Zero_out) begin
        if(PCSrc2==1&&Zero_out==1)begin
        PCSrc3<=1;
        end
        else begin
         PCSrc3<=0;
    end
    end
    
    

endmodule
