module top(
    input [15:0] sw,
    output [15:0] led
);
    assign led[0] = sw[0] & sw[10];
    assign led[8] = sw[15];
    assign led[9] = sw[15] | sw[14];
    assign led[1] = sw[13] ^ sw[12];
    // Enter your equation here

endmodule
