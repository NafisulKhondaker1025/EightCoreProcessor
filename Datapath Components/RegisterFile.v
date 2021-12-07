`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2021 03:10:05 PM
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, Rst, ReadData1, ReadData2, v0, v1);

	input RegWrite, Clk, Rst;
	
	input [4:0] ReadRegister1, ReadRegister2, WriteRegister;
	
	input [31:0] WriteData;
	
	reg [31:0] GPR [0:31];
	
	output reg [31:0] ReadData1, ReadData2, v0, v1;
	
	initial begin
//	   $readmemh("register_memory.mem",GPR);
        GPR[29] <= 0;
	end
	
//	always @(posedge Rst)
//	begin
//	   GPR[5'b11101] <= 32'b00000000000000000001111111111100;
//	end
	
//	always @(posedge Clk)
//	begin
//	   v0 <= GPR[5'b00010];
//	   v1 <= GPR[5'b00011]; 
//	end
	
	always @(*)
	begin
	   ReadData1 <= GPR[ReadRegister1];
	   ReadData2 <= GPR[ReadRegister2];
	   v0 <= GPR[5'b00010];
	   v1 <= GPR[5'b00011]; 
	end
	
	always @(negedge Clk)
	begin
        if (RegWrite)
        begin
           GPR[WriteRegister] <= WriteData;
        end
        else if (Rst == 1)
        begin
            GPR[29] <= 0;
        end 
	end
	
endmodule
