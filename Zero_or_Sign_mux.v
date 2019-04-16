`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2018 03:30:30 PM
// Design Name: 
// Module Name: Zero_or_Sign_mux
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


module Zero_or_Sign_mux(SignExtension_out2,ZeroExtension_out2,ExtensionResult,Zero_or_Sign_signal_1);
    input [31:0] SignExtension_out2,ZeroExtension_out2;
    input Zero_or_Sign_signal_1;
    output reg [31:0] ExtensionResult;
    
    always@ (SignExtension_out2,ZeroExtension_out2,Zero_or_Sign_signal_1) begin
        if (Zero_or_Sign_signal_1==0) begin
            ExtensionResult<=SignExtension_out2;
        end
        
        else begin 
            ExtensionResult<=ZeroExtension_out2;
        end
        
    
    end
endmodule
