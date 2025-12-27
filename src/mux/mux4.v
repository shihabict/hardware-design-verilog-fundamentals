module mux4T01(input in0, input in1, input in2, input in3,input s1,input s2, output out);
// define internal wire
wire sin1, sin2;
wire y0, y1, y2, y3;

// define gates

not n1(sin1, s1);
not n2(sin2, s2);

// 3 input and gate

and a1(y0, in0, sin1, sin2);
and a2(y1, in1, sin1, s2);
and a3(y2, in2, s1, sin2);
and a4(y3, in3, s1, s2);


or o1(out, y0, y1, y2, y3);

endmodule