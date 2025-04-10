module one_hot(
    input reset,
    input w,
    input clk,
    output z,
    output [4:0]onehot_states
);
    wire Anext, Bnext, Cnext, Dnext, Enext;
    wire Astate, Bstate, Cstate, Dstate, Estate;

    dff Adff(
        .Default(1'b1),
        .D(Anext),
        .clk(clk),
        .Q(Astate),
        .reset(reset)
    );

    dff Bdff(
        .Default(1'b0),
        .D(Bnext),
        .clk(clk),
        .Q(Bstate),
        .reset(reset)
    );

    dff Cdff(
        .Default(1'b0),
        .D(Cnext),
        .clk(clk),
        .Q(Cstate),
        .reset(reset)
    );
    
    dff Ddff(
        .Default(1'b0),
        .D(Dnext),
        .clk(clk),
        .Q(Dstate),
        .reset(reset)
        );
        
    dff Edff(
        .Default(1'b0),
        .D(Enext),
        .clk(clk),
        .Q(Estate),
        .reset(reset)
        );

    assign z = Estate | Cstate;
    assign Anext=1'b0;
    assign Bnext = (~w & Dstate) | (~w & Estate) | (~w & Astate);
    assign Cnext = (~w & Cstate) | (~w & Bstate);
    assign Dnext = (w & Astate) | (w & Bstate) | (w & Cstate);
    assign Enext = (w & Dstate) | (w & Estate);
    
    assign onehot_states= {Estate, Dstate, Cstate, Bstate, Astate};

endmodule