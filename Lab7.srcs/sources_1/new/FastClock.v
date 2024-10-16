`timescale 1ns / 1ps

module FastClock(input clock,output reg fastClock);

initial begin
        fastClock = 0;
    end

reg [26:0] counter;
    always @ (posedge clock) begin
	  counter = counter +1;
	  if (counter == 100_000) //100_000
		begin
			fastClock=~fastClock;
			counter =0;
		end
      end
endmodule
