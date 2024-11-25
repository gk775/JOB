`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2024 14:41:09
// Design Name: 
// Module Name: BCDAdder8Bit_tb
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


`timescale 1ns / 1ps

module BCDAdder8Bit_tb;

    logic [7:0] A, B;
    logic Cin;
    logic [7:0] S;
    logic Cout;

    BCDAdder8Bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        A = 8'b0001_0010;
        B = 8'b0000_0101;
        Cin = 0;
        #10;

        A = 8'b0010_1001;
        B = 8'b0001_1001;
        Cin = 1;
        #10;

        A = 8'b0100_0101;
        B = 8'b0101_0101;
        Cin = 0;
        #10;

        A = 8'b1001_1001;
        B = 8'b0000_0001;
        Cin = 0;
        #10;

        $finish;
    end

endmodule

