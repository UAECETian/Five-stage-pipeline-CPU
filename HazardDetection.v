`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2018 01:17:57 PM
// Design Name: 
// Module Name: HazardDetection
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


module HazardDetection(IFIDRs,IFIDRt,IDEXRt,IFIDMemRead,IDEXMemRead,ControlMux,PCWrite,IFIDWrite,EXMEMRD,IFIDMEMWrite,IFIDstorehalf,IFIDstorebyte,EXMEMREAD);
 input [4:0]IFIDRs,IFIDRt,IDEXRt,EXMEMRD;
    input IDEXMemRead,IFIDMEMWrite,IFIDstorehalf,IFIDstorebyte,EXMEMREAD,IFIDMemRead;
    output reg ControlMux,PCWrite,IFIDWrite;
    always@(IDEXMemRead,IFIDRs,IFIDRt,IDEXRt,EXMEMRD,IFIDMEMWrite,IFIDstorehalf,IFIDstorebyte,EXMEMREAD,IFIDMemRead)begin
    if((IDEXMemRead==1)&&((IDEXRt==IFIDRs)||((IDEXRt==IFIDRt)&&IFIDMemRead==0)))begin/////////the same rt will stall
          PCWrite <=0;
          ControlMux<=0;
          IFIDWrite<=0;
          
      end
   else if((IFIDMEMWrite==1||IFIDstorehalf==1||IFIDstorebyte==1)&&((EXMEMRD==IFIDRs)||(EXMEMRD==IFIDRt))&&EXMEMREAD==1)begin
                PCWrite <=0;
                ControlMux<=0;
                IFIDWrite<=0;
                
            end
            
      else begin
            PCWrite <=1;
            ControlMux<=1;
            IFIDWrite<=1;
      end
      end    
         
         
endmodule
