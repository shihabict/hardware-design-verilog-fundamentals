`timescale 1ns/1ps

module half_adder_tb;
reg a, b;
wire sum;
wire carry;

// Instantiate the DUT
half_adder dut(.A(a), .B(b), .sum(sum), .carry(carry));

initial begin

    a = 1'b0; b=1'b0; 
    #10 a = 1'b0; b=1'b1;
    #10 a = 1'b1; b=1'b0;
    #10 a = 1'b1; b=1'b1;

end

initial begin
    $monitor($time, " a=%b b=%b | sum=%b   carry=%b", a, b, sum, carry);
end;

initial begin
    $dumpfile("half_adder.vcd"); $dumpvars; end;


endmodule