module clock_div
#(
    parameter DIVIDE_BY = 17
)
(
    input clock,
    input reset,
    output reg div_clock
);

    wire [16:0] ff_out;
    wire [16:0] ff_in;
    
    assign ff_in[0] = ~ff_out[0];
    assign ff_in[16:1] = ff_out[15:0];
    always @ (posedge clock or posedge reset) begin
        if (reset)
            div_clock <= 1'b0;
        else
            div_clock <= ff_out[16];
    end
    
    genvar i;
    generate
        for (i = 0; i < 17; i = i + 1) begin: divider
            dff (
            .clock(clock),
            .reset(reset),
            .D(ff_in[i]),
            .Q(ff_out[i]),
            .NotQ(~ff_out[i])
            );
            end
     endgenerate    

endmodule