module fulladdder(input A, input B, input cin, output sum, output carry);

    wire ad1, ad2, ad3;

    xor sum1(sum, A, B, cin);

    and and1(ad1, A, B);
    and and2(ad2, A, cin);
    and and3(ad3, B, cin);

    or carry1(carry, ad1, ad2, ad3);


endmodule
