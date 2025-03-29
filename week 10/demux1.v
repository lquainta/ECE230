module demux1(
    input data,
    input [1:0] sel,
    output reg A,
    output reg B,
    output reg C,
    output reg D
);

    always @(*) begin 
        case(sel)
            2'b00: {D, C, B, A} <= {1'b0, 1'b0, 1'b0, data}; 
            2'b01: {D, C, B, A} <= {1'b0, 1'b0, data, 1'b0};
            2'b10: {D, C, B, A} <= {1'b0, data, 1'b0, 1'b0};
            2'b11: {D, C, B, A} <= {data, 1'b0, 1'b0, 1'b0};
        endcase
    end

endmodule