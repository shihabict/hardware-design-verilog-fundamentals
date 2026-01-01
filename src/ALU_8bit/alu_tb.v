module alu8_tb;
reg [7:0] A;
reg [7:0] B;
reg [2:0] ALU_Sel;
wire [7:0] ALU_Out;

alu8 dut(.A(A), .B(B), .ALU_Sel(ALU_Sel), .ALU_Out(ALU_Out));

//stimulus
initial begin
    // Test Addition
    A = 8'b00001111; B = 8'b00000001; ALU_Sel = 3'b000; // A + B
    #10;
    // Test Subtraction
    A = 8'b00001111; B = 8'b00000001; ALU_Sel = 3'b001; // A - B
    #10;
    // Test AND
    A = 8'b11001100; B = 8'b10101010; ALU_Sel = 3'b010; // A & B
    #10;
    // Test OR
    A = 8'b11001100; B = 8'b10101010; ALU_Sel = 3'b011; // A | B
    #10;
    // Test XOR
    A = 8'b11001100; B = 8'b10101010; ALU_Sel = 3'b100; // A ^ B
    #10;
    // Test NAND
    A = 8'b11001100; B = 8'b10101010; ALU_Sel = 3'b101; // A NAND B
    #10;
    // Test NOR
    A = 8'b11001100; B = 8'b10101010; ALU_Sel = 3'b110; // A NOR B
    #10;
    // Test XNOR
    A = 8'b11001100; B = 8'b10101010; ALU_Sel = 3'b111; // A XNOR B
    #10;
    $finish;
end

initial begin
    $dumpfile("alu.vcd");
    $dumpvars;
end
initial begin
    $monitor($time, " A=%b B=%b ALU_Sel=%b | ALU_Out=%b", A, B, ALU_Sel, ALU_Out);
end
endmodule