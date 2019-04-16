`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - SignExtension.v
// Description - Sign extension module.
////////////////////////////////////////////////////////////////////////////////
module SignExtension(SignExtension_in, SignExtension_out1);

    input [15:0] SignExtension_in;
   output reg [31:0] SignExtension_out1;
    
    /* Fill in the implementation here ... */
   always@(SignExtension_in) begin
    if(SignExtension_in[15]==1) begin
       //    SignExtension_out1[15:0]<=SignExtension_in;
           SignExtension_out1<= {16'b1111111111111111,SignExtension_in};
            
       end
        else begin
           
           SignExtension_out1<= {16'b0,SignExtension_in};
        end    
       
   end 
 

endmodule
 