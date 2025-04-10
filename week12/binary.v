module binary(
    input reset,
    input w,
    input clk,
    output z,
    output [2:0]states
);

    wire [2:0] State;
    wire [2:0] Next;

    dff zero(
        .D(Next[0]),
        .clk(clk),
        .Q(State[0]),
        .Default(1'b0),
        .reset(resert)
    );

    dff one(
        .D(Next[1]),
        .clk(clk),
        .Q(State[1]),
        .Default(1'b0),
        .reset(resert)
    );
    
    dff two(
        .D(Next[2]),
        .clk(clk),
        .Q(State[2]),
        .Default(1'b0),
        .reset(resert)
    );

    assign z = State[2] | (State[0] & State[1]);
    
    assign Next[0] = (~State[2] & ~State[1] & ~State[0])
     | (~w & ~State[2] & ~State[1])
     | (~State[0] & ~w & ~State[1]) 
     | (w & ~State[2] & State[1]);
     
    assign Next[1] = (~State[2] & ~State[1] & State[0]) 
    | (~State[0] & w & ~State[2]) 
    | (~State[2] & State[1] & ~State[0]);
  
    assign Next[2] = (State[1] & State[0] & w) 
    | (State[2] & w);
    
    assign states = {State[2], State[1], State[0]};
    
endmodule