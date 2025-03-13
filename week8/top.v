module top(
    input[15:0]sw,
    input btnL, btnR, btnU, btnD, btnC,
    output[15:0]led
    
    );
    
        wire[3:0] data;
        mux mux(
        .A(sw[3:0]),
        .B(sw[7:4]),
        .C(sw[11:8]),
        .D(sw[15:12]),
        .Enable(btnC),
        .Sel({btnU,btnL}),
        .Out(data)
        );
        
        demux demux(
        .In(data),
        .Enable(btnC),
        .Sel({btnR,btnD}),
        .A(led[3:0]),
        .B(led[7:4]),
        .C(led[11:8]),
        .D(led[15:12])
        );
    
    
endmodule
