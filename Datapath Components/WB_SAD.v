`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2021 08:19:14 PM
// Design Name: 
// Module Name: WB_SAD
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


module WB_SAD(Clk, Mem_Wb_ReadSp, Wb_Sad_ReadSp, col, row, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
              col_Out, row_Out, a1_Out, a2_Out, a3_Out, a4_Out, a5_Out, a6_Out, a7_Out, a8_Out, a9_Out, a10_Out, a11_Out, a12_Out, a13_Out, a14_Out, a15_Out, a16_Out);

        input Clk, Mem_Wb_ReadSp;
        input [5:0] col, row;
        input [31:0] a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16;
        output reg Wb_Sad_ReadSp;
        output reg [5:0] col_Out, row_Out;
        output reg [31:0] a1_Out, a2_Out, a3_Out, a4_Out, a5_Out, a6_Out, a7_Out, a8_Out, a9_Out, a10_Out, a11_Out, a12_Out, a13_Out, a14_Out, a15_Out, a16_Out;

        always@(posedge Clk) begin
            row_Out <= row;
            col_Out <= col;
            Wb_Sad_ReadSp <= Mem_Wb_ReadSp;
            a1_Out <= a1;
            a2_Out <= a2;
            a3_Out <= a3;
            a4_Out <= a4;
            a5_Out <= a5;
            a6_Out <= a6;
            a7_Out <= a7;
            a8_Out <= a8;
            a9_Out <= a9;
            a10_Out <= a10;
            a11_Out <= a11;
            a12_Out <= a12;
            a13_Out <= a13;
            a14_Out <= a14;
            a15_Out <= a15;
            a16_Out <= a16;
        end

endmodule
