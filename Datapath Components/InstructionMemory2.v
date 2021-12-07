`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2021 02:59:03 PM
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory2(Address, Instruction); 

    input [31:0] Address;        // Input Address 

    output reg [31:0] Instruction;    // Instruction at memory location Address
    
    //reg [31:0] memory [127:0];
    reg [31:0] memory [8191:0];
    
    integer i;
    
    initial begin
    $readmemh("instruction_memory2.mem",memory);
   
    end
    
    always @(Address) 
    begin
        Instruction = memory[Address[15:2]];
    end
endmodule
