`timescale 1ns / 1ps

module ForwardA_Mux(ForwardA_out,TopMux_out,ALUResult_out,WriteData, ForwardA_signal);

    output reg [31:0] ForwardA_out;   
    input [31:0] TopMux_out,ALUResult_out,WriteData;
    input[1:0] ForwardA_signal;


    always@( TopMux_out,ALUResult_out,WriteData,ForwardA_signal) begin
        if(ForwardA_signal==2'b00) begin
          ForwardA_out<=TopMux_out;
        end
        
        else if (ForwardA_signal==2'b10) begin
           ForwardA_out<=ALUResult_out; //EX Mem.Rd
        end
        else if (ForwardA_signal==2'b01) begin
           ForwardA_out<=WriteData; //MEM Wb.Rd
        end
        
    end
endmodule