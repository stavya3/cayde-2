`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.04.2023 11:37:07
// Design Name: 
// Module Name: riscv_tb
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


module riscv_tb();

reg clk,reset;
 wire [31:0] WB_Data;
    
    
    /*************************** DUT ******************************/
    riscv dut (
        .clk, .reset,
         
        .WB_Data    
    );
    /**************************************************************/
    
    initial begin
           reset = 0;
           clk  = 1;
           #1 reset = 1;
           #1399 $finish;
    end
    always #10 clk = !clk;

endmodule
