`timescale 1ns / 1ps

module ForwardingUnit(Ex_Mem_Rd, Mem_Wb_Rd, Ex_Mem_RegWrite, Mem_Wb_RegWrite, Id_Ex_Rs, Id_Ex_Rt, If_Id_Rs, If_Id_Rt, Id_Ex_RegDst, Id_Ex_ReadSp, A, B, C, D, E, F);
    input [4:0] Ex_Mem_Rd, Mem_Wb_Rd, Id_Ex_Rs, Id_Ex_Rt, If_Id_Rs, If_Id_Rt;
    input Ex_Mem_RegWrite, Mem_Wb_RegWrite, Id_Ex_RegDst, Id_Ex_ReadSp;
    output reg [1:0] A, B, E;
    output reg C, D, F;
    
    always @(*)
    begin
        if(Ex_Mem_RegWrite && (Ex_Mem_Rd != 0) && (Ex_Mem_Rd == Id_Ex_Rs))
        begin
            A <= 2'b10;
        end
        else if(Mem_Wb_RegWrite && (Mem_Wb_Rd != 0) && (Mem_Wb_Rd == Id_Ex_Rs))
        begin
            A <= 2'b01;
        end
        else
        begin
            A <= 2'b0;
        end
        
        if(Ex_Mem_RegWrite && (Ex_Mem_Rd != 0) && (Ex_Mem_Rd == Id_Ex_Rt) && Id_Ex_RegDst == 1)
        begin
            B <= 2'b10;
        end
        else if(Mem_Wb_RegWrite && (Mem_Wb_Rd != 0) && (Mem_Wb_Rd == Id_Ex_Rt) && Id_Ex_RegDst == 1)
        begin
            B <= 2'b01;
        end
        else
        begin
            B <= 2'b0;
        end
        
        if(Ex_Mem_RegWrite && (Ex_Mem_Rd != 0) && (Ex_Mem_Rd == If_Id_Rs))
        begin
            C <= 1;
        end
        else
        begin
            C <= 0;
        end
        
        if(Ex_Mem_RegWrite && (Ex_Mem_Rd != 0) && (Ex_Mem_Rd == If_Id_Rt))
        begin
            D <= 1;
        end
        else
        begin
            D <= 0;
        end
        
        if(Id_Ex_ReadSp && (Ex_Mem_Rd != 0) && (Ex_Mem_Rd == Id_Ex_Rs))
        begin
            E <= 1;
        end
        else if(Id_Ex_ReadSp && (Mem_Wb_Rd != 0) && (Mem_Wb_Rd == Id_Ex_Rs))
        begin
            E <= 2;
        end
        else
        begin
            E <= 0;
        end
        
        if(Id_Ex_ReadSp && (Ex_Mem_Rd != 0) && (Ex_Mem_Rd == Id_Ex_Rt))
        begin
            F <= 1;
        end
        else
        begin
            F <= 0;
        end
    end
    
endmodule