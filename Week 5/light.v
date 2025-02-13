module light(
    // Declare downstairs and upstairs input
    // Declare stair light output
    input downstairs,
    input upstairs,
    output stair_light
);

    // Enter logic equation here
    assign stair_light = downstairs ^ upstairs;

endmodule