`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2018 07:57:12 PM
// Design Name: 
// Module Name: BotMux
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

module BotMux(BotMux_out, inA, inB, sel);

    output reg [31:0] BotMux_out;
    
    input [31:0] inA;
    input [31:0] inB;
    input sel;

    /* Fill in the implementation here ... */ 
    always@(sel,inA,inB) begin
        if (sel==0) begin
            BotMux_out<=inA;
        end
        else if (sel==1) begin
            BotMux_out<=inB;
        end
    end
endmodule



/*
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2018 07:57:12 PM
// Design Name: 
// Module Name: BotMux
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


module BotMux(out,ReadData2_out,SignExtension_out,ALUResult_out,WriteData,ALUSrc1,ForwardB_signal);

    output reg [31:0] out;
    
    input [31:0] ReadData2_out,ALUResult_out,SignExtension_out,WriteData;
    input ALUSrc1;
    input[1:0] ForwardB_signal;

  
    always@(ReadData2_out,SignExtension_out,ALUResult_out,WriteData,ALUSrc1,ForwardB_signal) begin
        if(ForwardB_signal==2'b00) begin
            if(ALUSrc1==1) begin
                out<=ReadData2_out; //Rs
            end
            else if (ALUSrc1==0) begin
                out<=SignExtension_out; //Signextension
            end
        end
        
        else if (ForwardB_signal==2'b10) begin
            out<=ALUResult_out; //EX Mem.Rd
        end
        else if (ForwardB_signal==2'b01) begin
            out<=WriteData; //MEM Wb.Rd
        end
        
    end
endmodule

*/