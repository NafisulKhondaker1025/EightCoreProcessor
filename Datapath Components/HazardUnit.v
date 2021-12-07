`timescale 1ns / 1ps

module HazardUnit(EX_MEM_RegWrite, ID_EX_RegWrite, EX_MEM_Rd, ID_EX_Rd, ID_EX_Rt, IF_ID_Rs, IF_ID_Rt, ID_EX_RegDst, PC_en, IF_ID_en, Ctrl_Mux, ID_EX_MemRead, branch);

    input [4:0] ID_EX_Rd, ID_EX_Rt, IF_ID_Rs, IF_ID_Rt, EX_MEM_Rd;
    input ID_EX_RegWrite, EX_MEM_RegWrite, ID_EX_RegDst, ID_EX_MemRead, branch;
    output reg PC_en, IF_ID_en, Ctrl_Mux;
    
    initial 
    begin
        Ctrl_Mux <= 1;
        PC_en <= 1;
        IF_ID_en <= 1;
    end
    
    always @(*)
    begin
        
        //for dependency between EX and ID stage
        if (ID_EX_RegWrite && ID_EX_Rd != 0 && ID_EX_Rd == IF_ID_Rs && branch)
            begin 
                Ctrl_Mux <= 0;
                PC_en <= 0;
                IF_ID_en <= 0;
            end
            
        else if (ID_EX_RegWrite && ID_EX_Rd != 0 && ID_EX_Rd == IF_ID_Rt && branch)
            begin 
                Ctrl_Mux <= 0;
                PC_en <= 0;
                IF_ID_en <= 0;
            end
            
        else if ((ID_EX_RegDst == 0) && ID_EX_RegWrite && ID_EX_Rt != 0 && ID_EX_Rt == IF_ID_Rs && ID_EX_MemRead)           //for lw and immediate instructions RegDst = 1
            begin 
                Ctrl_Mux <= 0;
                PC_en <= 0;
                IF_ID_en <= 0;
            end
            
        else if ((ID_EX_RegDst == 0) && ID_EX_RegWrite && ID_EX_Rt != 0 && ID_EX_Rt == IF_ID_Rt && ID_EX_MemRead)           //for lw and immediate instructions RegDst = 1
            begin 
                Ctrl_Mux <= 0;
                PC_en <= 0;
                IF_ID_en <= 0;
            end
            
        //for dependency between MEM and ID stage    
        /*else if (EX_MEM_RegWrite && EX_MEM_Rd != 0 && EX_MEM_Rd == IF_ID_Rs)
            begin 
                Ctrl_Mux <= 0;
                PC_en <= 0;
                IF_ID_en <= 0;
            end
            
        else if (EX_MEM_RegWrite && EX_MEM_Rd != 0 && EX_MEM_Rd == IF_ID_Rt)
            begin 
                Ctrl_Mux <= 0;
                PC_en <= 0;
                IF_ID_en <= 0;
            end*/
        else 
            begin
                Ctrl_Mux <= 1;
                PC_en <= 1;
                IF_ID_en <= 1;
            end
    end
endmodule
