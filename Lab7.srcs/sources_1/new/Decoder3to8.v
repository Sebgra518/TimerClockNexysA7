`timescale 1ns / 1ps

module Decoder3to8(X,W);
    input [2:0] X;
    output reg [7:0] W;
    
    always @ (X) begin
        case(X)
            3'd0 : W = 8'b01111111;
            3'd1 : W = 8'b10111111;
            3'd2 : W = 8'b11011111;
            3'd3 : W = 8'b11101111;
            3'd4 : W = 8'b11110111;
            3'd5 : W = 8'b11111011;
            3'd6 : W = 8'b11111101;
            3'd7 : W = 8'b11111110;
        endcase
    end
endmodule
