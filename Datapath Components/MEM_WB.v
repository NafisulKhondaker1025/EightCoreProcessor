`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2021 01:35:38 PM
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(Clk, RegWrite, MemToReg, MemReadData, ALUResult, WriteRegister,
    RegWriteOut, MemToRegOut, MemReadDataOut, ALUResultOut, WriteRegisterOut, movIn, movOut, PCAddressOutEX_MEM,
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
    
    input Clk, RegWrite, MemToReg, movIn, jumpOutEX_MEM, Ex_Mem_ReadSp;
    input [4:0] WriteRegister;
    input [31:0] MemReadData, ALUResult, PCAddressOutEX_MEM, FrameData1, WindowData1,
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
                FrameData16, WindowData16, base_Out, row_Ex_Mem;
      
    output reg RegWriteOut, MemToRegOut, movOut, jumpOutMEM_WB, Mem_Wb_ReadSp;
    output reg [4:0] WriteRegisterOut;
    output reg [31:0] MemReadDataOut, ALUResultOut, PCAddressOutMEM_WB, Mem_Wb_FrameData1, Mem_Wb_WindowData1,
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
                Mem_Wb_FrameData16, Mem_Wb_WindowData16, Mem_Wb_base, Mem_Wb_row;
    
    always@(posedge Clk) begin
        RegWriteOut <= RegWrite;
        MemToRegOut <= MemToReg;
        MemReadDataOut <= MemReadData;
        ALUResultOut <= ALUResult;
        WriteRegisterOut <= WriteRegister;
        movOut          <= movIn;
        PCAddressOutMEM_WB <= PCAddressOutEX_MEM;
        jumpOutMEM_WB <= jumpOutEX_MEM;
        Mem_Wb_ReadSp <= Ex_Mem_ReadSp;
        Mem_Wb_FrameData1 <= FrameData1;
        Mem_Wb_FrameData2 <= FrameData2;
        Mem_Wb_FrameData3 <= FrameData3;
        Mem_Wb_FrameData4 <= FrameData4;
        Mem_Wb_FrameData5 <= FrameData5;
        Mem_Wb_FrameData6 <= FrameData6;
        Mem_Wb_FrameData7 <= FrameData7;
        Mem_Wb_FrameData8 <= FrameData8;
        Mem_Wb_FrameData9 <= FrameData9;
        Mem_Wb_FrameData10 <= FrameData10;
        Mem_Wb_FrameData11 <= FrameData11;
        Mem_Wb_FrameData12 <= FrameData12;
        Mem_Wb_FrameData13 <= FrameData13;
        Mem_Wb_FrameData14 <= FrameData14;
        Mem_Wb_FrameData15 <= FrameData15;
        Mem_Wb_FrameData16 <= FrameData16;
        
        Mem_Wb_WindowData1 <= WindowData1;
        Mem_Wb_WindowData2 <= WindowData2;
        Mem_Wb_WindowData3 <= WindowData3;
        Mem_Wb_WindowData4 <= WindowData4;
        Mem_Wb_WindowData5 <= WindowData5;
        Mem_Wb_WindowData6 <= WindowData6;
        Mem_Wb_WindowData7 <= WindowData7;
        Mem_Wb_WindowData8 <= WindowData8;
        Mem_Wb_WindowData9 <= WindowData9;
        Mem_Wb_WindowData10 <= WindowData10;
        Mem_Wb_WindowData11 <= WindowData11;
        Mem_Wb_WindowData12 <= WindowData12;
        Mem_Wb_WindowData13 <= WindowData13;
        Mem_Wb_WindowData14 <= WindowData14;
        Mem_Wb_WindowData15 <= WindowData15;
        Mem_Wb_WindowData16 <= WindowData16;
        
        Mem_Wb_base <= base_Out;
        Mem_Wb_row <= row_Ex_Mem;
        
    end
endmodule
