`timescale 1ns/1ps

module sr_flipFlop_tb;

reg s, r;
reg clk;
wire q, qn;

sr_flipFlop dut(.s(s), .r(r), .clk(clk), .q(q), .qn(qn));
initial begin
    clk=0;
    forever begin
        #5 clk=~clk;
    end
end

initial begin
    $dumpfile("sr_flipFlop.vcd");
    $dumpvars;
end

initial begin
    $monitor($time, " clk=%b    S=%b    R=%b    |   Q=%b    Qn=%b", clk,s,r,q,qn);
end

//stimulus
initial begin
        // Start with hold
        s = 0; r = 0;

        // Apply Set (effective on next posedge)
        #12 s = 1; r = 0;   // Set request
        #10 s = 0; r = 0;   // back to hold

        // Apply Reset
        #12 s = 0; r = 1;   // Reset request
        #10 s = 0; r = 0;   // hold

        // Invalid case (S=1, R=1)
        #12 s = 1; r = 1;
        #10 s = 0; r = 0;

        // Finish
        #20 $finish;
    end

endmodule