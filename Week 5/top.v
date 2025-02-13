// Implement top level module
module top(
    input [7:0]sw,
    output [5:0]led
);
    light stair_light(
        .downstairs(sw[0]),
        .upstairs(sw[1]),
        .stair_light(led[0])
    );
    adder adder(
        .A(sw[2]),
        .B(sw[3]),
        .Y(led[1]),
        .Carry(led[2])
    );
    wire MSB_in;
    full_adder LSB_adder(
        .A(sw[4]),
        .B(sw[6]),
        .Y(led[3]),
        .Cin(1'b0),
        .Cout(MSB_in)
    );
    full_adder MSB_adder(
        .A(sw[5]),
        .B(sw[7]),
        .Cin(MSB_in),
        .Y(led[4]),
        .Cout(led[5])
    );

endmodule