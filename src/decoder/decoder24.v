module decoder2_4(input A, input B, input en, output reg [3:0] y);
always @(*) begin
    if (en) begin
        if (A==1'b0 && B==1'b0)
            y = 4'b0001;
        else if (A==1'b0 && B==1'b1)
            y = 4'b0010;
        else if (A==1'b1 && B==1'b0)
            y = 4'b0100;
        else
            y = 4'b1000;
    end
    else
        y = 4'bxxxx;
end

endmodule
