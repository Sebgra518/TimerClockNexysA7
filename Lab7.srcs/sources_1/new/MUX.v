`timescale 1ns / 1ps


module MUX(
    input [1:0] dispalycount,
    input [3:0] min10s,
    input [3:0] min1s,
    input [3:0] sec10s,
    input [3:0] sec1s,
    output reg [3:0] out,
    output reg [7:0] an
    );
    
    initial begin
        out = 0;
        an = 0;
    end
    
    always @ (dispalycount) begin
        case(dispalycount)
            2'd0 : begin
                    out <= min10s;
                    an = 8'b11110111;
                   end
            2'd1 : begin
                    out <= min1s;
                    an = 8'b11111011;
                   end
            2'd2 : begin
                    out <= sec10s;
                    an = 8'b11111101;
                   end
            2'd3 : begin
                    out <= sec1s;
                    an = 8'b11111110;
                   end
        endcase
    end
    
    
endmodule
