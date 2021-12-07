`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2021 11:59:19 AM
// Design Name: 
// Module Name: 32bitAdder
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


module Adder32bit(A, B, Sum);
    input [31:0] A, B;
    output reg [31:0] Sum;
    
    always@(*) begin
        Sum <= A + B;
    end
endmodule
