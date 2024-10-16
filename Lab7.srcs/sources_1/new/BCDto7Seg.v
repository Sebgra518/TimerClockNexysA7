`timescale 1ns / 1ps


module BCDto7Seg(input [3:0] BCD,output reg [6:0] seg7);
    
    initial begin
        seg7 = 0;
    end
    
    always @ (BCD) begin
        case(BCD)
            4'd0 : seg7 = 7'b1000000;
            4'd1 : seg7 = 7'b1111001;
            4'd2 : seg7 = 7'b0100100;
            4'd3 : seg7 = 7'b0110000;
            4'd4 : seg7 = 7'b0011001;
            4'd5 : seg7 = 7'b0010010;
            4'd6 : seg7 = 7'b0000010;
            4'd7 : seg7 = 7'b1111000;
            4'd8 : seg7 = 7'b0000000;
            4'd9 : seg7 = 7'b0010000;
        endcase
    end
    
    
endmodule
