`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2018 03:53:53 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb( );
reg Clk,Reset,Reset_1;
//wire [31:0] Instruction;
wire [6:0] out7; 
wire [7:0] en_out;

top a1(Clk,Reset,Reset_1, out7, en_out);

always begin
Clk <= 0;
#100;
Clk <= 1;
#100;
end

initial begin

Reset <= 1;
@(posedge Clk);
#10 Reset <= 0;
Reset_1 <= 1;
@(posedge Clk);
#250 Reset_1 <= 0;



end

endmodule
