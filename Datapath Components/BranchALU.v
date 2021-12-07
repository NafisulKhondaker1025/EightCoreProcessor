`timescale 1ns / 1ps

module BranchALU(A, B, Zero, OpCode, twenty2sixteen);
    input [5:0] OpCode;
    input [4:0] twenty2sixteen;
    input [31:0] A, B; 
    output reg Zero;
    
    initial
    begin
        Zero <= 0;
    end
    
    always @(*)
    begin
        // bgez (000001) if A >= 0 then branch // bltz (000001) if A < 0 then branch
        if (OpCode == 6'b000001)
        begin
            if (twenty2sixteen == 00001)
            begin 
                if ($signed(A) >= 0)
                begin
                    Zero <= 1;
                end
                else 
                begin
                    Zero <= 0;
                end
             end
             else
             begin
                if ($signed(A) < 0)
                begin
                    Zero <= 1;
                end
                else 
                begin
                    Zero <= 0;
                end
             end
         end
        // beq (000100) if A == B then branch
        else if (OpCode == 6'b000100) 
        begin
            if ($signed(A) == $signed(B))
            begin
                Zero <= 1;
            end
            else 
            begin
                Zero <= 0;
            end
        end
          
        // bne (000101) if A !=  B then branch
        else if (OpCode == 6'b000101) 
        begin
            if ($signed(A) != $signed(B))
            begin
                Zero <= 1;
            end
            else 
            begin
                Zero <= 0;
            end
        end
          
        // bgtz (000111) if A > 0 then branch
        else if (OpCode == 6'b000111) 
        begin
            if ($signed(A) > 0)
            begin
                Zero <= 1;
            end
            else 
            begin
                Zero <= 0;
            end
        end
          
        // blez (000110) if A <= 0 then branch
        else if (OpCode == 6'b000110) 
        begin
            if ($signed(A) <= 0)
            begin
                Zero <= 1;
            end
            else 
            begin
                Zero <= 0;
            end
        end
        
        // Do not branch
        else 
        begin
            Zero <= 0;
        end  
        
    end
endmodule
