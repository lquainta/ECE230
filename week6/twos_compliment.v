module twos_compliment(

input [7:0] A,
output [7:0] out
);
    wire [8:0] carryBit;
    full_adder fadder(
        .A(~A[0]),
        .B(1),
        .Cin(0),
        .Cout(carryBit[0]),
        .Y(out[0])
    );
    
genvar i; 



generate

for (i=1 ; i < 8; i=i+1)begin
    full_adder fa_i(
        .A(~ A[i]),
        .B(1'b0),
        .Cin(carryBit[i-1]),
        .Cout(carryBit[i]),
        .Y(out[i])
    );
end


endgenerate 
endmodule