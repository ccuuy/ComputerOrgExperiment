`timescale 1ns / 1ps


module add_sub_test(

   );
   
   reg [3:0] a;
   reg [3:0] b;
   reg cin; 
   reg op;
   wire overflow;
   wire [3:0] s; 
   add_sub add_sub1(a, b, cin, op, s, overflow); 
   
   initial begin  
        a = 4'b0001;
        b = 4'b0011;
        op = 0;
        cin = 1;
        #100  
        a = 4'b1000;
        b = 4'b1010;
        op = 0;
        cin = 0;
        #100 
        a = 4'b0111;
        b = 4'b1000;
        op = 0;
        cin = 1;
        #100
        a = 4'b0001;
        b = 4'b0011;
        op = 1;
        cin = 0;
        #100  
        a = 4'b1000;
        b = 4'b1010;
        op = 1;
        cin = 0;
        #100 
        a = 4'b0111;
        b = 4'b1000;
        op = 1;
        cin = 0;
   end
   
endmodule
