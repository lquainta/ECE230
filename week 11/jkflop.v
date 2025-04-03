module jkflop(
    input J,K,clk,
    output Q,
    output notQ
    );
    
    assign D = (J & notQ) | (~K & Q);
    
    dflop jk (
    .D(D),
    .clk(clk),
    .Q(Q),
    .notQ(notQ)
    );
endmodule
