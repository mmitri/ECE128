// Mark Mitri & Ryan Forelli
// 8/30/2021
// ECE 128
// Lab 1 Part 3

`timescale 1ns / 1ps

module mux_2bit_2_to_1_dataflow(input [1:0] x,input [1:0] y,input s,output [1:0] m);
    assign m[0] = (x[0] & ~s) | (y[0] & s);
    assign m[1] = (x[1] & ~s) | (y[1] & s);
endmodule