`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// /tian%50  weishi%50
// Create Date: 10/13/2018 01:59:26 AM
// Design Name: 
// Module Name: TopModule_tb
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


module TopModule_tb( );
reg Clk_t,Reset_t;

wire [31:0] pcaddresult_t,writedata;
TopModule m1(Clk_t,Reset_t,pcaddresult_t,writedata);


/*initial begin

Clk_t <= 1'b0;

forever #5 Clk_t <= ~Clk_t;

end*/

always begin
Clk_t <= 0;
#10;

Clk_t <= 1;
#10;
end

initial begin

Reset_t <= 1;
@(posedge Clk_t);
#10 Reset_t <= 0;





end


endmodule
