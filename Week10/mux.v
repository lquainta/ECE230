module mux(
    input [7:0]A, B, C, D,
    input [1:0] sel,
    output reg [7:0]Out
    
    );
    
    always @(*) begin 
        case(sel)
            2'b00: Out <= A; 
            2'b01: Out <= B;
            2'b10: Out <= C;
            2'b11: Out <= D;
        endcase
    end

endmodule