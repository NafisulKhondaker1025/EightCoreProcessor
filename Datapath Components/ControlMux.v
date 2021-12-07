`timescale 1ns / 1ps

module ControlMux(out, inA, inB, sel);

    output reg [17:0] out;
    
    input [17:0] inA;
    input [17:0] inB;
    input sel;

    always @(*)
    begin
        if (sel == 0)
        begin
            out <= inA;
        end
        else
        begin
            out <= inB;
        end
    end

endmodule
