`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2021 08:57:22 PM
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(Clk, ALUSrc, RegDst, RegWrite, ALUOp, MemRead, MemWrite, MemToReg, ALUShift, /*branch,*/
    whb, jump, PCAddress, ReadData1, ReadData2, SignExtend, rt, rd, SHAMT, ALUSrcOut, RegDstOut, RegWriteOut,
    ALUOpOut, MemReadOut, MemWriteOut, MemToRegOut, ALUShiftOut, /*branchOut,*/ whbOut, jumpOut, PCAddressOut,
    ReadData1Out, ReadData2Out, SignExtendOut, rtOut, rdOut, SHAMTOut, /*shiftJumpIn, shiftJumpOut,*/ j_jrSrc, j_jrSrcID_EX, rs, rsOut, ReadSp, ReadSpOut);
  
    input Clk, ALUSrc, RegDst, RegWrite, MemRead, MemWrite, MemToReg, ALUShift, jump, j_jrSrc;
    input [31:0] PCAddress, ReadData1, ReadData2, SignExtend, SHAMT;
    input [4:0] rt, rd, rs;
    input [5:0] ALUOp;
    input [1:0] whb;
    input ReadSp;

    output reg ALUSrcOut, RegDstOut, RegWriteOut, MemReadOut, MemWriteOut, MemToRegOut, ALUShiftOut, jumpOut, j_jrSrcID_EX;
    output reg [31:0] PCAddressOut, ReadData1Out, ReadData2Out, SignExtendOut, SHAMTOut;
    output reg [4:0] rtOut, rdOut, rsOut;
    output reg [5:0] ALUOpOut;
    output reg [1:0] whbOut;
    output reg ReadSpOut;
    
    always@(posedge Clk) begin
        ALUSrcOut    <= ALUSrc;
        RegDstOut    <= RegDst;
        RegWriteOut  <= RegWrite;
        ALUOpOut     <= ALUOp;
        MemReadOut   <= MemRead;
        MemWriteOut  <= MemWrite;
        MemToRegOut  <= MemToReg;
        ALUShiftOut  <= ALUShift;
//        branchOut    <= branch;
        whbOut       <= whb;
        jumpOut      <= jump;
        PCAddressOut <= PCAddress;
        ReadData1Out <= ReadData1;
        ReadData2Out <= ReadData2;
        SignExtendOut<= SignExtend;
        rtOut        <= rt;
        rdOut        <= rd;
        SHAMTOut     <= SHAMT;
//        shiftJumpOut <= shiftJumpIn; 
        j_jrSrcID_EX <= j_jrSrc;
        rsOut        <= rs;
        ReadSpOut    <= ReadSp;
    end
endmodule
