`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2021 01:22:51 AM
// Design Name: 
// Module Name: SignExtensionJump
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


module SignExtensionJump(in, out);

    /* A 16-Bit input word */
    input [25:0] in;
    
    /* A 32-Bit output word */
    output reg [31:0] out;
    
    always @(*)
    begin
        out <= {6'b0, in};
    end
endmodule
