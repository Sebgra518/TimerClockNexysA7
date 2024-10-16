`timescale 1ns / 1ps


module SlowClock(input clock,output reg slowClock);

initial begin
        slowClock = 0;
    end

reg [26:0] counter;

    always @ (posedge clock) begin
	  counter = counter +1;
	  if (counter == 50_000_000) //100_000_000
		begin
			slowClock=~slowClock;
			counter =0;
		end
      end
endmodule
