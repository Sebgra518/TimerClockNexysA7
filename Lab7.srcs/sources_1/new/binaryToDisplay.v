module binaryToDisplay(in,slowclock,display);
input [2:0] in;
input slowclock;
output reg [6:0] display;

always @ (in,slowclock) begin
    if(slowclock == 1)
        case(in)
            3'd0 : display = 7'b0001001;//H
            3'd1 : display = 7'b0000110;//E
            3'd2 : display = 7'b1000111;//L
            3'd3 : display = 7'b1000111;//L
            3'd4 : display = 7'b1000000;//O
            3'd5 : display = 7'b1111111;//
            3'd6 : display = 7'b1111111;//
            3'd7 : display = 7'b1111111;//
        endcase
    else 
        case(in)
            3'd0 : display = 7'b1000010;//G
            3'd1 : display = 7'b0100011;//o
            3'd2 : display = 7'b0100011;//o
            3'd3 : display = 7'b0100001;//d
            3'd4 : display = 7'b0000011;//b
            3'd5 : display = 7'b0011001;//y
            3'd6 : display = 7'b0000110;//E
            3'd7 : display = 7'b1111111;//
        endcase
    end
endmodule
