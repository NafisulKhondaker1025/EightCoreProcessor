`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2021 12:28:55 PM
// Design Name: 
// Module Name: Controller
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


module Controller(Instruction, ALUSrc, RegDst, RegWrite, ALUOp, MemRead, MemWrite, MemToReg, ALUShift, branch, whb, jump, j_jrSrc, ReadSp);
    input [31:0] Instruction;
    output reg ALUSrc, RegDst, RegWrite, MemRead, MemWrite, MemToReg, ALUShift, branch, jump, j_jrSrc, ReadSp;
    output reg [1:0] whb;
    output reg [5:0] ALUOp;
    
    initial begin
        ALUSrc <= 0;
        RegDst <= 0;
        RegWrite <= 0;
        MemRead <= 0;
        MemWrite <= 0;
        MemToReg <= 0;
        ALUShift <= 0;
        branch <= 0;
        ALUOp <=  6'b0;
        whb <= 2'b0;
        jump <= 0;
        j_jrSrc <= 0;
        ReadSp <= 0;
    end


    always@(Instruction) begin

        /*ALUSrc <= 0;
        RegDst <= 0;
        RegWrite <= 0;
        MemRead <= 0;
        MemWrite <= 0;
        MemToReg <= 0;
        ALUShift <= 0;
        branch <= 0;
        ALUOp <=  6'b0;
        whb <= 2'b0;*/
        
//        //NOP
//        if(Instruction == 32'b0) begin
//            ALUSrc <= 0;
//            RegDst <= 0;
//            RegWrite <= 0;
//            MemRead <= 0;
//            MemWrite <= 0;
//            MemToReg <= 0;
//            ALUShift <= 0;
//            branch <= 0;
//            ALUOp <=  6'b0;
//            whb <= 2'b0;
//            jump <= 0;
//            j_jrSrc <= 0;
            
        
//        end



        //Custom Instruction S.A.D.
        if(Instruction[31:26] == 6'b111111)
        begin
            ALUSrc <= 0;
            RegDst <= 1;
            RegWrite <= 0;
            ALUOp <= 6'b100111;
            MemRead <= 0;
            MemWrite <= 0;
            MemToReg <= 1;
            ALUShift <= 1;
            branch <= 0;
            whb <= 2'b0;
            jump <= 0;
            j_jrSrc <= 0;
            ReadSp <= 1;
        end

        //Special R-Type Operations with OP Code 000000
        if(Instruction[31:26] == 6'b000000) 
        begin
            
            //sll
            if(Instruction[5:0] == 6'b000000) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b100111;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 1;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;
                j_jrSrc <= 0;
                ReadSp <= 0;
            end
        
            //srl & rotr
            else if(Instruction[5:0] == 6'b000010) 
            begin
                
                //srl
                if(Instruction[21] == 1'b0) 
                begin
                    ALUSrc <= 0;
                    RegDst <= 1;
                    RegWrite <= 1;
                    ALUOp <= 6'b101000;
                    MemRead <= 0;
                    MemWrite <= 0;
                    MemToReg <= 1;
                    ALUShift <= 1;
                    branch <= 0;
                    whb <= 2'b0;
                    jump <= 0;
                    j_jrSrc <= 0;
                    ReadSp <= 0;
                end
                
                //rotr
                else 
                begin
                   ALUSrc <= 0;
                    RegDst <= 1;
                    RegWrite <= 1;
                    ALUOp <= 6'b110000;
                    MemRead <= 0;
                    MemWrite <= 0;
                    MemToReg <= 1;
                    ALUShift <= 1;
                    branch <= 0;
                    whb <= 2'b0;
                    jump <= 0;
                    j_jrSrc <= 0;
                    ReadSp <= 0;
                end 
            end
            
            //sra
            else if(Instruction[5:0] == 6'b000011) 
            begin  
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b110001;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 1;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;
                j_jrSrc <= 0;
                ReadSp <= 0;
            end
                
        
        //Arithmetic and bitwise logical R-Type Operations
            
            //add
            else if(Instruction[5:0] == 6'b100000) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b000000;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;
                j_jrSrc <= 0;
                ReadSp <= 0;
            end
            
            //addu
            else if(Instruction[5:0] == 6'b100001) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b000010;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;
                j_jrSrc <= 0;
                ReadSp <= 0;
            end
            
            //sub
            else if(Instruction[5:0] == 6'b100010) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b000100;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;
                j_jrSrc <= 0;
                ReadSp <= 0;
            end
            
            //mult
            else if(Instruction[5:0] == 6'b011000) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 0;
                ALUOp <= 6'b000110;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0; 
                j_jrSrc <= 0;   
                ReadSp <= 0;                                          
            end
            
            //multu
            else if(Instruction[5:0] == 6'b011001) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 0;
                ALUOp <= 6'b000111;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0; 
                j_jrSrc <= 0; 
                ReadSp <= 0;                                                   
            end
            
            //and
            else if(Instruction[5:0] == 6'b100100) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b011110;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;
                j_jrSrc <= 0;   
                ReadSp <= 0;                                                  
            end
            
            //or
            else if(Instruction[5:0] == 6'b100101) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b100000;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0; 
                j_jrSrc <= 0;     
                ReadSp <= 0;                                             
            end
            
            //nor
            else if(Instruction[5:0] == 6'b100111) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b100001;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;
                j_jrSrc <= 0; 
                ReadSp <= 0;                                                         
            end
            
            //xor
            else if(Instruction[5:0] == 6'b100110) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b100010;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0; 
                j_jrSrc <= 0; 
                ReadSp <= 0;                                                    
            end
            
            //sllv
            else if(Instruction[5:0] == 6'b000100) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b100111;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;
                j_jrSrc <= 0;  
                ReadSp <= 0;                                                      
            end
            
            //slt
            else if(Instruction[5:0] == 6'b101010) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b101011;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0; 
                j_jrSrc <= 0;
                ReadSp <= 0;                                                       
            end
            
            //movn
            else if(Instruction[5:0] == 6'b001011) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b101101;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0; 
                j_jrSrc <= 0; 
                ReadSp <= 0;                                                     
            end
            
            //movz
            else if(Instruction[5:0] == 6'b001010) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b101110;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;
                j_jrSrc <= 0; 
                ReadSp <= 0;                                                         
            end
            
            //srlv & rotrv
            else if(Instruction[5:0] == 6'b000110) 
            begin
            
                //srlv
                if(Instruction[6] == 1'b0) 
                begin
                    ALUSrc <= 0;
                    RegDst <= 1;
                    RegWrite <= 1;
                    ALUOp <= 6'b101000;
                    MemRead <= 0;
                    MemWrite <= 0;
                    MemToReg <= 1;
                    ALUShift <= 0;
                    branch <= 0;
                    whb <= 2'b0;
                    jump <= 0;
                    j_jrSrc <= 0;
                    ReadSp <= 0;
                end
                
                //rotrv
                else 
                begin
                    ALUSrc <= 0;
                    RegDst <= 1;
                    RegWrite <= 1;
                    ALUOp <= 6'b110000;
                    MemRead <= 0;
                    MemWrite <= 0;
                    MemToReg <= 1;
                    ALUShift <= 0;
                    branch <= 0;
                    whb <= 2'b0;
                    jump <= 0;
                    j_jrSrc <= 0;
                    ReadSp <= 0;
                end                             
            end
            
            //srav
            else if(Instruction[5:0] == 6'b000111) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b110001;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0; 
                j_jrSrc <= 0;  
                ReadSp <= 0;                                                   
            end
            
            //sltu
            else if(Instruction[5:0] == 6'b101011) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b110101;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;
                j_jrSrc <= 0;   
                ReadSp <= 0;                                                      
            end
            
            //mthi
            else if(Instruction[5:0] == 6'b010001) 
            begin
                ALUSrc <= 0;
                RegDst <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b010000;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0; 
                j_jrSrc <= 0;     
                ReadSp <= 0;                                             
            end
            
            //mtlo
            else if(Instruction[5:0] == 6'b010011) 
            begin
                ALUSrc <= 0;
                RegDst <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b010001;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0; 
                j_jrSrc <= 0;    
                ReadSp <= 0;                                                     
            end
            
            //mfhi
            else if(Instruction[5:0] == 6'b010000) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b010010;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;  
                j_jrSrc <= 0;   
                ReadSp <= 0;                                                  
            end
            
            //mflo
            else if(Instruction[5:0] == 6'b010010) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b010011;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0; 
                j_jrSrc <= 0;  
                ReadSp <= 0;                                                                                  
            end
            
            //jr
            else if(Instruction[5:0] == 6'b001000) 
            begin
                ALUSrc <= 0;
                RegDst <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b011100;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 0;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 1;
                j_jrSrc <= 0;
                ReadSp <= 0;                                                                           
            end               
        end
        
        //Multiplication R-Type
        else if(Instruction[31:26] == 6'b011100) 
        begin
        
            //mul
            if(Instruction[5:0] == 6'b000010) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b000101;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;
                j_jrSrc <= 0;
                ReadSp <= 0;
            end
            
            //madd
            else if(Instruction[5:0] == 6'b000000) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 0;
                ALUOp <= 6'b001000;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0; 
                j_jrSrc <= 0;   
                ReadSp <= 0;                                                                                
            end
            
            //msub
            else if(Instruction[5:0] == 6'b000100) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 0;
                ALUOp <= 6'b001001;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;  
                j_jrSrc <= 0; 
                ReadSp <= 0;                                                                                   
            end
        end
        
        //Sign Extension
        else if(Instruction[31:26] == 6'b011111) 
        begin
        
            //seh
            if(Instruction[9] == 1'b1) 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b100110;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;
                j_jrSrc <= 0;
                ReadSp <= 0;
            end
            
            //seb
            else 
            begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b110011;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;
                j_jrSrc <= 0;
                ReadSp <= 0;
            end
        end
        
        //I-Type Operations
        else 
        begin
            
            //addiu
            if(Instruction[31:26] == 6'b001001) 
            begin
                ALUSrc <= 1;
                RegDst <= 0;
                RegWrite <= 1;
                ALUOp <= 6'b000010;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;
                j_jrSrc <= 0;
                ReadSp <= 0;
            end
            
            //addi
            else if(Instruction[31:26] == 6'b001000)
            begin
                ALUSrc <= 1;
                RegDst <= 0;
                RegWrite <= 1; 
                ALUOp <= 6'b000000; 
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;  
                j_jrSrc <= 0;  
                ReadSp <= 0;          
            end
            
            //andi
            else if(Instruction[31:26] == 6'b001100) 
            begin
                ALUSrc <= 1;
                RegDst <= 0;
                RegWrite <= 1;
                ALUOp <= 6'b011110;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;   
                j_jrSrc <= 0;  
                ReadSp <= 0;               
            end
            
            //ori
            else if(Instruction[31:26] == 6'b001101) 
            begin
                ALUSrc <= 1;
                RegDst <= 0;
                RegWrite <= 1;
                ALUOp <= 6'b100000;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0; 
                j_jrSrc <= 0; 
                ReadSp <= 0;           
            end
            
            //xori
            else if(Instruction[31:26] == 6'b001110) 
            begin
                ALUSrc <= 1;
                RegDst <= 0;
                RegWrite <= 1;
                ALUOp <= 6'b100010;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0; 
                j_jrSrc <= 0;
                ReadSp <= 0;                 
            end
        
            //slti
            else if(Instruction[31:26] == 6'b001010) 
            begin
                ALUSrc <= 1;
                RegDst <= 0;
                RegWrite <= 1;
                ALUOp <= 6'b101011;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0; 
                j_jrSrc <= 0;
                ReadSp <= 0;             
            end
            
            //sltiu
            else if(Instruction[31:26] == 6'b001011)
            begin
                ALUSrc <= 1;
                RegDst <= 0;
                RegWrite <= 1;
                ALUOp <= 6'b110101;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;
                j_jrSrc <= 0;  
                ReadSp <= 0;             
            end
            
            //lw
             else if(Instruction[31:26] == 6'b100011) 
             begin
                 ALUSrc <= 1;
                 RegDst <= 0;
                 RegWrite <= 1;
                 ALUOp <= 6'b000000;
                 MemRead <= 1;
                 MemWrite <= 0;
                 MemToReg <= 0;
                 ALUShift <= 0;
                 branch <= 0;
                 whb <= 2'b0;
                 jump <= 0;  
                 j_jrSrc <= 0; 
                 ReadSp <= 0;                
             end
             
             //sw
             else if(Instruction[31:26] == 6'b101011) 
             begin
                 ALUSrc <= 1;
                 RegDst <= 0;
                 RegWrite <= 0;
                 ALUOp <= 6'b000000;
                 MemRead <= 0;
                 MemWrite <= 1;
                 MemToReg <= 0;
                 ALUShift <= 0;
                 branch <= 0;   
                 whb <= 2'b0;
                 jump <= 0;
                 j_jrSrc <= 0;
                 ReadSp <= 0;
             end
             
             //sb
             else if(Instruction[31:26] == 6'b101000) 
             begin
                 ALUSrc <= 1;
                 RegDst <= 0;
                 RegWrite <= 0;
                 ALUOp <= 6'b000000;
                 MemRead <= 0;
                 MemWrite <= 1;
                 MemToReg <= 0;
                 ALUShift <= 0;
                 branch <= 0;  
                 whb <= 2'b10;
                 jump <= 0; 
                 j_jrSrc <= 0;
                 ReadSp <= 0;               
             end
             
             //lh
             else if(Instruction[31:26] == 6'b100001) 
             begin
                 ALUSrc <= 1;
                 RegDst <= 0;
                 RegWrite <= 1;
                 ALUOp <= 6'b000000;
                 MemRead <= 1;
                 MemWrite <= 0;
                 MemToReg <= 0;
                 ALUShift <= 0;
                 branch <= 0;  
                 whb <= 2'b01;
                 jump <= 0; 
                 j_jrSrc <= 0;
                 ReadSp <= 0;              
             end
             
             //lb
             else if(Instruction[31:26] == 6'b100000) 
             begin
                 ALUSrc <= 1;
                 RegDst <= 0;
                 RegWrite <= 1;
                 ALUOp <= 6'b000000;
                 MemRead <= 1;
                 MemWrite <= 0;
                 MemToReg <= 0;
                 ALUShift <= 0;
                 branch <= 0;
                 whb <= 2'b10;
                 jump <= 0; 
                 j_jrSrc <= 0;
                 ReadSp <= 0;                
             end
             
             //sh
             else if(Instruction[31:26] == 6'b101001) 
             begin
                 ALUSrc <= 1;
                 RegDst <= 0;
                 RegWrite <= 0;
                 ALUOp <= 6'b000000;
                 MemRead <= 0;
                 MemWrite <= 1;
                 MemToReg <= 0;
                 ALUShift <= 0;
                 branch <= 0; 
                 whb <= 2'b01;
                 jump <= 0; 
                 j_jrSrc <= 0; 
                 ReadSp <= 0;               
             end
            
            //bgez and bltz
            else if(Instruction[31:26] == 6'b000001) 
            begin
            
                //bgez
                if(Instruction[20:16] == 6'b00001) //culprit
                begin
                    ALUSrc <= 0;
                    RegDst <= 0;
                    RegWrite <= 0;
                    ALUOp <= 6'b010101;
                    MemRead <= 0;
                    MemWrite <= 0;
                    MemToReg <= 0;
                    ALUShift <= 0;
                    branch <= 1;
                    whb <= 2'b0;
                    jump <= 0;
                    j_jrSrc <= 0; 
                    ReadSp <= 0;
                end
                
                //bltz
                else if(Instruction[20:16] == 6'b00000) //culprit
                begin
                    ALUSrc <= 0;
                    RegDst <= 0;
                    RegWrite <= 0;
                    ALUOp <= 6'b011010;
                    MemRead <= 0;
                    MemWrite <= 0;
                    MemToReg <= 0;
                    ALUShift <= 0;
                    branch <= 1;
                    whb <= 2'b0;
                    jump <= 0;
                    j_jrSrc <= 0;
                    ReadSp <= 0;
                end
            end
            
            //beq
            else if(Instruction[31:26] == 6'b000100) 
            begin
                ALUSrc <= 0;
                RegDst <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b010110;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 0;
                ALUShift <= 0;
                branch <= 1;
                whb <= 2'b0;
                jump <= 0;
                j_jrSrc <= 0;
                ReadSp <= 0;
            end
            
            //bne
            else if(Instruction[31:26] == 6'b000101) 
            begin
                ALUSrc <= 0;
                RegDst <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b010111;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 0;
                ALUShift <= 0;
                branch <= 1;
                whb <= 2'b0;
                jump <= 0;
                j_jrSrc <= 0;
                ReadSp <= 0;
            end
            
            //bgtz
            else if(Instruction[31:26] == 6'b000111) //culprit
            begin
                ALUSrc <= 0;
                RegDst <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b011000;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 0;
                ALUShift <= 0;
                branch <= 1;
                whb <= 2'b0;
                jump <= 0;   
                j_jrSrc <= 0; 
                ReadSp <= 0;         
            end
            
            //blez
            else if(Instruction[31:26] == 6'b000110) //culprit
            begin
                ALUSrc <= 0;
                RegDst <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b011001;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 0;
                ALUShift <= 0;
                branch <= 1;
                whb <= 2'b0;
                jump <= 0;
                j_jrSrc <= 0; 
                ReadSp <= 0;
            end
            
            //j
            else if(Instruction[31:26] == 6'b000010) //culprit
            begin
                ALUSrc <= 0;
                RegDst <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b011011;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 0;
                ALUShift <= 0;
                branch <= 0;
                jump <= 1;
                whb <= 2'b0;
                j_jrSrc <= 1;
                ReadSp <= 0;
            end
            
            //jal
            else if(Instruction[31:26] == 6'b000011)  //culprit
            begin
                ALUSrc <= 0;
                RegDst <= 0;
                RegWrite <= 1;
                ALUOp <= 6'b011101;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 1; 
                j_jrSrc <= 1;
                ReadSp <= 0;
            end
            
            //lui
            else if(Instruction[31:26] == 6'b001111) 
            begin
                ALUSrc <= 1;
                RegDst <= 0;
                RegWrite <= 1;
                ALUOp <= 6'b010100;
                MemRead <= 0;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUShift <= 0;
                branch <= 0;
                whb <= 2'b0;
                jump <= 0;
                j_jrSrc <= 0;
                ReadSp <= 0;
            end
        end
    end
endmodule
