`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit( ALUControl, A, B, ALUResult, Zero,clk,Hiout,Loout);
    integer k;
	input [5:0] ALUControl; // control bits for ALU operation
    input clk;                            // you need to adjust the bitwidth as needed
	input [31:0] A, B;	    // inputs
    reg [31:0] Cforandi;
	output reg [31:0] ALUResult;	// answer
	output reg Zero;	    // Zero=1 if ALUResult == 0
  
    /* Please fill in the implementation here... */
    reg [31:0]  Hiin,Loin;
    output reg  [31:0] Hiout,Loout;
    reg [63:0] temp,temp2,temp3;
    reg [15:0] temp1;
    always @(A,B,ALUControl,temp, Hiin,Loin,Hiout,Loout) begin
         case(ALUControl)
            6'b000000: ALUResult <= A+B;   //Add    0
    
            6'b000001: ALUResult <= A-B;     //SUB   1
    
            6'b000010: begin         //MUL   2  
                temp <= $signed(A)*$signed(B);    
                ALUResult <= temp[31:0];
               // Hiout <= temp[63:32];
              //  Loout <= temp[31:0];
           end
    
           6'b000011: begin      //MULT  3
                temp <= $signed(A)*$signed(B);      
                          //set hi and lo output
                Hiout <= temp[63:32];
                Loout <= temp[31:0];
            end
     
            6'b000100: begin
                temp <= A*B;        //MULTU   4
                Hiout <= temp[63:32];
                Loout <= temp[31:0];
            end
    
    
            6'b000101: begin                 //MADD  5
                temp <= $signed(A)*$signed(B);
                temp2 = temp + {Hiin, Loin};
                Hiout <= temp2[63:32];// + Hiin;
                Loout <= temp2[31:0];// + Loin;
            end
    
            6'b000110: begin                 //MSUB  6
               // temp <= $signed(A)*$signed(B);   
                //Hiout <=  temp[63:32]- Hiin;
                //Loout <= temp[31:0]- Loin;
                 temp <= $signed(A)*$signed(B);
                 temp3 = {Hiin, Loin}-temp;
                 Hiout <= temp3[63:32];// + Hiin;
                 Loout <= temp3[31:0];// + Loin;
                
                
                
                
                
            end
    
            6'b000111:  ALUResult <= A & B;        //AND  7
    
            6'b001000: begin
          //  Cforandi[15:0]<=B[15:0];
          //  Cforandi<={16'd0,B[15:0]};
            ALUResult <=  A &B;           //AnDI  8
             end
            6'b001001: ALUResult <= A | B;     //OR  9
            
            6'b001010:  ALUResult<= ~(A|B);  //nor
          
            6'b001011: ALUResult <= A ^ B;     //XOR  11 
   
            6'b001100: ALUResult <= A |B;     //ORI   12 
    
            6'b001101: ALUResult <= A ^ B;     //XORI   13
    
             6'b001110: begin                   //seh  14
            ALUResult <=B<<A[10:6];
               
              // ALUResult <=
            end   
             
   
            6'b001111: ALUResult <= A << B[10:6];     //sll   15
    
            6'b010000: ALUResult <= A >> B[10:6];     // srl  16
    
            6'b010001: ALUResult <= B<< A;     //sllv      17   /////////////////////////
         
            6'b010010: ALUResult <= B>> A;     // srlv    18  /////////////////////////
     
            6'b010011: begin                    //slt   19
                if ($signed(A)<$signed(B))
                    ALUResult <=1;
    
                else
                    ALUResult <= 0;
    
           end
     
            6'b010100: begin                    //slti  20   /////////////////////////
                if ($signed(A)<$signed(B)) begin
                    ALUResult <=1;
                    end
                else  begin
                    ALUResult <= 0;
                    end
                
            end
      
            6'b010101:begin                  //movn    21 /////////////////////////
                if(B!=0)
                    ALUResult <= A;
                else
                    ALUResult <= 0;
            end
     
            6'b010110:begin                  //movz    22     /////////////////////////
                if(B==0)
                     ALUResult <= A;
               
           end
     
           6'b010111:begin              //rotrv     23         /////////////////////////
                ALUResult <= (B>>A)|(B<<(32-A));      //B is bits to rotate
            end
     
            6'b011000:begin              //rotr   24
               ALUResult <= (A>>B[10:6])|(A<<(32-B[10:6]));      //B is bits to       /////////////////////////
              
            
            
             end
     
            6'b011001:  ALUResult <= A >> B[10:6];  //sra    25  /////////////////////////
     
            6'b011010:  ALUResult <= B >>A;     //srav   26    /////////////////////////
     
    6'b011011:begin /*                  //seb  27
    temp <= B[7:0];
    if(B[15]==1) begin
         ALUResult[7:0]<= temp;
         ALUResult [15:7] <=8'b11111111;
      end 
    else begin
         ALUResult[7:0] <= temp;
         ALUResult[15:7] <= 8'd0;
      end
      */
      ALUResult<={{24{B[7]}},B[7:0]};
      
   end   
                       //seb
  
            6'b011100:                      //sltiu   28
            begin                     
                if (A<B) 
                    ALUResult <=1;
                else 
                    ALUResult <= 0;
                
             end
        
            6'b011101:                      //sltu   29
            begin                     
                if (A<B) 
                    ALUResult <=1;
                else
                     ALUResult <= 0;
               
          end
       
           6'b011110: Hiout <= A;   //mthi  30 
   
            6'b011111: Loout<=A;       //mtlo  31
   
            6'b100000:  ALUResult<= Hiout;   //mfhi  32
   
            6'b100001:  ALUResult<= Loout;   //mflo   33
  
            6'b100010: ALUResult <= A+B; //addiu  34
   
            6'b100011: ALUResult <= A+B;  //addu   35
            6'b100100: ALUResult <= A+B;  //addi    36
            6'b100101: begin //bgez  37
            
                if( $signed(A)<0) begin 
                    Zero<=0;
                end
                else begin 
                    Zero<=1;
                end
            end

            6'b100110: begin //beq  38
            
                if( A==B) begin 
                  // ALUResult<=0;
                    Zero<=1;
                end
                else begin 
                // ALUResult<=0;
                    Zero<=0;
                end
            end


            6'b100111: begin //bne  39
            
                if( A!=B) begin 
                    Zero<=1;
                end
                else begin 
                    Zero<=0;
                end
            end   


            6'b101000: begin //BGTZ  40
            
                if( $signed(A)>0) begin 
                    Zero<=1;
                end
                else begin 
                    Zero<=0;
                end
            end 

            6'b101001: begin //blez  41
            
                if( $signed(A)>0) begin 
                    Zero<=0;
                end
                else begin 
                    Zero<=1;
                end
            end 
            
             6'b101010: begin //bltz  42
            
                if( $signed(A)<0) begin 
                    Zero<=1;
                end
                else begin 
                    Zero<=0;
                end
            end 
            
            

	        6'b101011: ALUResult <= A+B; //lw
            6'b101100: ALUResult <= A+B;  //SW
            6'b101101: ALUResult <= A+B;  //SB
   
            6'b101110: ALUResult <= A+B; //lh
            6'b101111: ALUResult <= A+B;  //lb
            6'b110000: ALUResult <= A+B;  //Sh  
            6'b110001: ALUResult <= A+B; //lui
            6'b110010: begin                  //j
            ALUResult <= 0;
            Zero <=1;
            end
   
            6'b110011: begin                  //jr
            ALUResult <= 0;
            Zero <=1;
            end    
            
           6'b110100: begin                  //jal
            ALUResult <= 0;
            Zero <=1;
            end               
                                  
    default : begin ALUResult <= 0; end
  

  endcase
  end
    /////////////
   
   //at the positive edge of clk
     //Hiin = Hiout
     //loin = loout
always@ (posedge clk)begin
Hiin <=Hiout;
Loin <= Loout;
end
 
  
 
   endmodule

