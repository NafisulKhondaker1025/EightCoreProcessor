`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2021 11:24:59 PM
// Design Name: 
// Module Name: Abs_Diff_ALU
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


module Abs_Diff_ALU(Frame, Window, AD);
    input [31:0] Frame, Window;
    output reg [31:0] AD;
    
    always @(*)    
    begin
        if(Frame < Window) begin
            AD <= Window - Frame;
        end
        else begin
            AD <= Frame - Window;
        end
    end

endmodule
