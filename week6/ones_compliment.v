module ones_compliment(

input [3:0] A,B,
output [3:0] comp
);
    wire [7:0] carryBit;
    wire [3:0] intr_sum;
    
    full_adder fadder0(
        .A(A[0]),
        .B(~B[0]),
        .Cin(0),
        .Cout(carryBit[0]),
        .Y(intr_sum[0])
    );
    
    full_adder fadder1(
        .A(A[1]),
        .B(~B[1]),
        .Cin(carryBit[0]),
        .Cout(carryBit[1]),
        .Y(intr_sum[1])
    );
    
    full_adder fadder2(
        .A(A[2]),
        .B(~B[2]),
        .Cin(carryBit[1]),
        .Cout(carryBit[2]),
        .Y(intr_sum[2])
    );
    
    full_adder fadder3(
        .A(A[3]),
        .B(~B[3]),
        .Cin(carryBit[2]),
        .Cout(carryBit[3]),
        .Y(intr_sum[3])
    );
    
    full_adder fadder4(
        .A(intr_sum[0]),
        .B(1'b0),
        .Cin(carryBit[3]),
        .Cout(carryBit[4]),
        .Y(comp[0])
        
    );

    full_adder fadder5(
        .A(intr_sum[1]),
        .B(1'b0),
        .Cin(carryBit[4]),
        .Cout(carryBit[5]),
        .Y(comp[1])
        
    );    
    
    full_adder fadder6(
        .A(intr_sum[2]),
        .B(1'b0),
        .Cin(carryBit[5]),
        .Cout(carryBit[6]),
        .Y(comp[2])
        
    );  
    
    full_adder fadder7(
        .A(intr_sum[3]),
        .B(1'b0),
        .Cin(carryBit[6]),
        .Cout(carryBit[7]),
        .Y(comp[3])
        
    );        
endmodule