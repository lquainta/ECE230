module adder(
    // Declare your A/B inputs
    // Declare Y output
    // Declare carry output
    input A,
    input B,
    output Y,
    output Carry
);

    // Enter logic equation here
    assign Y = A ^ B;
    assign Carry = A & B;

endmodule