module decoder2_4_tb;
reg A, B, en;
wire [3:0] y;

decoder2_4 dut(.A(A), .B(B), .en(en), .y(y));

initial begin
    // Test all combinations of A, B with enable high
    en = 1'b1; A = 1'b0; B = 1'b0; #10;
    en = 1'b1; A = 1'b0; B = 1'b1; #10;
    en = 1'b1; A = 1'b1; B = 1'b0; #10;
    en = 1'b1; A = 1'b1; B = 1'b1; #10;

    // Test with enable low
    en = 1'b0; A = 1'b0; B = 1'b0; #10;
    en = 1'b0; A = 1'b0; B = 1'b1; #10;
    en = 1'b0; A = 1'b1; B = 1'b0; #10;
    en = 1'b0; A = 1'b1; B = 1'b1; #10;

    $finish;
end

initial begin
    $dumpfile("decoder2_4.vcd");
    $dumpvars;
end 

initial begin
    $monitor($time, " en=%b A=%b B=%b | y=%b", en, A, B, y);
end
endmodule