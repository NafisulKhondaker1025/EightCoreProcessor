`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2021 03:04:47 PM
// Design Name: 
// Module Name: ProgramCounter
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


module ProgramCounter(Address, PCResult, Reset, Clk, PC_en);

	input [31:0] Address;
	input Reset, Clk, PC_en;

	output reg [31:0] PCResult;
    
    always @(posedge Clk, posedge Reset)
    begin
       if (Reset == 1)
       begin
        PCResult <= 0;
       end 
       else if (PC_en == 1)
       begin
        PCResult <= Address;
       end
    end
    endmodule
