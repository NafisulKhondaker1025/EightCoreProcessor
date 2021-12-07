`timescale 1ns / 1ps
 //Group 6: Kevin Gilman 33.333%, Ahmad Eladawy 33.333%, Nafisul Khondaker 33.333%
 //5 stage pipeline [Fetch, Decode, Execute, Memory, Writeback]
 //Branch is resolved in the Decode stage


module TopC(Clk, PC_Rst, v1, v0, PCValue, MIN);
    input Clk, PC_Rst;
    output reg [31:0] v1, v0, PCValue, MIN;
    
    wire [31:0] PCResult, PCMuxOut, PCAddResult, CurrentInstruction, ReadData1, ReadData2, PCAddressOutID_EX,
                ReadData1OutID_EX, ReadData2OutID_EX, SEOut, SignExtendOutID_EX, ShiftLeft2Out, Adder1Out, EXMux1Out,
                ALUResult, Adder1EX_MEM, ALUResultEX_MEM, ReadData2EX_MEM, ForwardingMuxAOut, ForwardingMuxBOut,
                MemReadData, MemReadDataMEM_WB, ALUResultMEM_WB, MuxWBOut, SHAMT, SHAMTOut_EX, EXMuxShiftOut, Hi_in, Hi_out, Lo_in, Lo_out, base, row, row_Ex_Mem,
                FrameData1, WindowData1,
                FrameData2, WindowData2,
                FrameData3, WindowData3,
                FrameData4, WindowData4,
                FrameData5, WindowData5,
                FrameData6, WindowData6,
                FrameData7, WindowData7,
                FrameData8, WindowData8,
                FrameData9, WindowData9,
                FrameData10, WindowData10,
                FrameData11, WindowData11,
                FrameData12, WindowData12,
                FrameData13, WindowData13,
                FrameData14, WindowData14,
                FrameData15, WindowData15,
                FrameData16, WindowData16, Col, row_col_in;
                
    wire [11:0] row_col, row_col_out;
                
    wire [31:0] PCAddressOut, InstructionOut, jumpSEOut, ShiftJumpOut, ShiftJumpID_EX, jumpMuxEX_MEM, jumpMuxOut, PCAddressOutEX_MEM, 
                PCAddressOutMEM_WB, MuxJalOut, AdderJumpOut, out_v0, out_v1, SadAdder1_Out, SadAdder2_Out, SadAdder3_Out, SadAdder4_Out,
                SadAdder5_Out, SadAdder6_Out, SadAdder7_Out, SadAdder8_Out, SadAdder9_Out, SadAdder10_Out, SadAdder11_Out, SadAdder12_Out,
                SadAdder13_Out, SadAdder14_Out, SadAdder15_Out, base_Out, SadAdder_Ex_Mem1, SadAdder_Ex_Mem2, SadAdder_Ex_Mem3, SadAdder_Ex_Mem4, SadAdder_Ex_Mem5, 
                SadAdder_Ex_Mem6, SadAdder_Ex_Mem7, SadAdder_Ex_Mem8, SadAdder_Ex_Mem9, SadAdder_Ex_Mem10, SadAdder_Ex_Mem11, SadAdder_Ex_Mem12, 
                SadAdder_Ex_Mem13, SadAdder_Ex_Mem14, SadAdder_Ex_Mem15, Mem_Wb_FrameData1, Mem_Wb_WindowData1,
                Mem_Wb_FrameData2, Mem_Wb_WindowData2,
                Mem_Wb_FrameData3, Mem_Wb_WindowData3,
                Mem_Wb_FrameData4, Mem_Wb_WindowData4,
                Mem_Wb_FrameData5, Mem_Wb_WindowData5,
                Mem_Wb_FrameData6, Mem_Wb_WindowData6,
                Mem_Wb_FrameData7, Mem_Wb_WindowData7,
                Mem_Wb_FrameData8, Mem_Wb_WindowData8,
                Mem_Wb_FrameData9, Mem_Wb_WindowData9,
                Mem_Wb_FrameData10, Mem_Wb_WindowData10,
                Mem_Wb_FrameData11, Mem_Wb_WindowData11,
                Mem_Wb_FrameData12, Mem_Wb_WindowData12,
                Mem_Wb_FrameData13, Mem_Wb_WindowData13,
                Mem_Wb_FrameData14, Mem_Wb_WindowData14,
                Mem_Wb_FrameData15, Mem_Wb_WindowData15,
                Mem_Wb_FrameData16, Mem_Wb_WindowData16, Mem_Wb_base, Mem_Wb_row,
                AD1, AD2, AD3, AD4, AD5, AD6, AD7, AD8, AD9, AD10, AD11, AD12, AD13, AD14, AD15, AD16,
                Wb_Sad_Col, Wb_Sad_row, a1_Out, a2_Out, a3_Out, a4_Out, a5_Out, a6_Out, a7_Out, a8_Out, a9_Out, a10_Out, a11_Out, a12_Out, a13_Out, a14_Out, a15_Out, a16_Out,
                min_in, min_out;
    wire ALUSrc, RegDst, RegWrite, MemRead, MemWrite, MemToReg, ALUShift, branch, jump,
         ALUSrcOutID_EX, RegDstOutID_EX, RegWriteOutID_EX, MemReadOutID_EX, MemWriteOutID_EX, MemToRegOutID_EX, ALUShiftOutID_EX,
         /*branchOutID_EX,*/ jumpOutID_EX, RegWriteEX_MEM, MemReadEX_MEM, MemWriteEX_MEM, MemToRegEX_MEM, branchEX_MEM,
         ZeroEX_MEM, PCSrc, RegWriteMEM_WB, MemToRegMEM_WB, zero, mov, movEX_MEM, movMEM_WB, RegWrite_AND, j_jrSrc, jumpOutEX_MEM, j_jrSrcID_EX, 
         jumpOutMEM_WB, HazardControl, PC_en, IF_ID_en, Zero_Branch, IF_Flush, ForwardingC, ForwardingD, ReadSp, ForwardingF, Id_Ex_ReadSp, Ex_Mem_ReadSp, Mem_Wb_ReadSp, Wb_Sad_ReadSp;
    wire [17:0] ControlMux_out;
    wire [4:0] rtOutID_EX, rdOutID_EX, WriteRegisterMEM_WB, EXMux2Out, WriteRegisterEX_MEM, MuxRaOut, rsOutID_EX;
    wire [5:0] ALUOp, ALUOpOutID_EX;
    wire [1:0] whb, whbOutID_EX, whbEX_MEM, ForwardingA, ForwardingB, ForwardingE;
    wire Clk;
    /*
    module ALU32Bit(ALUControl, A, B, ALUResult, Zero, Clk);
    module Controller(Instruction, ALUSrc, RegDst, RegWrite, ALUOp, MemRead, MemWrite, MemToReg, ALUShift, branch, whb, jump);
    module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData, whb); 
    module InstructionMemory(Address, Instruction); 
    module Mux32Bit2To1(out, inA, inB, sel);
    module PCAdder(PCResult, PCAddResult);
    module ProgramCounter(Address, PCResult, Reset, Clk);
    module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2);
    module ShiftLeft2(in, shiftedOut);
    module SignExtension(in, out);
    module IF_ID(Clk, PCAddress, Instruction, IF_IDOut);
    module ID_EX(Clk, ALUSrc, RegDst, RegWrite, ALUOp, MemRead, MemWrite, MemToReg, ALUShift, branch,
    whb, jump, PCAddress, ReadData1, ReadData2, SignExtend, rt, rd, ALUSrcOut, RegDstOut, RegWriteOut,
    ALUOpOut, MemReadOut, MemWriteOut, MemToRegOut, ALUShiftOut, branchOut, whbOut, jumpOut, PCAddressOut,
    ReadData1Out, ReadData2Out, SignExtendOut, rtOut, rdOut);
    */
    
    Mux32Bit3To1 PCMux(PCMuxOut, PCAddResult, Adder1Out, jumpMuxOut, {ControlMux_out[1],PCSrc});
    
    ProgramCounter PC(PCMuxOut, PCResult, PC_Rst, Clk, PC_en);
    
    PCAdder PCAdder(PCResult, PCAddResult);
    
   
    
    InstructionMemory3 InstructionMemory(PCResult, CurrentInstruction);
    OrGate FlushOR(PCSrc, ControlMux_out[1], IF_Flush);
    IF_ID IF_ID(Clk, PCAddResult, CurrentInstruction, PCAddressOut, InstructionOut, IF_ID_en, IF_Flush);
    
    HazardUnit HazardUnit(RegWriteEX_MEM, RegWriteOutID_EX, WriteRegisterEX_MEM, rdOutID_EX, rtOutID_EX, InstructionOut[25:21], InstructionOut[20:16], RegDstOutID_EX, PC_en, IF_ID_en, HazardControl, MemReadOutID_EX, branch); 
    
    SignExtensionJump jumpSE(InstructionOut[25:0], jumpSEOut);          //actually a zero extension
    
    ShiftLeft2 ShiftJump(jumpSEOut, ShiftJumpOut);
    
    Controller Controller(InstructionOut, ALUSrc, RegDst, RegWrite, ALUOp, MemRead, MemWrite, MemToReg, ALUShift, branch, whb, jump, j_jrSrc, ReadSp);
    
    ZeroExtension5Bit ZeroExtension5Bit(InstructionOut[10:6], SHAMT);
    
    //module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2);
    RegisterFile RegisterFile(InstructionOut[25:21],InstructionOut[20:16], MuxRaOut, MuxJalOut, RegWrite_AND, Clk, PC_Rst, ReadData1, ReadData2, out_v0, out_v1);
    
    ///////
    Mux32Bit2To1 ForwardBranchA(BranchALU_A, ReadData1, ALUResultEX_MEM, ForwardingC);
    
    Mux32Bit2To1 ForwardBranchB(BranchALU_B, ReadData2, ALUResultEX_MEM, ForwardingD);
    //////
    
    BranchALU BranchALU(BranchALU_A, BranchALU_B, Zero_Branch, InstructionOut[31:26], InstructionOut[20:16]);
    
    SignExtension SignExtender(InstructionOut[15:0], SEOut);
    
    ShiftLeft2 ShiftLeft2(SEOut, ShiftLeft2Out);
    
    Adder32bit Adder1(PCAddressOut, ShiftLeft2Out, Adder1Out);
    
    ControlMux ControlMux(ControlMux_out, /*18'b010100111001100000*/ 18'b0, {ALUSrc, RegDst, RegWrite, ALUOp, MemRead, MemWrite, MemToReg, ALUShift, branch, whb, jump, j_jrSrc}, HazardControl);
    
    Mux32Bit2To1 jumpMux(jumpMuxOut, ReadData1, ShiftJumpOut, ControlMux_out[0]);
    
    ANDGate BranchAND(Zero_Branch, ControlMux_out[4], PCSrc);
    
    
    ID_EX ID_EX(Clk, ControlMux_out[17], ControlMux_out[16], ControlMux_out[15], ControlMux_out[14:9], ControlMux_out[8], ControlMux_out[7], ControlMux_out[6], ControlMux_out[5], /*ControlMux_out[4],*/
        ControlMux_out[3:2], ControlMux_out[1], PCAddressOut, ReadData1, ReadData2, SEOut, InstructionOut[20:16], InstructionOut[15:11], SHAMT, ALUSrcOutID_EX, RegDstOutID_EX, RegWriteOutID_EX,
        ALUOpOutID_EX, MemReadOutID_EX, MemWriteOutID_EX, MemToRegOutID_EX, ALUShiftOutID_EX, /*branchOutID_EX,*/ whbOutID_EX, jumpOutID_EX, PCAddressOutID_EX,
        ReadData1OutID_EX, ReadData2OutID_EX, SignExtendOutID_EX, rtOutID_EX, rdOutID_EX, SHAMTOut_EX, /*ShiftJumpOut, ShiftJumpID_EX,*/ ControlMux_out[0], j_jrSrcID_EX, InstructionOut[25:21], rsOutID_EX, ReadSp, Id_Ex_ReadSp);

//    Mux32Bit2To1 jumpMux(jumpMuxOut, ReadData1OutID_EX, ShiftJumpID_EX, j_jrSrcID_EX);
    //Adder32bit AdderJump(PCAddressOutID_EX, jumpMuxOut, AdderJumpOut);
//    ShiftLeft2 ShiftLeft2(SignExtendOutID_EX, ShiftLeft2Out);
//    Adder32bit Adder1(PCAddressOutID_EX, ShiftLeft2Out, Adder1Out);

    Mux32Bit3To1 ForwardMuxSadE(base, ReadData1OutID_EX, ALUResultEX_MEM, MuxJalOut, ForwardingE);
    
    Mux32Bit2To1 ForwardMuxSadF(row, ReadData2OutID_EX, ALUResultEX_MEM, ForwardingF);

    Adder32bit SadAdder1(base, 4, SadAdder1_Out);
    Adder32bit SadAdder2(base, 8, SadAdder2_Out);
    Adder32bit SadAdder3(base, 12, SadAdder3_Out);
    Adder32bit SadAdder4(base, 256, SadAdder4_Out);
    Adder32bit SadAdder5(base, 260, SadAdder5_Out);
    Adder32bit SadAdder6(base, 264, SadAdder6_Out);
    Adder32bit SadAdder7(base, 268, SadAdder7_Out);
    Adder32bit SadAdder8(base, 512, SadAdder8_Out);
    Adder32bit SadAdder9(base, 516, SadAdder9_Out);
    Adder32bit SadAdder10(base, 520, SadAdder10_Out);
    Adder32bit SadAdder11(base, 524, SadAdder11_Out);
    Adder32bit SadAdder12(base, 768, SadAdder12_Out);
    Adder32bit SadAdder13(base, 772, SadAdder13_Out);
    Adder32bit SadAdder14(base, 776, SadAdder14_Out);
    Adder32bit SadAdder15(base, 780, SadAdder15_Out);
    
    Mux32Bit2To1 EXMux1(EXMux1Out, ReadData2OutID_EX, SignExtendOutID_EX, ALUSrcOutID_EX);
    
    Mux32Bit2To1 EXMuxShift(EXMuxShiftOut, ReadData1OutID_EX, SHAMTOut_EX, ALUShiftOutID_EX); 
    
    ForwardingUnit ForwardingUnit(WriteRegisterEX_MEM, WriteRegisterMEM_WB, RegWriteEX_MEM, RegWriteMEM_WB, rsOutID_EX, rtOutID_EX, InstructionOut[25:21], InstructionOut[20:16], RegDstOutID_EX, Id_Ex_ReadSp, ForwardingA, ForwardingB, ForwardingC, ForwardingD, ForwardingE, ForwardingF); 
    
    Mux32Bit3To1 ForwardingUnitMuxA(ForwardingMuxAOut, EXMuxShiftOut, MuxJalOut, ALUResultEX_MEM, ForwardingA);
    
    Mux32Bit3To1 ForwardingUnitMuxB(ForwardingMuxBOut, EXMux1Out, MuxJalOut, ALUResultEX_MEM, ForwardingB);
   
    //module ALU32Bit(ALUControl, A, B, ALUResult, Zero, Clk);
    ALU32Bit ALU(ALUOpOutID_EX, ForwardingMuxAOut, ForwardingMuxBOut, ALUResult, zero, Hi_in, Hi_out, Lo_in, Lo_out, mov);
    
    HiLoRegisters HiLoRegisters(Clk, Hi_out, Hi_in, Lo_out, Lo_in);
   
    Mux5Bit2To1 EXMux2(EXMux2Out, rtOutID_EX, rdOutID_EX, RegDstOutID_EX);
    
    /*module EX_MEM(Clk, RegWrite, MemRead, MemWrite, MemToReg, branch, Adder1Result, whb,
              Zero, ALUResult, ReadData2, EXMux2Result,
              RegWriteOut, MemReadOut, MemWriteOut, MemToRegOut, branchOut, Adder1Out,
              whbOut, ZeroOut, ALUResultOut, ReadData2Out, EXMux2Out);*/
    
    EX_MEM EX_MEM(Clk, RegWriteOutID_EX, MemReadOutID_EX, MemWriteOutID_EX, MemToRegOutID_EX, /*branchOutID_EX,*/ /*Adder1Out,*/
        whbOutID_EX, /*zero,*/ ALUResult, ReadData2OutID_EX, EXMux2Out,
        RegWriteEX_MEM, MemReadEX_MEM, MemWriteEX_MEM, MemToRegEX_MEM, /*branchEX_MEM,*/ /*Adder1EX_MEM,*/ whbEX_MEM, /*ZeroEX_MEM,*/ ALUResultEX_MEM,
        ReadData2EX_MEM, WriteRegisterEX_MEM, mov, movEX_MEM, /*jumpMuxOut, jumpMuxEX_MEM,*/ jumpOutID_EX, jumpOutEX_MEM, PCAddressOutID_EX, PCAddressOutEX_MEM, Id_Ex_ReadSp, Ex_Mem_ReadSp,
        base, SadAdder1_Out, SadAdder2_Out, SadAdder3_Out, SadAdder4_Out,
        SadAdder5_Out, SadAdder6_Out, SadAdder7_Out, SadAdder8_Out, SadAdder9_Out, SadAdder10_Out, SadAdder11_Out, SadAdder12_Out,
        SadAdder13_Out, SadAdder14_Out, SadAdder15_Out, base_Out, SadAdder_Ex_Mem1, SadAdder_Ex_Mem2, SadAdder_Ex_Mem3, SadAdder_Ex_Mem4, SadAdder_Ex_Mem5, 
        SadAdder_Ex_Mem6, SadAdder_Ex_Mem7, SadAdder_Ex_Mem8, SadAdder_Ex_Mem9, SadAdder_Ex_Mem10, SadAdder_Ex_Mem11, SadAdder_Ex_Mem12, 
        SadAdder_Ex_Mem13, SadAdder_Ex_Mem14, SadAdder_Ex_Mem15, row, row_Ex_Mem);
    //module ANDGate(A, B, Out);
//    ANDGate BranchAND(ZeroEX_MEM, branchEX_MEM, PCSrc);
    //module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData, whb);
    
    DataMemory DataMemory(ALUResultEX_MEM, ReadData2EX_MEM, Clk, MemWriteEX_MEM, MemReadEX_MEM,
        MemReadData/*, whbEX_MEM*/);
        
        SAD_DataMemory SAD_Memory1(base_Out, 4100, Ex_Mem_ReadSp, FrameData1, WindowData1);
        SAD_DataMemory SAD_Memory2(SadAdder_Ex_Mem1, 4101, Ex_Mem_ReadSp, FrameData2, WindowData2);
        SAD_DataMemory SAD_Memory3(SadAdder_Ex_Mem2, 4102, Ex_Mem_ReadSp, FrameData3, WindowData3);
        SAD_DataMemory SAD_Memory4(SadAdder_Ex_Mem3, 4103, Ex_Mem_ReadSp, FrameData4, WindowData4);
        SAD_DataMemory SAD_Memory5(SadAdder_Ex_Mem4, 4104, Ex_Mem_ReadSp, FrameData5, WindowData5);
        SAD_DataMemory SAD_Memory6(SadAdder_Ex_Mem5, 4105, Ex_Mem_ReadSp, FrameData6, WindowData6);
        SAD_DataMemory SAD_Memory7(SadAdder_Ex_Mem6, 4106, Ex_Mem_ReadSp, FrameData7, WindowData7);
        SAD_DataMemory SAD_Memory8(SadAdder_Ex_Mem7, 4107, Ex_Mem_ReadSp, FrameData8, WindowData8);
        SAD_DataMemory SAD_Memory9(SadAdder_Ex_Mem8, 4108, Ex_Mem_ReadSp, FrameData9, WindowData9);
        SAD_DataMemory SAD_Memory10(SadAdder_Ex_Mem9, 4109, Ex_Mem_ReadSp, FrameData10, WindowData10);
        SAD_DataMemory SAD_Memory11(SadAdder_Ex_Mem10, 4110, Ex_Mem_ReadSp, FrameData11, WindowData11);
        SAD_DataMemory SAD_Memory12(SadAdder_Ex_Mem11, 4111, Ex_Mem_ReadSp, FrameData12, WindowData12);
        SAD_DataMemory SAD_Memory13(SadAdder_Ex_Mem12, 4112, Ex_Mem_ReadSp, FrameData13, WindowData13);
        SAD_DataMemory SAD_Memory14(SadAdder_Ex_Mem13, 4113, Ex_Mem_ReadSp, FrameData14, WindowData14);
        SAD_DataMemory SAD_Memory15(SadAdder_Ex_Mem14, 4114, Ex_Mem_ReadSp, FrameData15, WindowData15);
        SAD_DataMemory SAD_Memory16(SadAdder_Ex_Mem15, 4115, Ex_Mem_ReadSp, FrameData16, WindowData16);
    
    /*module MEM_WB(Clk, RegWrite, MemToReg, MemReadData, ALUResult, WriteData,
    RegWriteOut, MemToRegOut, MemReadDataOut, ALUResultOut, WriteDataOut);*/
    MEM_WB MEM_WB(Clk, RegWriteEX_MEM, MemToRegEX_MEM, MemReadData, ALUResultEX_MEM, WriteRegisterEX_MEM,
        RegWriteMEM_WB, MemToRegMEM_WB, MemReadDataMEM_WB, ALUResultMEM_WB, WriteRegisterMEM_WB, movEX_MEM, movMem_WB, PCAddressOutEX_MEM,
        PCAddressOutMEM_WB, jumpOutEX_MEM, jumpOutMEM_WB, Ex_Mem_ReadSp, Mem_Wb_ReadSp, 
                FrameData1, WindowData1,
                FrameData2, WindowData2,
                FrameData3, WindowData3,
                FrameData4, WindowData4,
                FrameData5, WindowData5,
                FrameData6, WindowData6,
                FrameData7, WindowData7,
                FrameData8, WindowData8,
                FrameData9, WindowData9,
                FrameData10, WindowData10,
                FrameData11, WindowData11,
                FrameData12, WindowData12,
                FrameData13, WindowData13,
                FrameData14, WindowData14,
                FrameData15, WindowData15,
                FrameData16, WindowData16, base_Out, row_Ex_Mem,
                Mem_Wb_FrameData1, Mem_Wb_WindowData1,
                Mem_Wb_FrameData2, Mem_Wb_WindowData2,
                Mem_Wb_FrameData3, Mem_Wb_WindowData3,
                Mem_Wb_FrameData4, Mem_Wb_WindowData4,
                Mem_Wb_FrameData5, Mem_Wb_WindowData5,
                Mem_Wb_FrameData6, Mem_Wb_WindowData6,
                Mem_Wb_FrameData7, Mem_Wb_WindowData7,
                Mem_Wb_FrameData8, Mem_Wb_WindowData8,
                Mem_Wb_FrameData9, Mem_Wb_WindowData9,
                Mem_Wb_FrameData10, Mem_Wb_WindowData10,
                Mem_Wb_FrameData11, Mem_Wb_WindowData11,
                Mem_Wb_FrameData12, Mem_Wb_WindowData12,
                Mem_Wb_FrameData13, Mem_Wb_WindowData13,
                Mem_Wb_FrameData14, Mem_Wb_WindowData14,
                Mem_Wb_FrameData15, Mem_Wb_WindowData15,
                Mem_Wb_FrameData16, Mem_Wb_WindowData16, Mem_Wb_base, Mem_Wb_row);
    
    Mux32Bit2To1 MuxWB(MuxWBOut, MemReadDataMEM_WB, ALUResultMEM_WB, MemToRegMEM_WB);
    
    Mux32Bit2To1 MuxJal(MuxJalOut, MuxWBOut, PCAddressOutMEM_WB, jumpOutMEM_WB);
    
    Mux5Bit2To1 MuxRa(MuxRaOut, WriteRegisterMEM_WB, 5'b11111, jumpOutMEM_WB);  
    
    ANDGate regWriteAnd(RegWriteMEM_WB, movMem_WB, RegWrite_AND);
    
    ShiftRight2 ShiftRightBase(Mem_Wb_base, Col);
    
    Abs_Diff_ALU Abs_Alu1(Mem_Wb_FrameData1, Mem_Wb_WindowData1, AD1);
    Abs_Diff_ALU Abs_Alu2(Mem_Wb_FrameData2, Mem_Wb_WindowData2, AD2);
    Abs_Diff_ALU Abs_Alu3(Mem_Wb_FrameData3, Mem_Wb_WindowData3, AD3);
    Abs_Diff_ALU Abs_Alu4(Mem_Wb_FrameData4, Mem_Wb_WindowData4, AD4);
    Abs_Diff_ALU Abs_Alu5(Mem_Wb_FrameData5, Mem_Wb_WindowData5, AD5);
    Abs_Diff_ALU Abs_Alu6(Mem_Wb_FrameData6, Mem_Wb_WindowData6, AD6);
    Abs_Diff_ALU Abs_Alu7(Mem_Wb_FrameData7, Mem_Wb_WindowData7, AD7);
    Abs_Diff_ALU Abs_Alu8(Mem_Wb_FrameData8, Mem_Wb_WindowData8, AD8);
    Abs_Diff_ALU Abs_Alu9(Mem_Wb_FrameData9, Mem_Wb_WindowData9, AD9);
    Abs_Diff_ALU Abs_Alu10(Mem_Wb_FrameData10, Mem_Wb_WindowData10, AD10);
    Abs_Diff_ALU Abs_Alu11(Mem_Wb_FrameData11, Mem_Wb_WindowData11, AD11);
    Abs_Diff_ALU Abs_Alu12(Mem_Wb_FrameData12, Mem_Wb_WindowData12, AD12);
    Abs_Diff_ALU Abs_Alu13(Mem_Wb_FrameData13, Mem_Wb_WindowData13, AD13);
    Abs_Diff_ALU Abs_Alu14(Mem_Wb_FrameData14, Mem_Wb_WindowData14, AD14);
    Abs_Diff_ALU Abs_Alu15(Mem_Wb_FrameData15, Mem_Wb_WindowData15, AD15);
    Abs_Diff_ALU Abs_Alu16(Mem_Wb_FrameData16, Mem_Wb_WindowData16, AD16);
    
    WB_SAD WB_SAD(Clk, Mem_Wb_ReadSp, Wb_Sad_ReadSp, Col, Mem_Wb_row, AD1, AD2, AD3, AD4, AD5, AD6, AD7, AD8, AD9, AD10, AD11, AD12, AD13, AD14, AD15, AD16,
              Wb_Sad_Col, Wb_Sad_row, a1_Out, a2_Out, a3_Out, a4_Out, a5_Out, a6_Out, a7_Out, a8_Out, a9_Out, a10_Out, a11_Out, a12_Out, a13_Out, a14_Out, a15_Out, a16_Out);
              
    THE_BIG_SAD The_Big_Sad(a1_Out, a2_Out, a3_Out, a4_Out, a5_Out, a6_Out, a7_Out, a8_Out, a9_Out, a10_Out,
                             a11_Out, a12_Out, a13_Out, a14_Out, a15_Out, a16_Out, Wb_Sad_ReadSp, Wb_Sad_row, Wb_Sad_Col, min_in, min_out, row_col, row_col_out);
                             
    Min_Row_Col_Register min_row_col_reg(Clk, min_out, min_in, row_col_out, row_col);
    
    always@(posedge Clk) begin
        /*v1  <= out_v1;
        v0  <= out_v0;*/
        PCValue  <= PCResult;
        MIN <= min_out;   
        v0  <= {26'b0, row_col_out[11:6]};
        v1  <= {26'b0, row_col_out[5:0]};

    end
endmodule
