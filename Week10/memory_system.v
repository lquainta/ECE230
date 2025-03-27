module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);
    
    wire[7:0] demux_output_A;
    wire[7:0] demux_output_B;
    wire[7:0] demux_output_C;
    wire[7:0] demux_output_D;
    
    demux_8 demux(
        .data(data),
        .sel(addr),
        .A(demux_output_A),
        .B(demux_output_B),
        .C(demux_output_C),
        .D(demux_output_D)
    );
    
    wire demuxone_output_A;
    wire demuxone_output_B;
    wire demuxone_output_C;
    wire demuxone_output_D;
    
    demux demuxone(
    .data(store),
    .sel(addr),
    .A(demuxone_output_A),
    .B(demuxone_output_B),
    .C(demuxone_output_C),
    .D(demuxone_output_D)
    );
    
    wire[7:0] mem_A_wire;
    byte_memory mem_A(
                .data(demux_output_A),
                .store(demuxone_output_A),
                .memory(memory_A_wire)
            );
    wire[7:0] mem_B_wire;
    byte_memory mem_B(
                .data(demux_output_B),
                .store(demuxone_output_B),
                .memory(memory_B_wire)
            );
    wire[7:0] mem_C_wire;
    byte_memory mem_C(
                .data(demux_output_C),
                .store(demuxone_output_C),
                .memory(memory_C_wire)
            );
    wire[7:0] mem_D_wire;
    byte_memory mem_D(
                .data(demux_output_D),
                .store(demuxone_output_D),
                .memory(memory_D_wire)
            );
    

    
    mux mux(
        .A(mem_A_wire),
        .B(mem_B_wire),
        .C(mem_C_wire),
        .D(mem_D_wire),
        .sel(addr),
        .Out(memory)
    );        
    
    

endmodule