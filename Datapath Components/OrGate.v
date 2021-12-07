`timescale 1ns / 1ps



module OrGate(A, B, Out);
    input A, B;
    output reg Out;
    
    always@(*) begin
        Out <= A || B;
    end
endmodule
