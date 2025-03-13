module mux(
    input [3:0]A, B, C, D,
    input Enable,
    input [1:0] Sel,
    output [3:0]Out
    
    );
    
    assign Out = (Enable) ? ((Sel == 2'b00) ? A : 
                            ((Sel == 2'b01) ? B : 
                            ((Sel == 2'b10) ? C : 
                            ((Sel == 2'b11) ? D : 0)))): 0;

endmodule
