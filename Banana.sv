`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2024 14:35:45
// Design Name: 
// Module Name: BCDAdder8Bit
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


module BCDAdder8Bit (
    input logic [7:0] A,      
    input logic [7:0] B,      
    input logic Cin,          
    output logic [7:0] S,     
    output logic Cout         
);

    logic [3:0] lower_sum, upper_sum;
    logic lower_carry, upper_carry;

    BCDAdder4Bit lower_bcd_adder (
        .A(A[3:0]),
        .B(B[3:0]),
        .Cin(Cin),
        .S(lower_sum),
        .Cout(lower_carry)
    );

    BCDAdder4Bit upper_bcd_adder (
        .A(A[7:4]),
        .B(B[7:4]),
        .Cin(lower_carry),
        .S(upper_sum),
        .Cout(upper_carry)
    );

    assign S = {upper_sum, lower_sum};
    assign Cout = upper_carry;

endmodule

module BCDAdder4Bit (
    input logic [3:0] A,      
    input logic [3:0] B,      
    input logic Cin,          
    output logic [3:0] S,     
    output logic Cout         
);

    logic [4:0] binary_sum;    
    logic correction_needed;   

    assign binary_sum = A + B + Cin;

    assign correction_needed = (binary_sum > 9) ? 1 : 0;

    assign S = correction_needed ? (binary_sum + 4'd6) : binary_sum[3:0];
    assign Cout = correction_needed || binary_sum[4];

endmodule

