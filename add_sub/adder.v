`timescale 1ns / 1ps



module adder(
    input ia, 
    input ib, 
    input cin, 
    output cout, 
    output sum 
);
    
    assign cout = (ia&ib) | (ia&cin) | (ib&cin);  
    assign sum = ia^ib^cin; 
    
endmodule
