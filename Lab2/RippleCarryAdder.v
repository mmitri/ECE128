// Mark Mitri & Ryan Forelli
// 9/6/2021
// ECE 128
// Lab 2 Part 3

`timescale 1ns / 1ps

module full_adder(input A, B, Cin, output SUM, Cout);
    wire wire1, wire2, wire3, wire4;
    xor x1(wire1, A, B);
    and a1(wire3, wire1, Cin);
    and a2(wire4, A, B);
    or o1(Cout, wire3, wire4);
    xor x2(SUM, wire1, Cin);
endmodule

module ripple_adder_4bit(input[3:0] num1, num2, output[4:0] result);
    wire carry1, carry2, carry3;full_adder bit0(num1[0], num2[0], 1'b0, result[0], carry1);
    full_adder bit1(num1[1], num2[1], carry1, result[1], carry2);
    full_adder bit2(num1[2], num2[2], carry2, result[2], carry3);
    full_adder bit3(num1[3], num2[3], carry3, result[3], result[4]);
endmodule