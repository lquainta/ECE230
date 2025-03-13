module demux (
    input [3:0] In,
    input Enable,
    input [1:0] Sel,
    output [3:0] A, B, C, D
    );
    
    assign A = (Enable) ? ((Sel == 2'b00) ? In : 0) : 0;
    assign B = (Enable) ? ((Sel == 2'b01) ? In : 0) : 0;
    assign C = (Enable) ? ((Sel == 2'b10) ? In : 0) : 0;
    assign D = (Enable) ? ((Sel == 2'b11) ? In : 0) : 0;
    
endmodule