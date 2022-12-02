`timescale 1ns / 1ps

module adder_4_s_test(

   );
   
   reg [3:0] a;
   reg [3:0] b;
   reg cin; 
   wire overflow;
   wire [3:0] s; 
   adder_4_s adder4(a, b, cin, s, overflow); 
   
   initial begin  
        a = 4'b0001;
        b = 4'b0011;
        cin = 1;
        #100  
        a = 4'b1000;
        b = 4'b1010;
        cin = 0;
        #100 
        a = 4'b0011;
        b = 4'b0110;
        cin = 0;
        #100
        a = 4'b0111;
        b = 4'b0000;
        cin = 1;
   end
   
endmodule
