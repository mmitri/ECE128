// Mark Mitri & Ryan Forelli
// 9/6/2021
// ECE 128
// Lab 2 Part 2

`timescale 1ns / 1ps

module gray_to_bcd_converter(input[3:0] gray,output reg[6:0] segments,output reg led,output reg[7:0] characters);
    reg[3:0] bcd;
    always @ (*) //event-sensitivity list
        begin
            led = 1'b0;
            characters = 8'b11111110;
            case (gray) //Cases for lighting up each number
                4'b0000 : bcd = 4'b0000;
                4'b0001 : bcd = 4'b0001;
                4'b0011 : bcd = 4'b0010;
                4'b0010 : bcd = 4'b0011;
                4'b0110 : bcd = 4'b0100;
                4'b1110 : bcd = 4'b0101;
                4'b1010 : bcd = 4'b0110;
                4'b1011 : bcd = 4'b0111;
                4'b1001 : bcd = 4'b1000;4'b1000 : bcd = 4'b1001;
                default:
                    begin
                        led = 1'b1;
                        segments = 7'b1111111;
                        characters = 8'b11111111;
                    end
            endcase
            case (bcd) //Cases for lighting up each number
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