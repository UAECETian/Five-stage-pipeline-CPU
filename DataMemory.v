`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - data_memory.v
// Description - 32-Bit wide data memory.
//
// INPUTS:-
// Address: 32-Bit address input port.
// WriteData: 32-Bit input port.
// Clk: 1-Bit Input clock signal.
// MemWrite: 1-Bit control signal for memory write.
// MemRead: 1-Bit control signal for memory read.
//
// OUTPUTS:-
// ReadData: 32-Bit registered output port.
//
// FUNCTIONALITY:-
// Design the above memory similar to the 'RegisterFile' model in the previous 
// assignment.  Create a 1K memory, for which we need 10 bits.  In order to 
// implement byte addressing, we will use bits Address[11:2] to index the 
// memory location. The 'WriteData' value is written into the address 
// corresponding to Address[11:2] in the positive clock edge if 'MemWrite' 
// signal is 1. 'ReadData' is the value of memory location Address[11:2] if 
// 'MemRead' is 1, otherwise, it is 0x00000000. The reading of memory is not 
// clocked.
//
// you need to declare a 2d array. in this case we need an array of 1024 (1K)  
// 32-bit elements for the memory.   
// for example,  to declare an array of 256 32-bit elements, declaration is: reg[31:0] memory[0:255]
// if i continue with the same declaration, we need 8 bits to index to one of 256 elements. 
// however , address port for the data memory is 32 bits. from those 32 bits, least significant 2 
// bits help us index to one of the 4 bytes within a single word. therefore we only need bits [9-2] 
// of the "Address" input to index any of the 256 words. 
////////////////////////////////////////////////////////////////////////////////

module DataMemory(Address, ReadData2_out1, Clk, MemWrite2, MemRead2,loadhalf2,loadbyte2,storehalf2,storebyte2,loadupperi2, ReadData,Instruction_15_0); 

    input [31:0] Address; 	// Input Address 
    input [31:0] ReadData2_out1; // Data that needs to be written into the address 
    input Clk;
    input MemWrite2,loadhalf2,loadbyte2,storehalf2,storebyte2,loadupperi2;		// Control signal for memory write 
    input MemRead2; 			// Control signal for memory read 
    reg [31:0] temp1,temp2;
    output reg[31:0] ReadData; // Contents of memory location at Address
    input [15:0] Instruction_15_0;
    
    /* Please fill in the implementation here */
    reg[31:0] memory[0:275000];
    
     
    always @(posedge Clk) begin
        if (MemWrite2==1&&storehalf2==0&&storebyte2==0) begin 
            memory[Address[11:2]]<=ReadData2_out1;
        end
        else if(MemWrite2==0&&storehalf2==1&&storebyte2==0)begin
          
            memory[Address[11:2]][15:0]<= ReadData2_out1[15:0];
       end
        
         else if(MemWrite2==0&&storehalf2==0&&storebyte2==1)begin
                
                  memory[Address[11:2]][7:0]<=ReadData2_out1[7:0];
             end
        
    end 
    
    always @(*) begin
        if (MemRead2==1&&loadhalf2==0&&loadbyte2==0&&loadupperi2==0) begin 
            ReadData<=memory[Address[11:2]];
        end
        
        
        else if (MemRead2==0&&loadhalf2==1&&loadbyte2==0&&loadupperi2==0) begin
                       ReadData <= {{16{memory[Address[11:2]][15]}},memory[Address[11:2]][15:0]};
                  end
                    
        else if (MemRead2==0&&loadhalf2==0&&loadbyte2==1&&loadupperi2==0) begin
                   ReadData <= {{24{memory[Address[11:2]][7]}},memory[Address[11:2]][7:0]};

                                     
                     end
     else if (MemRead2==0&&loadhalf2==0&&loadbyte2==0&&loadupperi2==1) begin
                                 //  ReadData<=memory[Address[11:2]];
                                   ReadData={Instruction_15_0,16'b0};
                               end
                                         

        
        else begin
             ReadData<=0;
        end
      end
        
   integer i=0;
   
    initial begin
 
          $readmemh("data_memory.txt",memory);





     
/*
memory[0] = 32'h0;
memory[1] = 32'h1;
memory[2] = 32'h2;
memory[3] = 32'h3;
memory[4] = 32'h4;
memory[5] = -32'h1;
*/
    
     end  
             
    

endmodule
