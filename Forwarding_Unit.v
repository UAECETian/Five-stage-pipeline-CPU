`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2018 01:24:20 PM
// Design Name: 
// Module Name: Forwarding_Unit
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


module Forwarding_Unit(Aluopcode,IDEX_Rs,IDEX_Rt,EXMEMRd,MEMWBRd,EXMEMRegWrite,MEMWBRegWrite,ForwardA,ForwardB);
    input [4:0] IDEX_Rs,IDEX_Rt,EXMEMRd,MEMWBRd;
    input EXMEMRegWrite,MEMWBRegWrite;    
    output reg [1:0] ForwardA,ForwardB;
  
    input [5:0]Aluopcode;
    always@(Aluopcode,IDEX_Rs,IDEX_Rt,EXMEMRd,MEMWBRd,EXMEMRegWrite,MEMWBRegWrite)begin
        ForwardA<=2'b00;
        ForwardB<=2'b00;
        
                 
        //flag = 0
     //  if(Aluopcode==6'b101000&&EXMEMRegWrite==1&& IDEX_Rs==EXMEMRd && EXMEMRd!=0) begin 
                        //   ForwardA<=2'b10;
                      //  end
         
            
                if(EXMEMRegWrite==1&& IDEX_Rs==EXMEMRd && EXMEMRd!=0) begin 
                    ForwardA<=2'b10;
                end
                
              
                if (EXMEMRegWrite==1&& IDEX_Rt==EXMEMRd && EXMEMRd!=0)begin //IDEXRdst==1&&
                    ForwardB<=2'b10;                      
                end
                if (MEMWBRegWrite==1 && IDEX_Rs==MEMWBRd && MEMWBRd!=0&&!(EXMEMRegWrite==1&& IDEX_Rs==EXMEMRd && EXMEMRd!=0))begin
                    ForwardA<=2'b01;
                end
               // if (IDEXRdst==0&&MEMWBRegWrite==1 && IDEX_Rt==MEMWBRd && MEMWBRd!=0&&!(EXMEMRegWrite==1&& IDEX_Rt==EXMEMRd && EXMEMRd!=0)) begin///
                 //   ForwardB<=2'b00;
             //   end
                
         //  else 
             if (MEMWBRegWrite==1 && IDEX_Rt==MEMWBRd && MEMWBRd!=0&&!(EXMEMRegWrite==1&& IDEX_Rt==EXMEMRd && EXMEMRd!=0)) begin
                           ForwardB<=2'b01;
                       end
             
                  
            
       /*     if (Aluopcode==6'b110011||Aluopcode==6'b100110||Aluopcode==6'b101010 || Aluopcode==6'b101001||Aluopcode== 6'b101000 || Aluopcode==6'b100111||Aluopcode==6'b100101) begin
                                      if (EXMEMRd == IDEX_Rs && EXMEMRegWrite==1 &&EXMEMRd!=0) begin
                                          ForwardA <= 2'b10;
                                      end
                                      if (EXMEMRd == IDEX_Rt && EXMEMRegWrite==1 &&EXMEMRd!=0) begin
                                      
                                          ForwardB <= 2'b10;
                                         end 
                          if (MEMWBRegWrite==1 && IDEX_Rs==MEMWBRd && MEMWBRd!=0&&!(EXMEMRegWrite==1&& IDEX_Rs==EXMEMRd && EXMEMRd!=0))begin
                                   ForwardA <= 2'b01;
                              end
                              
                            if (MEMWBRegWrite==1 && IDEX_Rt==MEMWBRd && MEMWBRd!=0&&!(EXMEMRegWrite==1&& IDEX_Rt==EXMEMRd && EXMEMRd!=0))begin
                                                               ForwardB <= 2'b01;
                                                          end    
end
                 */            
    end
endmodule
