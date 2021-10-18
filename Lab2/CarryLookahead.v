// Mark Mitri & Ryan Forelli
// 9/6/2021
// ECE 128
// Lab 2 Part 4

`timescale 1ns / 1ps

module carry_lookahead_adder(input A, B, Cin, output SUM, Pi, Gi);
    wire wire1;
    xor x1(wire1, A, B);
    xor x2(SUM, wire1, Cin);
    or o1(Pi, A, B);
    and a1(Gi, A, B);
endmodule

module carry_lookahead_adder_4bit(input[3:0] num1, num2, output[4:0] result);
    wire c1, c2, c3;
    wire p0, p1, p2, p3, g0, g1, g2, g3;
    carry_lookahead_adder bit0(num1[0], num2[0], 1'b0, result[0], p0, g0);
    carry_lookahead_adder bit1(num1[1], num2[1], c1, result[1], p1, g1);carry_lookahead_adder bit2(num1[2], num2[2], c2, result[2], p2, g2);
    carry_lookahead_adder bit3(num1[3], num2[3], c3, result[3], p3, g3); //Generate function gi is last carry
    wire wire1, wire2, wire3, wire4, wire5, wire6, wire7, wire8, wire9, wire10, wire11, wire12;
    // //C1=G0+P0C0
    // and a1(wire1, p0, 1'b0);
    // or o1(c1, wire1, g0);
    //Simplified version
    //C1=G0
    buf(c1, g0);
    // //C2=G1+P1C1 = G1+P1G0+P1P0C0
    // and a2(wire2, g0, p1);
    // and a3(wire3, p1, p0);
    // and a4(wire4, wire3, 1'b0);
    // or o2(wire5, wire2, wire4);
    // or o3(c2, g1, wire5);
    //Simplified verion
    //C2=G1+P1G0
    and a1(wire1, g0, p1);
    or o1(c2, wire1, g1);
    //C3=G2+P2C2 = G2+P2G1+P2P1G0+P2P1P0C0
    // and a5(wire6, p2, p1);
    // and a6(wire7, p0, wire6);
    // and a7(wire8, 1'b0, wire7);
    // and a8(wire9, g0, wire6);
    // and a9(wire10, g1, p2);
    // or o4(wire11, g2, wire10);
    // or o5(wire12, wire11, wire9);
    // or o6(c3, wire12, wire8);
    //Simplified version
    //C3=G2+P2G1+P2P1G0
    and a2(wire2, g1, p2);
    and a3(wire3, p1, p2);
    and a4(wire4, wire3, g0);
    or o2(wire5, g2, wire2);
    or o3(c3, wire4, wire5);
    //Simplified version, find c4 (MSB of answer)
    //C4=G3+P3G2+P3P2G1+P3P2P1G0
    and a5(wire6, p3, p2);
    and a6(wire7, p1, wire6);
    and a7(wire8, g0, wire7);
    and a8(wire9, g1, wire6);
    and a9(wire10, g2, p3);
    or o4(wire11, g3, wire10);
    or o5(wire12, wire11, wire9);
    or o6(result[4], wire12, wire8);
endmodule