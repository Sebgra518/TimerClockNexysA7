`timescale 1ns / 1ps

module counter2bit (
    input fastClock,
    output reg [1:0] countOut
);

    // Initialize countOut to 0
    initial begin
        countOut = 2'b00;
    end

    always @(posedge fastClock) begin
        countOut <= countOut + 1;
    end
endmodule
