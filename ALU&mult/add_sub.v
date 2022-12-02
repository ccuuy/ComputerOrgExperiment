`timescale 1ns / 1ps


module add_sub(
    input [3:0] a, 
    input [3:0] b, 
    input cin, 
    input operator, 
    output [3:0] result, 
    output overflow
); 
    wire [3:0] b1;
    wire [3:0] b2;
    assign b1[0] = b[0]^operator;
    assign b1[1] = b[1]^operator;
    assign b1[2] = b[2]^operator;
    assign b1[3] = b[3]^operator;
    assign b2 = b1 + operator;
    adder_4_s oper(a,b2,cin,result,overflow);
    
endmodule
