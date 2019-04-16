`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module TopMux(TopMux_out, inA, inB, sel);

    output reg [31:0] TopMux_out;
    
    input [31:0] inA;
    input [31:0] inB;
    input sel;

    /* Fill in the implementation here ... */ 
    always@(sel,inA,inB) begin
        if (sel==0) begin
            TopMux_out<=inA;
        end
        else if (sel==1) begin
            TopMux_out<=inB;
        end
    end
endmodule

/*`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module TopMux(out, ReadData1_out, ReadData2_out,ALUResult_out,WriteData, newMux1,ForwardA_signal);

    output reg [31:0] out;
    
    input [31:0] ReadData1_out,ALUResult_out,WriteData;
    input [31:0] ReadData2_out;
    input newMux1;
    input[1:0] ForwardA_signal;


    always@(ReadData1_out, ReadData2_out,ALUResult_out,WriteData, newMux1,ForwardA_signal) begin
        if(ForwardA_signal==2'b00) begin
            if(newMux1==1) begin
                out<=ReadData1_out;
            end
            else if (newMux1==0) begin
                out<=ReadData2_out;
            end
        end
        
        else if (ForwardA_signal==2'b10) begin
            out<=ALUResult_out; //EX Mem.Rd
        end
        else if (ForwardA_signal==2'b01) begin
            out<=WriteData; //MEM Wb.Rd
        end
        
    end
endmodule
*/