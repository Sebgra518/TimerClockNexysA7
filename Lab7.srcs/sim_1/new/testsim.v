module testsim;

    reg [5:0] minutes;       // 6-bit input for minutes (0-59)
    reg [5:0] seconds;      // 6-bit input for seconds (0-59)
    wire [3:0] minutes10s; // Tens place of minutes (BCD)
    wire [3:0] minutes1s; // Ones place of minutes (BCD)
    wire [3:0] seconds10; // Tens place of seconds (BCD)
    wire [3:0] seconds1s;  // Ones place of seconds (BCD)

    DigitsSeperator uut (minutes,seconds,minutes10s,minutes1s,seconds10,seconds1s);
    
    initial begin
        minutes = 0; seconds = 0;
        #1 seconds = 1;
        #1 seconds = 2;
        #1 seconds = 3;
        #1 seconds = 4;
        #1 seconds = 5;
        #1 seconds = 6;
        #1 seconds = 7;
        #1 seconds = 8;
        #1 seconds = 9;
        #1 seconds = 10;
    end
    

endmodule
