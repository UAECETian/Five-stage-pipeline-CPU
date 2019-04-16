`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2018 11:53:50 AM
// Design Name: 
// Module Name: ForwardB_Mux
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



module ForwardB_Mux(ForwardB_out,BottomMux_out,ALUResult_out,WriteData,ForwardB_signal);

    output reg [31:0] ForwardB_out;  
    input [31:0] BottomMux_out,ALUResult_out,WriteData;
    input[1:0] ForwardB_signal;

  
    always@(BottomMux_out,ALUResult_out,WriteData,ForwardB_signal) begin
        if(ForwardB_signal==2'b00) begin
            ForwardB_out<=BottomMux_out;
        end
        
        else if (ForwardB_signal==2'b10) begin
            ForwardB_out<=ALUResult_out; //EX Mem.Rd
        end
        else if (ForwardB_signal==2'b01) begin
            ForwardB_out<=WriteData; //MEM Wb.Rd
        end
        
    end
endmodule
