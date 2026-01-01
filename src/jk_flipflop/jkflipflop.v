module jk_flipflop(input j, input k, input clk, output reg q, output reg qn);

    always @(posedge clk) begin
        case ({j, k})
            2'b00: begin
                // Hold state
                q <= q;
                qn <= qn;
            end
            2'b01: begin
                // Reset state
                q <= 0;
                qn <= 1;
            end
            2'b10: begin
                // Set state
                q <= 1;
                qn <= 0;
            end
            2'b11: begin
                // Toggle state
                q <= ~q;
                qn <= ~qn;
            end
        endcase
    end
endmodule