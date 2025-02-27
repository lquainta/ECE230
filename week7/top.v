module top(
    input [15:0] sw,
    output [15:0] led
);
    assign led[0] = ~sw[0];
    
    genvar i;
    generate
        for (i = 1; i < 16; i = i + 1) begin
            assign led[i] = led[i - 1] ^ sw[i];
        end     
     endgenerate
    
endmodule
