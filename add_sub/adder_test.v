`timescale 1ns / 1ps

module adder_test(

   );
   
   reg a,b,cin; 
   wire cout,s; 
   adder add(a, b, cin, cout, s); 
   
   initial begin  
        a = 1;
        b = 1;
        cin = 1;
        #100  
        a = 1;
        b = 0;
        cin = 1;
        #100 
        a = 1;
        b = 0;
        cin = 0;
   end
   
endmodule
