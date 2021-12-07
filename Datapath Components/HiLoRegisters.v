`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 06:30:23 AM
// Design Name: 
// Module Name: HiLoRegisters
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


module HiLoRegisters(Clk, Hi_in, Hi_out, Lo_in, Lo_out);

    input Clk;
    input[31:0] Hi_in, Lo_in;
    output reg [31:0] Hi_out, Lo_out;
    
    always @(posedge Clk)
    begin
        Hi_out <= Hi_in;
        Lo_out <= Lo_in;
    end
endmodule
