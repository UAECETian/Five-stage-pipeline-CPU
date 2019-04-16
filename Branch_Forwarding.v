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


module Branch_Forwarding(J_JR_Branch_signal_2,IFIDRs,EXMEMRd,IFIDOpcode,EXMEMRegWrite,BrachMux_signal);
    input [4:0]IFIDRs,EXMEMRd;
    input [5:0]IFIDOpcode;
    input EXMEMRegWrite;
    input [1:0] J_JR_Branch_signal_2;
    output reg BrachMux_signal;
   // output reg PCWrite,ControlMux,IFIDWrite;
    
    always@(J_JR_Branch_signal_2,IFIDRs,EXMEMRd,IFIDOpcode,EXMEMRegWrite) begin 
        /*if(IFIDOpcode==6'b000010 && J_JR_Branch_signal_2!==2'b01)begin
                        PCWrite <=0;
                        ControlMux<=0;
                        IFIDWrite<=0;
        end*/
        if(IFIDOpcode==6'b000010 && EXMEMRd==IFIDRs && EXMEMRegWrite==1) begin
            
             BrachMux_signal<=1;
          
        
        end
        
        else begin
            BrachMux_signal<=0;
        end
        
    end
endmodule




















