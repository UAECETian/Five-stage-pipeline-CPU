`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// 
// 
//////////////////////////////////////////////////////////////////////////////////
////ask question:1,newmux

module Controller(Ins,Opcode, Function, newmux, RegDst,Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc,RegWrite,PCSrc,Zero_or_Sign_signal,J_JR_Branch_signal,loadhalf,loadbyte,storehalf,storebyte,loadupperi);
    input [5:0] Opcode,  Function;
    input [31:0] Ins;  ///sddddddddddddddddasdsadas
   

    output reg  RegWrite, ALUSrc, MemRead, MemWrite, PCSrc,Branch,newmux,Zero_or_Sign_signal,loadhalf,loadbyte,storehalf,storebyte,loadupperi;
    output reg [5:0] ALUOp;
    output reg [1:0] RegDst, MemtoReg;
    output reg [1:0] J_JR_Branch_signal;
        always@(*) begin
        
        RegDst <=0; RegWrite <= 0; ALUSrc <= 0; ALUOp <= 6'b000000; MemRead <= 0;
        MemWrite <= 0; MemtoReg <= 0; PCSrc <= 0;newmux<=0; Branch <=0;J_JR_Branch_signal<=2'b00;
        Zero_or_Sign_signal<=0;loadhalf<=0;loadbyte<=0;storehalf<=0;storebyte<=0;loadupperi<=0;
       
                           
      if (Opcode == 6'b000000) begin
         if ( Function == 6'b100000) begin //add
            RegDst <= 1;
            Branch <= 0;
            MemRead <= 0;
            MemtoReg <= 1;
            ALUOp <= 6'b000000;
            MemWrite <= 0;
            ALUSrc <= 0;
            RegWrite <= 1;
            PCSrc <= 0;
         
            newmux<=0; 
            end
            
            
           else if (Function == 6'b001000) begin //  Jr
            RegDst <=0;
            MemRead <= 0;
            MemtoReg <= 0;
            ALUOp <= 6'b110011;
            MemWrite <= 0;
            ALUSrc <= 1;
            RegWrite <= 0;
            newmux<=0;
            PCSrc <= 1;
            J_JR_Branch_signal<=2'b00;
            Zero_or_Sign_signal<=0;loadhalf<=0;loadbyte<=0;storehalf<=0;storebyte<=0;loadupperi<=0;
            end               
            
            
            
            
           else if ( Function == 6'b101011) begin //SLTU
             RegDst <= 1;
             Branch <= 0;
             MemRead <= 0;
             MemtoReg <= 1;
             ALUOp <= 6'b011101;
             MemWrite <= 0;
             ALUSrc <= 0;
             RegWrite <= 1;
             PCSrc <= 0;
            newmux<=0;
             Zero_or_Sign_signal<=1;
             end
             
           else if ( Function == 6'b000111) begin //srav
              RegDst <= 1;
              Branch <= 0;
              MemRead <= 0;
              MemtoReg <= 1;
              ALUOp <= 6'b011010;
              MemWrite <= 0;
              ALUSrc <= 0;
              RegWrite <= 1;
              PCSrc <= 0;
              newmux <=0;
              end
           
            else if ( Function == 6'b010001) begin //MTHI
                RegDst <= 0;
                Branch <= 0;
                MemRead <= 0;
                MemtoReg <= 1;
                ALUOp <= 6'b011110;
                MemWrite <= 0;
                ALUSrc <=1;
                RegWrite <= 0;
                PCSrc <= 0;
                end            
            
           else if ( Function == 6'b010011) begin //MTlo
               RegDst <= 0;
               Branch <= 0;
               MemRead <= 0;
               MemtoReg <= 1;
               ALUOp <= 6'b011111;
               MemWrite <= 0;
               ALUSrc <=1;
               RegWrite <= 0;
               PCSrc <= 0;
               end         
        
            else if ( Function == 6'b010000) begin //MFHI
               RegDst <= 1;
               Branch <= 0;
               MemRead <= 0;
               MemtoReg <= 1;
               ALUOp <= 6'b100000;
               MemWrite <= 0;
               ALUSrc <=0;
               RegWrite <=1;
               PCSrc <= 0;
               end        
        
            else if ( Function == 6'b010010) begin //MFLO
               RegDst <= 1;
               Branch <= 0;
               MemRead <= 0;
               MemtoReg <= 1;
               ALUOp <=6'b100001;
               MemWrite <= 0;
               ALUSrc <=0;
               RegWrite <=1;
               PCSrc <= 0;
               end       
        
            else if ( Function == 6'b100001) begin //addu
               RegDst <= 1;
               Branch <= 0;
               MemRead <= 0;
               MemtoReg <= 1;
               ALUOp <= 6'b100011;
               MemWrite <= 0;
               ALUSrc <= 0;
               RegWrite <= 1;
               PCSrc <= 0;
               end
            
             else if ( Function == 6'b001011) begin //movn
                RegDst <= 1;
                Branch <= 0;
                MemRead <= 0;
                MemtoReg <= 1;
                ALUOp <= 6'b010101;
                MemWrite <= 0;
                ALUSrc <= 0;
                RegWrite <= 1;
                PCSrc <= 0;
                end
            
            
            else if ( Function == 6'b001010) begin //movz
                RegDst <= 1;
                Branch <= 0;
                MemRead <= 0;
                MemtoReg <= 1;
                ALUOp <= 6'b010110;
                MemWrite <= 0;
                ALUSrc <= 0;
                RegWrite <= 1;
                PCSrc <= 0;
                 end
            
            else if ( Function == 6'b100010) begin //sub
                RegDst <= 1;
                Branch <= 0;
                MemRead <= 0;
                MemtoReg <= 1;
                ALUOp <= 6'b000001;
                MemWrite <= 0;
                ALUSrc <= 0;
                RegWrite <= 1;
                PCSrc <= 0;
                newmux <=0;
                end
                
            else if ( Function == 6'b011000) begin //mult
            //flag == 3 -> forwarding
                 RegDst <= 0;
                 Branch <= 0;
                 MemRead <= 0;
                 MemtoReg <= 1;
                 ALUOp <= 6'b000011;
                 MemWrite <= 0;
                 ALUSrc <= 0;
                 RegWrite <= 0;
                 PCSrc <= 0;
                 newmux<=0;
                 end
                        
            else if ( Function == 6'b011001) begin //multu
                 RegDst <= 0;
                 Branch <= 0;
                 MemRead <= 0;
                 MemtoReg <= 1;
                 ALUOp <= 6'b000100;
                 MemWrite <= 0;
                 ALUSrc <= 0;
                 RegWrite <= 0;
                 PCSrc <= 0;
                 newmux<=0;
                 end             
            
            else if ( Function == 6'b100100) begin //and
                  RegDst <= 1;
                  Branch <= 0;
                  MemRead <= 0;
                  MemtoReg <= 1;
                  ALUOp <=64'b000111;
                  MemWrite <= 0;
                  ALUSrc <= 0;
                  RegWrite <= 1;
                  PCSrc <= 0;
                  newmux<=0;
                  end
            
           else if (Function == 6'b100101) begin //or
                   RegDst <= 1;
                   Branch <= 0;
                   MemRead <= 0;
                   MemtoReg <= 1;
                   ALUOp <= 6'b001001;
                   MemWrite <= 0;
                   ALUSrc <= 0;
                   RegWrite <= 1;
                   PCSrc <= 0;
                   end
            
           else if (Function == 6'b100111) begin //nor
                   RegDst <= 1;
                   Branch <= 0;
                   MemRead <= 0;
                   MemtoReg <= 1;
                   ALUOp <= 6'b001010;
                   MemWrite <= 0;
                   ALUSrc <= 0;
                   RegWrite <= 1;
                   PCSrc <= 0;
                   end
                      
                      
           else if (Function == 6'b100110) begin //xor
                    RegDst <= 1;
                    Branch <= 0;
                    MemRead <= 0;
                    MemtoReg <= 1;
                    ALUOp <= 6'b001011;
                    MemWrite <= 0;
                    ALUSrc <= 0;
                    RegWrite <= 1;
                    PCSrc <= 0;
                    end
            
            else if (Function == 6'b101010) begin  //slt
                    RegDst <= 1;
                    Branch <= 0;
                    MemRead <= 0;
                    MemtoReg <= 1;
                    ALUOp <= 6'b010011;
                    MemWrite <= 0;
                    ALUSrc <= 0;
                    RegWrite <= 1;
                    PCSrc <= 0;
                     newmux<=0;
                    end
            
            else if (Function== 6'b000000) begin  //sll
                     RegDst <= 1;
                     Branch <= 0;
                     MemRead <= 0;
                     MemtoReg <= 1;
                     ALUOp <= 6'b001111;
                     MemWrite <= 0;
                     ALUSrc <= 1;
                     RegWrite <= 1;
                     PCSrc <= 0;
                     newmux <= 1;
                     end
                     
             else if ( Function == 6'b000100) begin //sllv
                     RegDst <= 1;
                     Branch <= 0;
                     MemRead <= 0;
                     MemtoReg <= 1;
                     ALUOp <= 6'b010001;
                     MemWrite <= 0;
                     ALUSrc <= 0;
                     RegWrite <= 1;
                     PCSrc <= 0;
                     newmux <=0;
                     end
                       
            
             /*else if ( Function == 6'b000110) begin //srlv
              
                     RegDst <= 1;
                     Branch <= 0;
                     MemRead <= 0;
                     MemtoReg <= 1;
                     ALUOp <= 6'b010010;
                     MemWrite <= 0;
                     ALUSrc <= 0;
                     RegWrite <= 1;
                     PCSrc <= 0;
                     newmux <=0;
                     end
               */        
           
          /*  else if (Function == 6'b000010) begin //srl
                       RegDst <= 1;
                       Branch <= 0;
                       MemRead <= 0;
                       MemtoReg <= 1;
                       ALUOp <= 6'b010000;
                       MemWrite <= 0;
                       ALUSrc <= 1;
                       RegWrite <= 1;
                       PCSrc <= 0;
                       newmux <= 1;
                        end
            */
            else if (Function == 6'b000110) begin  //rotrv  //srlv
                      if(Ins[6]==1)
                      ALUOp <= 6'b010111;
                      else
                       ALUOp <= 6'b010010;
                       RegDst <= 1;
                       Branch <= 0;
                       MemRead <= 0;
                       MemtoReg <= 1;
                       
                       MemWrite <= 0;
                       ALUSrc <= 0;
                       RegWrite <= 1;
                       PCSrc <= 0;
                       newmux<=0; 
                       end
            
            else if (Function == 6'b000010) begin  //rotr  //SRL
                      if(Ins[21]==1)
                      ALUOp<=6'b011000;
                      else
                       ALUOp <= 6'b010000;
                        RegDst <= 1;
                        Branch <= 0;
                        MemRead <= 0;
                        MemtoReg <= 1;
                       
                        MemWrite <= 0;
                        ALUSrc <= 1;
                        RegWrite <= 1;
                        PCSrc <= 0;
                        newmux<=1; 
                        end
            
            
            
            else if (Function == 6'b000011) begin  //sra
                        RegDst <= 1;
                        Branch <= 0;
                        MemRead <= 0;
                        MemtoReg <= 1;
                        ALUOp <= 6'b011001;
                        MemWrite <= 0;
                        ALUSrc <= 1;
                        RegWrite <= 1;
                        PCSrc <= 0;
                        newmux <= 1;                                  
                        end
          
            else begin
                       RegDst <= 0;
                       Branch <= 0;
                       MemRead <= 0;
                       MemtoReg <= 1;
                       ALUOp <= 6'b000000;
                       MemWrite <= 0;
                       ALUSrc <= 0;
                       RegWrite <= 0;
                       PCSrc <= 0;
                       newmux <=0;
                       end
        
            end
        
        
        
        else if (Opcode == 6'b011100) begin
        
            if (Function == 6'b000000) begin //madd
                        
                      RegDst <= 0;
                      Branch <= 0;
                      MemRead <= 0;
                      MemtoReg <= 1;
                      ALUOp <= 6'b000101;
                      MemWrite <= 0;
                      ALUSrc <= 0;
                      RegWrite <= 0;
                      PCSrc <= 0;
                      newmux<=0;
                      end
                        
              else if (Function == 6'b000100) begin //msub
                        RegDst <= 0;
                        Branch <= 0;
                        MemRead <= 0;
                        MemtoReg <= 1;
                        ALUOp <= 6'b000110;
                        MemWrite <= 0;
                        ALUSrc <= 0;
                        RegWrite <= 0;
                        PCSrc <= 0;
                        newmux<=0;
                        end       
             
           else if (Function== 6'b000010) begin //mul
                       RegDst <= 1;
                       Branch <= 0;
                       MemRead <= 0;
                       MemtoReg <= 1;
                       ALUOp <= 6'b000010;
                       MemWrite <= 0;
                       ALUSrc <= 0;
                       RegWrite <= 1;
                       PCSrc <= 0;
                       newmux<=0;
                        end
            
            else begin 
                      RegDst <= 0;
                      Branch <= 0;
                      MemRead <= 0;
                      MemtoReg <= 1;
                      ALUOp <= 6'b000000;
                      MemWrite <= 0;
                      ALUSrc <= 0;
                      RegWrite <= 0;
                      PCSrc <= 0;
                     end
              end
        
        
        else if (Opcode == 6'b001000) begin //addi
                   RegDst <= 0;
                   Branch <= 0;
                   MemRead <= 0;
                   MemtoReg <= 1;
                   ALUOp <= 6'b100100;
                   MemWrite <= 0;
                   ALUSrc <= 1;
                   RegWrite <= 1;
                   PCSrc <= 0;
                   newmux<=0;
                
                   end
         
           else if (Opcode == 6'b001011) begin //sltIU
                     RegDst <= 0;
                     Branch <= 0;
                     MemRead <= 0;
                     MemtoReg <= 1;
                     ALUOp <=6'b011100;
                     MemWrite <= 0;
                     ALUSrc <= 1;
                     RegWrite <= 1;
                     PCSrc <= 0;
                     newmux<=0;
                     end
            
        
        
         else if (Opcode == 6'b001010) begin //slti
                    RegDst <= 0;
                    Branch <= 0;
                    MemRead <= 0;
                    MemtoReg <= 1;
                    ALUOp <= 6'b010100;
                   MemWrite <= 0;
                    ALUSrc <= 1;
                    RegWrite <= 1;
                    PCSrc <= 0;
                    newmux<=0;
                    end
        
        
         else if (Opcode == 6'b001100) begin //andi
                    RegDst <= 0;
                    Branch <= 0;
                    MemRead <= 0;
                    MemtoReg <= 1;
                    ALUOp <= 6'b001000;
                    MemWrite <= 0;
                    ALUSrc <= 1;
                     RegWrite <= 1;
                     PCSrc <= 0;   
                     newmux<=0;
                      Zero_or_Sign_signal<=1;
                     end
               
               
        else if (Opcode == 6'b011111) begin //seh
                   if(Function == 6'b100000 & Ins[9]==0 )begin
                 // if(Ins[9]==0) begin
                     ALUOp <= 6'b011011;
                        RegDst <=1;
                                        Branch <= 0;
                                        MemRead <= 0;
                                        MemtoReg <= 1;
                                     //   ALUOp <= 6'b001110;
                                        MemWrite <= 0;
                                        ALUSrc <= 0;
                                        RegWrite <= 1;
                                        PCSrc <= 0;
                                        newmux<=0;
                  // end
                    end
                     else if(Function == 6'b100000 & Ins[9]==1) begin
                    
                      RegDst <=1;
                      Branch <= 0;
                      MemRead <= 0;
                      MemtoReg <= 1;
                      ALUOp <= 6'b001110;
                      MemWrite <= 0;
                      ALUSrc <= 0;
                      RegWrite <= 1;
                      PCSrc <= 0;
                      newmux<=0;
                      end
                              
                                                   
                 end              
        
       
        
         else if (Opcode == 6'b001001) begin //addiu
                     RegDst <= 0;
                     Branch <= 0;
                     MemRead <= 0;
                     MemtoReg <= 1;
                     ALUOp <= 6'b100010;
                     MemWrite <= 0;
                     ALUSrc <= 1;
                     RegWrite <= 1;
                     PCSrc <= 0;
                     end
        
        else if (Opcode == 6'b001101) begin //ori
                  RegDst <=0;
                   Branch <= 0;
                   MemRead <= 0;
                   MemtoReg <= 1;
                   ALUOp <= 6'b001100;
                   MemWrite <= 0;
                   ALUSrc <= 1;
                   RegWrite <= 1;
                   PCSrc <= 0;
                   newmux<=0;
                    Zero_or_Sign_signal<=1;
                   
                    end 
        
         else if (Opcode == 6'b001110) begin //xori
                    RegDst <=0;
                    Branch <= 0;
                    MemRead <= 0;
                    MemtoReg <= 1;
                    ALUOp <= 6'b001101;
                    MemWrite <= 0;
                    ALUSrc <= 1;
                    RegWrite <= 1;
                    newmux<=0;
                    PCSrc <= 0;
                    end 
        else if (Opcode == 6'b100011) begin //lw
                     RegDst <=0;
                     Branch <= 0;
                     MemRead <= 1;
                     MemtoReg <= 0;
                     ALUOp <= 6'b101011;
                     MemWrite <= 0;
                     ALUSrc <= 1;
                     RegWrite <= 1;
                     newmux<=0;
                     PCSrc <= 0;
                      J_JR_Branch_signal<=2'b11;
                      Zero_or_Sign_signal<=0;loadhalf<=0;loadbyte<=0;storehalf<=0;storebyte<=0;loadupperi<=0;
        
        end 
        else if (Opcode == 6'b100001) begin //lh
                     RegDst <=0;
                     Branch <= 0;
                     MemRead <= 0;
                     MemtoReg <= 0;
                     ALUOp <= 6'b101110;
                     MemWrite <= 0;
                     ALUSrc <= 1;
                     RegWrite <= 1;
                     newmux<=0;
                     PCSrc <= 0;
                      J_JR_Branch_signal<=2'b11;
                      Zero_or_Sign_signal<=0;loadhalf<=1;loadbyte<=0;storehalf<=0;storebyte<=0;loadupperi<=0;
        
        end 

        else if (Opcode == 6'b100000) begin //lb
                     RegDst <=0;
                     Branch <= 0;
                     MemRead <= 0;
                     MemtoReg <= 0;
                     ALUOp <= 6'b101111;
                     MemWrite <= 0;
                     ALUSrc <= 1;
                     RegWrite <= 1;
                     newmux<=0;
                     PCSrc <= 0;
                     J_JR_Branch_signal<=2'b11;
                     Zero_or_Sign_signal<=0;loadhalf<=0;loadbyte<=1;storehalf<=0;storebyte<=0;loadupperi<=0;
        
        end         
 
 
                else if (Opcode == 6'b101011) begin //sw
                             RegDst <=0;
                             Branch <= 0;
                             MemRead <= 0;
                             MemtoReg <= 0;
                             ALUOp <= 6'b101100;
                             MemWrite <= 1;
                             ALUSrc <= 1;
                             RegWrite <= 0;
                             newmux<=0;
                             PCSrc <= 0;
                             J_JR_Branch_signal<=2'b11;
                             Zero_or_Sign_signal<=0;loadhalf<=0;loadbyte<=0;storehalf<=0;storebyte<=0;loadupperi<=0;
                
                end      
                else if (Opcode == 6'b101000) begin //sb
                             RegDst <=0;
                             Branch <= 0;
                             MemRead <= 0;
                             MemtoReg <= 0;
                             ALUOp <= 6'b101101;
                             MemWrite <= 0;
                             ALUSrc <= 1;
                             RegWrite <= 0;
                             newmux<=0;
                             PCSrc <= 0;
                             J_JR_Branch_signal<=2'b11;
                             Zero_or_Sign_signal<=0;loadhalf<=0;loadbyte<=0;storehalf<=0;storebyte<=1;loadupperi<=0;
                
                end  
                else if (Opcode == 6'b101001) begin //sh
                             RegDst <=0;
                             Branch <= 0;
                             MemRead <= 0;
                             MemtoReg <= 0;
                             ALUOp <= 6'b110000;
                             MemWrite <= 0;
                             ALUSrc <= 1;
                             RegWrite <= 0;
                             newmux<=0;
                             PCSrc <= 0;
                             J_JR_Branch_signal<=2'b11;
                             Zero_or_Sign_signal<=0;loadhalf<=0;loadbyte<=0;storehalf<=1;storebyte<=0;loadupperi<=0;
                
                end  
        else if (Opcode == 6'b001111) begin //lui
                             RegDst <=0;
                             Branch <= 0;
                             MemRead <= 0;
                             MemtoReg <= 0;
                             ALUOp <= 6'b110001;
                             MemWrite <= 0;
                             ALUSrc <= 1;
                             RegWrite <= 1;
                             newmux<=0;
                             PCSrc <= 0;
                             J_JR_Branch_signal<=2'b11;
                             Zero_or_Sign_signal<=0;loadhalf<=0;loadbyte<=0;storehalf<=0;storebyte<=0;loadupperi<=1;
                
                end                         

        else if (Opcode == 6'b000001) begin //bgez  OR BLTZ
             if(Ins[16]==1)
              ALUOp <= 6'b100101;
              else if(Ins[16]==0)
              ALUOp <= 6'b101010;
                RegDst <=0;
                MemRead <= 0;
                MemtoReg <= 0;
                MemWrite <= 0;
                ALUSrc <= 1;
                RegWrite <= 0;
                newmux<=0;
                PCSrc <= 1;
                J_JR_Branch_signal<=2'b10;
                Zero_or_Sign_signal<=0;loadhalf<=0;loadbyte<=0;storehalf<=0;storebyte<=0;loadupperi<=0;
                
        end  
         
        else if (Opcode == 6'b000100) begin //BEQ
                RegDst <=0;
                MemRead <= 0;
                MemtoReg <= 0;
                ALUOp <= 6'b100110;
                MemWrite <= 0;
                ALUSrc <= 0;
                RegWrite <= 0;
                newmux<=0;
                PCSrc <= 1;
                J_JR_Branch_signal<=2'b10;
                Zero_or_Sign_signal<=0;loadhalf<=0;loadbyte<=0;storehalf<=0;storebyte<=0;loadupperi<=0;
                
        end 
        
        else if (Opcode == 6'b000101) begin //BNE
                RegDst <=0;
                MemRead <= 0;
                MemtoReg <= 0;
                ALUOp <= 6'b100111;
                MemWrite <= 0;
                ALUSrc <= 0;
                RegWrite <= 0;
                newmux<=0;
                PCSrc <= 1;
                J_JR_Branch_signal<=2'b10;
                Zero_or_Sign_signal<=0;loadhalf<=0;loadbyte<=0;storehalf<=0;storebyte<=0;loadupperi<=0;
                
        end 
 
         else if (Opcode == 6'b000111) begin //BGTZ
                RegDst <=0;
                MemRead <= 0;
                MemtoReg <= 0;
                ALUOp <= 6'b101000;
                MemWrite <= 0;
                ALUSrc <= 1;
                RegWrite <= 0;
                newmux<=0;
                PCSrc <= 1;
                J_JR_Branch_signal<=2'b10;
                Zero_or_Sign_signal<=0;loadhalf<=0;loadbyte<=0;storehalf<=0;storebyte<=0;loadupperi<=0;
                
        end 
        
        else if (Opcode == 6'b000110) begin //BLEZ  
                  RegDst <=0;
                  MemRead <= 0;
                  MemtoReg <= 0;
                  ALUOp <= 6'b101001;
                  MemWrite <= 0;
                  ALUSrc <= 1;
                  RegWrite <= 0;
                  newmux<=0;
                  PCSrc <= 1;
                  J_JR_Branch_signal<=2'b10;
                  Zero_or_Sign_signal<=0;loadhalf<=0;loadbyte<=0;storehalf<=0;storebyte<=0;loadupperi<=0;
                       
               end        
        
        else if (Opcode == 6'b000010) begin //  J
                 RegDst <=0;
                 MemRead <= 0;
                 MemtoReg <= 0;
                 ALUOp <= 6'b110010;
                 MemWrite <= 0;
                 ALUSrc <= 1;
                 RegWrite <= 0;
                 newmux<=0;
                 PCSrc <= 1;
                 J_JR_Branch_signal<=2'b01;
                 Zero_or_Sign_signal<=0;loadhalf<=0;loadbyte<=0;storehalf<=0;storebyte<=0;loadupperi<=0;
                 end                
         
        else if (Opcode == 6'b000011) begin //  Jal
                 RegDst <=2'b10;
                 MemRead <= 0;
                 MemtoReg <= 2'b10;
                 ALUOp <= 6'b110100;
                 MemWrite <= 0;
                 ALUSrc <= 1;
                 RegWrite <= 1;
                 newmux<=0;
                 PCSrc <= 1;
                 J_JR_Branch_signal<=2'b01;
                 Zero_or_Sign_signal<=0;loadhalf<=0;loadbyte<=0;storehalf<=0;storebyte<=0;loadupperi<=0;
        end                
                                      
        
                                                                           
                                                          
        else begin
         RegDst <= 0; RegWrite <= 0; ALUSrc <= 0; ALUOp <= 6'b000000; MemRead <= 0;
         MemWrite <= 0; MemtoReg <= 0; PCSrc <= 0;
         Branch <=0;J_JR_Branch_signal<=2'b00;newmux<=0;
         Zero_or_Sign_signal<=0;loadhalf<=0;loadbyte<=0;storehalf<=0;storebyte<=0;loadupperi<=0;
        
        end
        
        end
        
endmodule
