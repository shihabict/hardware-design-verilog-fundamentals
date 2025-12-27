`timescale 1ns/1ps

module fulladdder_tb;

reg a, b, cin;

wire sum, carry;

fulladdder dut(.A(a), .B(b), .cin(cin), .sum(sum), .carry(carry));

initial begin
    a=1'b0; b=1'b0; cin=1'b0;
    #10; a=1'b0; b=1'b0; cin=1'b1;
    #10 a=1'b0; b=1'b1; cin=1'b0;
    #10; a=1'b0; b=1'b1; cin=1'b1;
    #10; a=1'b1; b=1'b0; cin=1'b0;
    #10; a=1'b1; b=1'b0; cin=1'b1;
    #10; a=1'b1; b=1'b1; cin=1'b0;
    #10; a=1'b1; b=1'b1; cin=1'b1;
    #10;

    $finish;
end

initial begin
    $monitor($time , "  a=%b    b=%b    c=%b    sum=%b  carry=%b", a, b, cin, sum, carry);
end

initial begin
    $dumpfile("full_adder.vcd"); $dumpvars;
end

endmodule