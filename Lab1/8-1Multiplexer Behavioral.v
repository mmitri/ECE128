// Mark Mitri & Ryan Forelli
// 8/30/2021
// ECE 128
// Lab 1 Part 4

`timescale 1ns / 1ps

module multiplexer_8to1_behav(input a,input b,input c,input d,input e,input f,input g,input h,input [2:0] s,output reg m);
    // * is equivalent to all
    always @ (*)
        begin
        case (s)
            0 : m = a;
            1 : m = b;
            2 : m = c;
            3 : m = d;
            4 : m = e;
            5 : m = f;
            6 : m = g;
            7 : m = h;
        endcase
    end
endmodule