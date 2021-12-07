`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2021 03:14:10 PM
// Design Name: 
// Module Name: ALU32Bit
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


module ALU32Bit(ALUControl, A, B, ALUResult, Zero, Hi_in, Hi_out, Lo_in, Lo_out, mov);

	input [5:0] ALUControl;                    // control bits for ALU operation
                                               // you need to adjust the bitwidth as needed
	input [31:0] A, B;	                       // inputs

    input [31:0] Hi_in, Lo_in;                         // Hi and Lo outputs combining to be 64 bit
	output reg [31:0] ALUResult, Hi_out, Lo_out;	           // answer
	output reg Zero;
	output reg mov;	                       // Zero=1 if ALUResult == 0
    
    reg [63:0] HiLo;                           // 64 bit value combination of Hi AND Lo
    reg [31:0] temp;
    
    
    always @(*)    
    begin
                 
        Zero <= 0;
        mov <= 1;
        
        /////////////////////////
        ////    Arithmetic   ////
        /////////////////////////
         
        // add (000000) A + B signed
        // also applicable for addi       
        if (ALUControl == 6'b000000)
        begin
            ALUResult <= $signed(A) + $signed(B);
            if (ALUResult == 0)
            begin
                Zero <= 1;
            end 
        end
        
        // addu (000010) A + B unsigned
        // also applicable for addiu          
        else if (ALUControl == 6'b000010)
        begin
           ALUResult <= A + B; //UNSIGNED
           if (ALUResult == 0)
           begin
                Zero <= 1;
           end           
        end
        
        // sub (000100) A - B        
        else if (ALUControl == 6'b000100)
        begin
           ALUResult <= $signed(A) - $signed(B);
           if (ALUResult == 0)
           begin
                Zero <= 1;
           end 
        end
             
        // mul (000101) A * B    
        else if (ALUControl == 6'b000101)    
        begin
           ALUResult <= $signed(A) * $signed(B);
           if (ALUResult == 0)
           begin
                Zero <= 1;
           end 
        end
         
        // mult (000110) A * B signed going to Hi and Lo
        else if (ALUControl == 6'b000110)   
        begin
            HiLo <= $signed(A) * $signed(B);
            Hi_out <= HiLo[63:32];
            Lo_out <= HiLo[31:0];
            if (HiLo == 0)
            begin
                Zero <= 1;
            end
         end
        
        // multu (000111) A * B unsigned going to Hi and Lo
        else if (ALUControl == 6'b000111)  
        begin
            HiLo <= A * B;
            Hi_out <= HiLo[63:32];
            Lo_out <= HiLo[31:0];
            if (HiLo == 0)
            begin
                Zero <= 1;
            end
         end
        
        // madd (001000) Add what's already in Hi and Lo to signed A * B
        else if (ALUControl == 6'b001000)   
        begin
            HiLo <= $signed({Hi_in, Lo_in}) + $signed(($signed(A) * $signed(B)));
            Hi_out <= $signed(HiLo[63:32]);
            Lo_out <= $signed(HiLo[31:0]); 
            if (HiLo == 0)
            begin
                Zero <= 1;
            end
         end
        
        // msub (001001) Subtract A * B from what's already in Hi and Lo    
        else if (ALUControl == 6'b001001)   
        begin
            HiLo <= $signed({Hi_in, Lo_in}) - $signed(($signed(A) * $signed(B)));        
            Hi_out <= $signed(HiLo[63:32]);
            Lo_out <= $signed(HiLo[31:0]);
            if (HiLo == 0)
            begin
                Zero <= 1;
            end
         end
            
        ////////////////////
        ////    Data    ////
        ////////////////////
        
        // lw, lh, lb, sw, sh, sb data instructions can be covered by addi
        
        // mthi (010000) Hi becomes A
         else if (ALUControl == 6'b010000)   
         begin
            Hi_out <= A;
         end
        
        // mtlo (010001) Lo becomes A
        else if (ALUControl == 6'b010001)   
        begin
            Lo_out <= A;
        end
         
        // mfhi (010010) Result of ALU becomes Hi
        else if (ALUControl == 6'b010010)   
        begin
            ALUResult <= Hi_in;
        end
        
        // mflo (010011) Result of ALU becomes Hi
        else if (ALUControl == 6'b010011)   
        begin
            ALUResult <= Lo_in;
        end
        
        // lui (010100) Load upper 16 bits of B
        else if (ALUControl == 6'b010100) 
        begin
            ALUResult <= {B[15:0], 16'b0};
            if (ALUResult == 0)
            begin
                Zero <= 1;
            end
        end
        
        //////////////////////
        ////    Branch    ////
        //////////////////////
          
        // bgez (010101) if A >= 0 then branch
        else if (ALUControl == 6'b010101) 
        begin
            if ($signed(A) >= 0)
            begin
                Zero <= 1;
            end
        end
          
        // beq (010110) if A == B then branch
        else if (ALUControl == 6'b010110) 
        begin
            if ($signed(A) == $signed(B))
            begin
                Zero <= 1;
            end
        end
          
        // bne (010111) if A !=  B then branch
        else if (ALUControl == 6'b010111) 
        begin
            if ($signed(A) != $signed(B))
            begin
                Zero <= 1;
            end
        end
          
        // bgtz (011000) if A > 0 then branch
        else if (ALUControl == 6'b011000) 
        begin
            if ($signed(A) > 0)
            begin
                Zero <= 1;
            end
        end
          
        // blez (011001) if A <= 0 then branch
        else if (ALUControl == 6'b011001) 
        begin
            if ($signed(A) <= 0)
            begin
                Zero <= 1;
            end
        end
          
        // bltz (011010) if A < 0 then branch
        else if (ALUControl == 6'b011010) 
        begin
            if ($signed(A) < 0)
            begin
                Zero <= 1;
            end
        end
          
//        // j (011011) PC = PC + I[25:0]
//        else if (ALUControl == 6'b011011)
//        begin
//            Zero <= 1;
//        end
          
//        // jr (011100) PC = rs
//        else if (ALUControl == 6'b011100) 
//        begin
//            Zero <= 1;
//        end
        
//        // jal (011101) PC = PC + I[25:0] and link
//        else if (ALUControl == 6'b011101) 
//        begin
//            Zero <= 1;
//        end
        
        ///////////////////////
        ////    Logical    ////
        ///////////////////////
          
        // and (011110) A & B
        // also applicable for andi
        else if (ALUControl == 6'b011110)   
        begin
           ALUResult <= A & B;
           if (ALUResult == 0)
           begin
                Zero <= 1;
           end
        end
          
        // or (100000) A | B
        // also applicable for ori
        else if (ALUControl == 6'b100000)   
        begin
            ALUResult <= A | B;
            if (ALUResult == 0)
            begin
                Zero <= 1;
            end
        end
          
        // nor (100001) ~(A | B)
        else if (ALUControl == 6'b100001)   
        begin
            ALUResult <= ~(A | B);
            if (ALUResult == 0)
            begin
                Zero <= 1;
            end
        end
          
        // xor (100010) (A & ~B) | (~A | B)
        // also applicable for xori
        else if (ALUControl == 6'b100010)   
        begin
            ALUResult <= (A & ~B) | (~A & B);
            if (ALUResult == 0)
            begin
                Zero <= 1;
            end
        end
          
        // seh (100110) Do sign extension on rightmost 16 bits of B
        else if (ALUControl == 6'b100110)   begin
              if (B[15] == 0)    
              begin
                  ALUResult <= {16'b0, B[15:0]};
              end
              else 
              begin    
                  ALUResult <= {16'b1111111111111111, B[15:0]};
              end
              if (ALUResult == 0)
              begin
                Zero <= 1;
              end
        end
          
        // sll (100111) B << A
        // also apllicable for sllv 
        else if (ALUControl == 6'b100111)   
        begin
            ALUResult <= B << A; 
            if (ALUResult == 0)
            begin
                Zero <= 1;
            end
        end
          
        // srl (101000) B >> A 
        // also applicable for srlv
        else if (ALUControl == 6'b101000)   
        begin
             ALUResult <= B >> A;
             if (ALUResult == 0)
             begin
                Zero <= 1;
             end
        end
        
        // slt (101100) A < B signed
        // also applicable for slti
        else if (ALUControl == 6'b101011)   
        begin
            ALUResult <= ($signed(A) < $signed(B));
            if (ALUResult == 0)
            begin
                Zero <= 1;
            end
        end
          
        // sltu (110101) A < B) unsigned
        // also applicable for sltiu
        else if (ALUControl == 6'b110101) 
        begin
            ALUResult <= (A < B);
            if (ALUResult == 0)
            begin
              Zero <= 1;
            end
        end
          
        // movn (101101) if B != 0 then take A
        else if (ALUControl == 6'b101101)  
        begin
            ALUResult <= A;
            if (B == 0)
            begin 
                mov <= 0;
            end
        end
          
        // movz (101110) if B == 0 then take A
        else if (ALUControl == 6'b101110)  
        begin
            ALUResult <= A;
            if (B != 0) 
            begin
                mov <= 0;
            end
        end
          
        // rotr (110000) rotate B with an A value
        // also applicable for rotrv
        else if (ALUControl == 6'b110000)
        begin
            ALUResult <= ((B >> A[4:0]) | (B << (32-A[4:0])));
            if (ALUResult == 0)
            begin
                Zero <= 1;
            end
        end
        
        // sra (110001) shift right and maintain sign
        // also applicable for srav
        else if (ALUControl == 6'b110001)  
        begin
            if (B[31] == 0)    
            begin
                ALUResult <= B >> A;
            end
            else 
            begin
                temp = (~B) >> A;
                ALUResult <= ~temp;
            end
            if (ALUResult == 0)
            begin
               Zero <= 1;
            end
          end
          
        // seb (110011) sign extension for rightmost byte
        else if (ALUControl == 6'b110011)   
        begin  
              if (B[7] == 0)    
              begin
                  ALUResult <= {24'b0, B[7:0]};
              end
              else 
              begin    
                  ALUResult <= {24'b111111111111111111111111, B[7:0]};
              end
              if (ALUResult == 0)
              begin
                Zero <= 1;
              end
        end
    end
endmodule
