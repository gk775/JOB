`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2024 15:33:36
// Design Name: 
// Module Name: Jackfruit_tb
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


module tb_p_adder;

    logic [31:0] a, b;
    logic cin;
    logic [31:0] s;
    logic cout;

    p_adder uut (a, b, cin, s, cout);

    initial begin
        a = 32'h00000000; b = 32'h00000000; cin = 1'b0;
        #10 a = 32'h00000001; b = 32'h00000001; cin = 1'b0;
        #10 a = 32'h10101001; b = 32'h00000001; cin = 1'b0;
        #10 a = 32'h10000010; b = 32'h11011011; cin = 1'b0;
        #10 a = 32'h10101010; b = 32'h00110101; cin = 1'b1;
        #10 a = 32'h10101010; b = 32'h00000000; cin = 1'b1;
        #10 $finish;
    end

endmodule
