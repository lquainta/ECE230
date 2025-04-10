module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    one_hot hot (
    .reset(btnU),
    .clk(btnC),
    .w(sw),
    .z(led[0]),
    .onehot_states(led[6:2])
    );
    
    binary bin (
    .reset(btnU),
    .clk(btnC),
    .w(sw),
    .z(led[1]),
    .states(led[9:7])
    );
    // Hook up binary and one-hot state machines

endmodule