

`timescale 1ns / 1ps

module DigitsSeperator(
    input [5:0] minutes,        // 6-bit input for minutes (0-59)
    input [5:0] seconds,        // 6-bit input for seconds (0-59)
    output reg [3:0] minutes10s, // Tens place of minutes (BCD)
    output reg [3:0] minutes1s,  // Ones place of minutes (BCD)
    output reg [3:0] seconds10s, // Tens place of seconds (BCD)
    output reg [3:0] seconds1s   // Ones place of seconds (BCD)
);


    reg [7:0] bcd_min;
    reg [7:0] bcd_sec;             // 8-bit BCD register for conversion
    integer i;                // Loop index


 always @(minutes) begin
        bcd_min = 8'd0;           // Initialize BCD to 0 before conversion

        // Shift-add-3 (Double Dabble algorithm)
        for (i = 5; i >= 0; i = i - 1) begin
            // Shift the BCD result left by 1 bit to make space for next bit
            bcd_min = bcd_min << 1;
            
            // Insert the current binary bit into the least significant bit of BCD
            bcd_min[0] = minutes[i];

            // Apply the add-3 correction if the tens or ones BCD digits are >= 5
            if (bcd_min[7:4] >= 5)
                bcd_min[7:4] = bcd_min[7:4] + 3;
            else if (bcd_min[3:0] >= 5)
                bcd_min[3:0] = bcd_min[3:0] + 3;
        end

        // Extract the BCD tens and ones digits
        minutes10s = bcd_min[7:4];
        minutes1s = bcd_min[3:0];
    end
    

    always @(seconds) begin
        bcd_sec = 8'd0;           // Initialize bcd_sec to 0 before conversion

        // Shift-add-3 (Double Dabble algorithm)
        for (i = 5; i >= 0; i = i - 1) begin
            // Shift the BCD result left by 1 bit to make space for next bit
            bcd_sec = bcd_sec << 1;
            
            // Insert the current seconds bit into the least significant bit of BCD
            bcd_sec[0] = seconds[i];

            if (i > 0) begin
            // Apply the add-3 correction if the tens or ones BCD digits are >= 5
            if (bcd_sec[7:4] >= 5)
                bcd_sec[7:4] = bcd_sec[7:4] + 3;
            else if (bcd_sec[3:0] >= 5)
                bcd_sec[3:0] = bcd_sec[3:0] + 3;
                end
                
        end

        // Extract the BCD tens and ones digits
        seconds10s = bcd_sec[7:4];
        seconds1s = bcd_sec[3:0];
    end 
    
    

endmodule






