`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2021 09:01:04 PM
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(Clk, PCAddress, Instruction, PCAddressOut, InstructionOut, IF_ID_en, IF_Flush);
    input [31:0] PCAddress, Instruction;
    input Clk, IF_ID_en, IF_Flush;
    output reg [31:0] PCAddressOut, InstructionOut;
    
    always@(posedge Clk) begin
        if (IF_ID_en == 1)
        begin
            if (IF_Flush)
            begin
                PCAddressOut <= PCAddress;
                InstructionOut <= 32'b0;
            end
            else 
            begin
                PCAddressOut <= PCAddress;
                InstructionOut <= Instruction;
            end
        end
    end

endmodule
