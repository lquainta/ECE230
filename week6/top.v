module top(
    input[9:0]sw,
    output[13:0]led

);
        half_sub hsub(
        .A(sw[0]),
        .B(sw[1]),
        .Y(led[0]),
        .Borrow(led[1])
        
        );
        
        ones_compliment oneSub(
        .A(sw[5:2]),
        .B(sw[9:6]),
        .comp(led[5:2])
        );
        
        twos_compliment twoSub(
        .A(sw[9:2]),
        .out(led[13:6])
        );

endmodule
