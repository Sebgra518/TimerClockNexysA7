module BinaryToBCD (binary,BCD_tens,BCD_ones);

    input wire [5:0] binary;
    output reg [3:0] BCD_tens;
    output reg [3:0] BCD_ones;
    
    reg [6:0] shift_reg; // Shift register to hold the binary number and BCD
    integer i;

    always @(*) begin
        // Initialize BCD outputs
        BCD_tens = 0;
        BCD_ones = 0;
        shift_reg = {1'b0, binary}; // Prepend a 0 to the binary input

        // Convert binary to BCD
        for (i = 0; i < 6; i = i + 1) begin
            // Shift left
            shift_reg = {shift_reg[5:0], 1'b0};

            // Add 3 to any BCD digit that is 5 or more
            if (BCD_ones >= 5) begin
                BCD_ones = BCD_ones + 3;
            end
            if (BCD_tens >= 5) begin
                BCD_tens = BCD_tens + 3;
            end

            // Shift the BCD digits left
            BCD_ones = {BCD_ones[2:0], shift_reg[6]};
            BCD_tens = {BCD_tens[2:0], BCD_ones[3]};
            BCD_ones = {BCD_ones[2:0], 1'b0}; // Shift units right after moving to tens
        end
    end

endmodule
