`timescale 1ns / 1ps
 //Group 6: Kevin Gilman 33.333%, Ahmad Eladawy 33.333%, Nafisul Khondaker 33.333%
 //5 stage pipeline [Fetch, Decode, Execute, Memory, Writeback]
 //Branch is resolved in the Decode stage


module Top_tb();
    reg Clk, PC_Rst;
    wire [31:0] v1, v0, PCValue, MIN, test1, test2, test3, test4;
    
    //module Top(Clk, IM_Rst, PC_Rst, CurrentPC, RdContents);
    Top2 Top_tb(Clk, PC_Rst, v1, v0, PCValue, MIN, test1, test2, test3, test4);
    
    
    
    initial begin
        Clk <= 1'b0;
        forever #50 Clk <= ~Clk;
    end
    initial begin
        PC_Rst <= 1;
        #100
        PC_Rst <= 0;
    end

endmodule
