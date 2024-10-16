`timescale 1ns / 1ps

module top(CLK,C,AN,DP);
    input CLK;
    output [7:0] AN;
    output DP;
    output [6:0] C;
    
    wire slowclock,m,s;
    wire [3:0] minTen,minUnit,secTen,secUnit;
    
    
    
    secondsAndMinutesCounter(CLK,m,s);
    BinaryToBCD Minutes(m,minTen,minUnit);
    BinaryToBCD Seconds(s,secTen,secUnit);
    
    
    

endmodule
