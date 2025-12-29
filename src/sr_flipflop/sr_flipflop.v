module sr_flipFlop(input s, input r, input clk, input reset, output reg q, output qn);

assign qn = ~q;

always @(posedge clk)
case ({s,r})
    2'b00: q<=q;
    2'b01: q<=0;
    2'b10: q<=1;
    2'b11: q<=1'bZ; 
endcase
endmodule