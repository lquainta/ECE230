module half_sub(

//inputs and outputs
input A, B,
output Y, Borrow

);

//equation logic
assign Y = A^B;
assign Borrow = ~A & B;

endmodule