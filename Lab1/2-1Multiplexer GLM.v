// Mark Mitri & Ryan Forelli
// 8/30/2021
// ECE 128
// Lab 1 Part 1

`timescale 1ns / 1ps

module multiplexer2to1(input x,input y,input s,output m);
    wire not_wire, and1_wire, and2_wire;
    not n1(not_wire, s);
    and a1(and1_wire, not_wire, x);
    and a2(and2_wire, s, y);
    or o1(m, and1_wire, and2_wire);
endmodule