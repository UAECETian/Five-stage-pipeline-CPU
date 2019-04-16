`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2018 11:32:44 PM
// Design Name: 
// Module Name: DataMWriteMux
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


module DataMWriteMux(outputvalue,ReadData,Aluresult,selection);


    output reg [31:0] outputvalue;
    
    
    input [31:0] ReadData,Aluresult;
    input  selection;

    /* Fill in the implementation here ... */ 
    always@(ReadData,Aluresult,selection) begin
        if (selection==0) begin
            outputvalue<=Aluresult;
        end
       
        else  begin
              outputvalue<=ReadData;
        end
    end
endmodule
