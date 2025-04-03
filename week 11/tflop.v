module tflop(
    input T,clk,
    output Q,
    output notQ
    );
    
    jkflop T_flip (
    .J(T),
    .K(T),
    .clk(clk),
    .Q(Q),
    .notQ(notQ)
    );
    
endmodule
