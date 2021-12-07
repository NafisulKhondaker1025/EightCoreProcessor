`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2021 11:15:01 PM
// Design Name: 
// Module Name: ShiftRight2
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


module ShiftRight2(in, shiftedOut);
    input [31:0] in;
    output reg [31:0] shiftedOut;
    
    always@(in) begin
    shiftedOut <= (in - 16) >> 2;
    end
endmodule
