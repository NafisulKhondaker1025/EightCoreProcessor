`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2021 01:09:59 AM
// Design Name: 
// Module Name: THE_BIGGER_SAD
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


module THE_BIGGER_SAD(v1_A, v0_A, MIN_A,
                      v1_B, v0_B, MIN_B,  
                      v1_C, v0_C, MIN_C,  
                      v1_D, v0_D, MIN_D,
                      v1_E, v0_E, MIN_E,
                      v1_F, v0_F, MIN_F,
                      v1_G, v0_G, MIN_G,
                      v1_H, v0_H, MIN_H,
                      v1_final, v0_final, MIN_final);
                      
    input [31:0] v1_A, v0_A, MIN_A,
                 v1_B, v0_B, MIN_B,  
                 v1_C, v0_C, MIN_C,  
                 v1_D, v0_D, MIN_D,
                 v1_E, v0_E, MIN_E,
                 v1_F, v0_F, MIN_F,
                 v1_G, v0_G, MIN_G,
                 v1_H, v0_H, MIN_H;

output reg [31:0] v1_final, v0_final, MIN_final;
    
    reg [31:0] MIN_temp;
    reg [31:0] v1_temp, v0_temp;
    
    initial
    begin
        MIN_temp <= 10000;
        MIN_final <= MIN_temp;
        v0_final <= 0;
        v1_final <= 0;
    end
    
    always @(*)
    begin
        if (MIN_A <= MIN_temp) 
        begin
            v0_temp = v0_A;
            v1_temp = v1_A;
            MIN_temp = MIN_A;
        end 
        if (MIN_B <= MIN_temp) 
        begin
            v0_temp = v0_B;
            v1_temp = v1_B;
            MIN_temp = MIN_B;
        end 
        if (MIN_C <= MIN_temp) 
        begin
            v0_temp = v0_C;
            v1_temp = v1_C;
            MIN_temp = MIN_C;
        end 
        if (MIN_D <= MIN_temp) 
        begin
            v0_temp = v0_D;
            v1_temp = v1_D;
            MIN_temp = MIN_D;
        end
        if (MIN_E <= MIN_temp) 
        begin
            v0_temp = v0_E;
            v1_temp = v1_E;
            MIN_temp = MIN_E;
        end
        if (MIN_F <= MIN_temp) 
        begin
            v0_temp = v0_F;
            v1_temp = v1_F;
            MIN_temp = MIN_F;
        end
        if (MIN_G <= MIN_temp) 
        begin
            v0_temp = v0_G;
            v1_temp = v1_G;
            MIN_temp = MIN_G;
        end
        if (MIN_H <= MIN_temp) 
        begin
            v0_temp = v0_H;
            v1_temp = v1_H;
            MIN_temp = MIN_H;
        end
        
        MIN_final = MIN_temp;
        v0_final = v0_temp;
        v1_final = v1_temp;
        
    end
                      
           
endmodule
