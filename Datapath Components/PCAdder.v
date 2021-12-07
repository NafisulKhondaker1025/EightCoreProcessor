`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2021 03:00:02 PM
// Design Name: 
// Module Name: PCAdder
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


module PCAdder(PCResult, PCAddResult);

    input [31:0] PCResult;

    output reg [31:0] PCAddResult;
    
    always @(PCResult)
    begin
        PCAddResult <= PCResult + 4;  
    end
endmodule
