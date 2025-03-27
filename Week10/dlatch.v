module dlatch(
    input D, EN,
    output reg Q,
    output NotQ
    );
        
        always @ (EN) begin
            if (EN)
                Q <= D;
        end
    assign NotQ = ~Q;            
    
endmodule
