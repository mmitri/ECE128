// Mark Mitri & Ryan Forelli
// 9/6/2021
// ECE 128
// Lab 2 Part 1

`timescale 1ns / 1ps

module SevenSeg(input[3:0] number,output reg[6:0] segments,output reg led,output reg[7:0] characters); //Characters on the FPGA dev board. We only use character AN0
    always @ (*) //event-sensitivity list
    begin
        led = 1'b0;
        characters = 8'b11111110;
        case (number) //Cases for lighting up each number
            0 : segments = 7'b1000000;
            1 : segments = 7'b1111001;
            2 : segments = 7'b0100100;
            3 : segments = 7'b0110000;
            4 : segments = 7'b0011001;
            5 : segments = 7'b0010010;
            6 : segments = 7'b0000010;
            7 : segments = 7'b1111000;
            8 : segments = 7'b0000000;
            9 : segments = 7'b0010000;
            default:
                begin
                led = 1'b1;
                segments = 7'b1111111;
                characters = 8'b11111111;
                end
        endcase
    end
endmodule