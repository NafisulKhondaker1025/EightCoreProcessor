`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 12:12:11 AM
// Design Name: 
// Module Name: Min_Row_Col_Register
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


module Min_Row_Col_Register(Clk, min_in, min_out, row_col_in, row_col_out);

    input Clk;
    input[31:0] min_in;
    input [11:0] row_col_in;
    output reg [31:0] min_out;
    output reg [11:0] row_col_out;
    
    initial begin
        min_out <= 100000;
    end
    
    always @(posedge Clk)
    begin
        min_out <= min_in;
        row_col_out <= row_col_in;
    end

endmodule
