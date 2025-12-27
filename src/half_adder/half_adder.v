module half_adder(input wire A, input wire B, output reg sum, output reg carry);
always @(*) begin
    sum = A ^ B;
    carry = A & B;
end
endmodule
