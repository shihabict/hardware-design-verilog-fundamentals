module jk_flipflop_tb;
reg j, k;
reg clk;
wire q, qn;

jk_flipflop dut(.j(j), .k(k), .clk(clk), .q(q), .qn(qn));

initial begin
    clk = 0;
    forever begin
        #5 clk = ~clk;
    end
end

//stimulus
initial begin
        // Start with hold
        j = 0; k = 0;
        // Apply Set (effective on next posedge)
        #12 j = 1; k = 0;   // Set request
        #10 j = 0; k = 0;   // back to hold
        // Apply Reset
        #12 j = 0; k = 1;   // Reset request
        #10 j = 0; k = 0;   // hold
        // Apply Toggle
        #12 j = 1; k = 1;   // Toggle request
        #10 j = 0; k = 0;   // hold
        // Another Toggle
        #12 j = 1; k = 1;   // Toggle request
        #10 j = 0; k = 0;   // hold
        // Finish
        #20 $finish;
    end

    
initial begin
    $dumpfile("jk_flipflop.vcd");
    $dumpvars;
end

initial begin
    $monitor($time, " clk=%b    J=%b    K=%b    |   Q=%b    Qn=%b", clk, j, k, q, qn);
end

endmodule
