module maxterm (
    input A, B, C, D,
    output Y
);

assign Y = (~B | ~D) & (~A | ~D) & (C | D | B);// Enter your equation here

endmodule
