`timescale 1ns / 1ps


module adder_4_s(
    input [3:0] a, 
    input [3:0] b, 
    input cin, 
    output [3:0] s, 
    output overflow 
);
    wire cout0,cout1,cout2,cout3;
    adder add1(a[0], b[0], cin, cout0, s[0]); 
    adder add2(a[1], b[1], cout0, cout1, s[1]); 
    adder add3(a[2], b[2], cout1, cout2, s[2]); 
    adder add4(a[3], b[3], cout2, cout3, s[3]); 
    assign overflow = cout2^cout3;
endmodule
