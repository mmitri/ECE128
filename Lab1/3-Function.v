// Mark Mitri & Ryan Forelli
// 8/30/2021
// ECE 128
// Lab 1 Part 2

`timescale 1ns / 1ps

module functions(input A, input B,input C,input D,input E,output F1,output F2,output F3);
    assign F1 = (A & B & ~C) | (A & B & ~D) | (B & C & D);
    assign F2 = (B & ~C & D & E) | (A & C & E) | (A & ~B & D) + (A & ~D & E);
    //Logic minimization with K-map
    assign F3 = (~B & ~C) | (A & ~C) | (B & D) | (~A & C & ~D);
endmodule
