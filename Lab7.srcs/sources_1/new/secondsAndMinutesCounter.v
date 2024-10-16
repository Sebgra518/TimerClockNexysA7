`timescale 1ns / 1ps

module secondsAndMinutesCounter(input slowClock,output reg [5:0] minutes,output reg [5:0] seconds);

initial begin
        minutes = 0;
        seconds = 0;
    end

    always @(posedge slowClock) begin
        seconds <= seconds + 1;

        if (seconds == 6'd59) begin
            seconds <= 0;              // Reset seconds
            minutes <= minutes + 1;    // Increment minutes
        end

        if (minutes == 6'd59 && seconds == 6'd59) begin
            minutes <= 0;
            
        end
    end
endmodule