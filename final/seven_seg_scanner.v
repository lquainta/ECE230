module seven_seg_scanner(
    input div_clock,
    input reset,
    output [3:0] anode
);
    wire Anext, Bnext, Cnext, Dnext;
    wire Astate, Bstate, Cstate, Dstate;
    
    dff_state Adff (
    .reset(reset),
    .clock(div_clock),
    .D(Anext),
    .Default(1'b0),
    .Q(Astate)
    );
    
    dff_state Bdff (
    .reset(reset),
    .clock(div_clock),
    .D(Bnext),
    .Default(1'b1),
    .Q(Bstate)
    );
    
    dff_state Cdff (
    .reset(reset),
    .clock(div_clock),
    .D(Cnext),
    .Default(1'b1),
    .Q(Cstate)
    );
    
    dff_state Ddff (
    .reset(reset),
    .clock(div_clock),
    .D(Dnext),
    .Default(1'b1),
    .Q(Dstate)
    );
        
    assign Anext = Bstate;
    assign Bnext = Cstate;
    assign Cnext = Dstate;
    assign Dnext = Astate;
    assign anode = {Dstate, Cstate, Bstate, Astate};    

endmodule