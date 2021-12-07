`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 03:32:15 AM
// Design Name: 
// Module Name: ZeroExtension5Bit
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


module ZeroExtension5Bit(in, out);

    /* A 16-Bit input word */
    input [4:0] in;
    
    /* A 32-Bit output word */
    output reg [31:0] out;
    
    always @(*)
    begin
       out = {27'b0, in};
    end
endmodule
