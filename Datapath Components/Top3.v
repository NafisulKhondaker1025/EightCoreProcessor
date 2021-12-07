module Top3(Clk, Reset, out7, en_out);
    input Clk, Reset;
    wire Clk_f;
    output [6:0] out7;
    output [7:0] en_out;
    wire [31:0] v1_final, v0_final;
    
    ClkDiv clkdiv(Clk, Reset, Clk_f);
    
    Top2 EightCoreSystem(Clk_f, Reset, v0_final, v1_final);
    
    
    Two4DigitDisplay TwoDD(Clk, v1_final[15:0], v0_final[15:0], out7, en_out);
    
endmodule
