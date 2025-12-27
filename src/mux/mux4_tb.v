`timescale 1ns/1ps

module mux4_tb;
reg input1, input2, input3, input4;

reg s1, s2;

wire output1;

mux4T01 dut(.in0(input1), .in1(input2), .in2(input3), .in3(input4), .s1(s1), .s2(s2), .out(output1));

initial begin
    input1=1'b1; input2=1'b0; input3=1'b0; input4=1'b0; s1=1'b0; s2=1'b0;
    #10; input1=1'b0; input2=1'b1; input3=1'b0; input4=1'b0; s1=1'b0; s2=1'b1;
    #10; input1=1'b0; input2=1'b0; input3=1'b1; input4=1'b0; s1=1'b1; s2=1'b0;
    #10; input1=1'b0; input2=1'b0; input3=1'b0; input4=1'b1; s1=1'b1; s2=1'b1;
    #10;
    $finish;
end

initial begin
    $monitor($time, "   in1=%b in2=%b in3=%b in4=%b s1=%b s2=%b output=%b", input1, input2, input3, input4, s1, s2, output1);
end

initial begin
    $dumpfile("mux4.vcd"); $dumpvars;
end

endmodule