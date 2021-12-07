`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2021 08:44:23 PM
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(Clk, RegWrite, MemRead, MemWrite, MemToReg, /*branch,*/ /*Adder1Result,*/ whb,
              /*Zero,*/ ALUResult, ReadData2, EXMux2Result,
              RegWriteOut, MemReadOut, MemWriteOut, MemToRegOut, /*branchOut,*/ /*Adder1Out,*/
              whbOut, /*ZeroOut,*/ ALUResultOut, ReadData2Out, EXMux2Out, movIn, movOut, /*jumpMuxin, jumpMuxOut,*/ jumpOutID_EX, jumpOutEX_MEM, 
              PCAddressOutID_EX, PCAddressOutEX_MEM, Id_Ex_ReadSp, Ex_Mem_ReadSp, ReadData1, SadAdder1, SadAdder2, SadAdder3, SadAdder4,
                SadAdder5, SadAdder6, SadAdder7, SadAdder8, SadAdder9, SadAdder10, SadAdder11, SadAdder12,
                SadAdder13, SadAdder14, SadAdder15, ReadData1_Out, SadAdder1_Out, SadAdder2_Out, SadAdder3_Out, SadAdder4_Out,
                SadAdder5_Out, SadAdder6_Out, SadAdder7_Out, SadAdder8_Out, SadAdder9_Out, SadAdder10_Out, SadAdder11_Out, SadAdder12_Out,
                SadAdder13_Out, SadAdder14_Out, SadAdder15_Out, row, row_Ex_Mem);
              
    input RegWrite, MemRead, MemWrite, MemToReg, Clk, movIn, jumpOutID_EX, Id_Ex_ReadSp;
    input [31:0] ALUResult, ReadData2, PCAddressOutID_EX, ReadData1, SadAdder1, SadAdder2, SadAdder3, SadAdder4,
                SadAdder5, SadAdder6, SadAdder7, SadAdder8, SadAdder9, SadAdder10, SadAdder11, SadAdder12,
                SadAdder13, SadAdder14, SadAdder15, row;
    input [4:0] EXMux2Result;
    input [1:0] whb;
    
    output reg RegWriteOut, MemReadOut, MemWriteOut, MemToRegOut, movOut, jumpOutEX_MEM, Ex_Mem_ReadSp;
    output reg [31:0] ALUResultOut, ReadData2Out, PCAddressOutEX_MEM, ReadData1_Out, SadAdder1_Out, SadAdder2_Out, SadAdder3_Out, SadAdder4_Out,
                SadAdder5_Out, SadAdder6_Out, SadAdder7_Out, SadAdder8_Out, SadAdder9_Out, SadAdder10_Out, SadAdder11_Out, SadAdder12_Out,
                SadAdder13_Out, SadAdder14_Out, SadAdder15_Out, row_Ex_Mem;
    output reg [4:0] EXMux2Out;
    output reg [1:0] whbOut;
    
    always@(posedge Clk) begin
        RegWriteOut  <= RegWrite;
        MemReadOut   <= MemRead;
        MemWriteOut  <= MemWrite;
        MemToRegOut  <= MemToReg;
//        branchOut    <= branch;
        whbOut       <= whb;
//        ZeroOut      <= Zero;
//        Adder1Out    <= Adder1Result;
        ALUResultOut <= ALUResult;
        ReadData2Out <= ReadData2;
        EXMux2Out    <= EXMux2Result;
        movOut       <= movIn;
//        jumpMuxOut   <= jumpMuxin;
        jumpOutEX_MEM <= jumpOutID_EX;
        PCAddressOutEX_MEM <= PCAddressOutID_EX;
        Ex_Mem_ReadSp <= Id_Ex_ReadSp;
        ReadData1_Out <= ReadData1;
        SadAdder1_Out <= SadAdder1;
        SadAdder2_Out <= SadAdder2;
        SadAdder3_Out <= SadAdder3;
        SadAdder4_Out <= SadAdder4;
        SadAdder5_Out <= SadAdder5;
        SadAdder6_Out <= SadAdder6;
        SadAdder7_Out <= SadAdder7;
        SadAdder8_Out <= SadAdder8;
        SadAdder9_Out <= SadAdder9;
        SadAdder10_Out <= SadAdder10;
        SadAdder11_Out <= SadAdder11;
        SadAdder12_Out <= SadAdder12;
        SadAdder13_Out <= SadAdder13;
        SadAdder14_Out <= SadAdder14;
        SadAdder15_Out <= SadAdder15;
        row_Ex_Mem <= row;
    end
endmodule
