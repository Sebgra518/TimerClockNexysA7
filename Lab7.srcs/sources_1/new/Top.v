`timescale 1ns / 1ps

module Top(input CLK100MHZ,output [6:0] SEG,output [7:0] AN,output DP);

assign DP = 1;

wire fastclock;
wire slowclock;

wire [1:0] dispalyCount;

wire [5:0] bianryMinutes;
wire [5:0] bianrySeconds;

wire [3:0] min10s;
wire [3:0] min1s;
wire [3:0] sec10s;
wire [3:0] sec1s;

wire [3:0] currentBCD;

//Clocks
FastClock clock1(CLK100MHZ,fastclock);
SlowClock clock2(CLK100MHZ,slowclock);


//Segment Loop
counter2bit counter(fastclock,dispalyCount);


//Timer
secondsAndMinutesCounter samc(slowclock,bianryMinutes,bianrySeconds);
DigitsSeperator ds(bianryMinutes,bianrySeconds,min10s,min1s,sec10s,sec1s);

MUX multiplexer(dispalyCount,min10s,min1s,sec10s,sec1s,currentBCD,AN);
BCDto7Seg bcd7seg(currentBCD,SEG);

    
endmodule
