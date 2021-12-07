`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2021 11:52:44 PM
// Design Name: 
// Module Name: THE_BIG_SAD
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


module THE_BIG_SAD(a1_Out, a2_Out, a3_Out, a4_Out, a5_Out, a6_Out, a7_Out, a8_Out, a9_Out, a10_Out, a11_Out, a12_Out, a13_Out, a14_Out, a15_Out, a16_Out, Wb_Sad_ReadSp, row_in, col_in, min_in, min_out, row_col_in, row_col);
    input Wb_Sad_ReadSp;
    input [31:0] a1_Out, a2_Out, a3_Out, a4_Out, a5_Out, a6_Out, a7_Out, a8_Out, a9_Out, a10_Out, a11_Out, a12_Out, a13_Out, a14_Out, a15_Out, a16_Out, row_in, col_in, min_in; 
    input [11:0] row_col_in;
    output reg [31:0] min_out;
    output reg [11:0] row_col;
    reg [31:0] temp;
    
    always @(*) begin
        if(Wb_Sad_ReadSp) begin
            temp <= a1_Out + a2_Out + a3_Out + a4_Out + a5_Out + a6_Out + a7_Out + a8_Out + a9_Out + a10_Out + a11_Out + a12_Out + a13_Out + a14_Out + a15_Out + a16_Out;
            if(temp <= min_in) begin
                min_out <= temp;
                row_col <= {row_in[5:0], col_in[5:0]};
            end
            else begin
                min_out <= min_in;
                row_col <= row_col_in;
            end
        end
        else begin
            min_out <= min_in;
            row_col <= row_col_in;
        end
    end

endmodule
