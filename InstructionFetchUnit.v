`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members:/tian%50  weishi%50
// Overall percent effort of each team meber: 
// 
// ECE369A - Computer Architecture
// Laboratory 3 (PostLab)
// Module - InstructionFetchUnit.v
// Description - Fetches the instruction from the instruction memory based on 
//               the program counter (PC) value.
// INPUTS:-
// Reset: 1-Bit input signal. 
// Clk: Input clock signal.
//
// OUTPUTS:-
// Instruction: 32-Bit output instruction from the instruction memory. 
//              Decimal value diplayed on the LCD usng the wrapper given in Lab 2
//
// FUNCTIONALITY:-
// Please connect up the following implemented modules to create this
// 'InstructionFetchUnit':-
//   (a) ProgramCounter.v
//   (b) PCAdder.v
//   (c) InstructionMemory.v
// Connect the modules together in a testbench so that the instruction memory
// outputs the contents of the next instruction indicated by the memory location
// in the PC at every clock cycle. Please initialize the instruction memory with
// some preliminary values for debugging purposes.
//
// @@ The 'Reset' input control signal is connected to the program counter (PC) 
// register which initializes the unit to output the first instruction in 
// instruction memory.
// @@ The 'Instruction' output port holds the output value from the instruction
// memory module.
// @@ The 'Clk' input signal is connected to the program counter (PC) register 
// which generates a continuous clock pulse into the module.
////////////////////////////////////////////////////////////////////////////////
  //Effort Percent:  50% Weishi Guo ; 50% Tian Yang
  
module InstructionFetchUnit(J_JR_Branch_signal,Branch_Mux_out,PCWrite,Instruction,PCResult,PCAddResult, Reset, Clk,NextAddress1,PCSrc3);

    /* Please fill in the implementation here... */
    
    input Clk,Reset,PCSrc3,PCWrite;
    output [31:0]Instruction,PCAddResult;
    input [1:0] J_JR_Branch_signal;
    wire [31:0]   PC_address;
    output wire [31:0]PCResult;
    input [31:0] NextAddress1,Branch_Mux_out;
    
    PCAdder P1(PCResult,PCAddResult);
    PCmux d3(J_JR_Branch_signal,PCAddResult,NextAddress1,PCSrc3,PC_address,Branch_Mux_out);
    ProgramCounter P2 (PCWrite,PC_address,PCResult,Reset,Clk);
    InstructionMemory I1 (PCResult,Instruction);
    
   
   
    
endmodule

