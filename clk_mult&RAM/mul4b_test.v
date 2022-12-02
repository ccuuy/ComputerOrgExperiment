`timescale 1ns / 1ps

module mul4b_test();
reg [3:0]a1;
reg [3:0]b1;
reg clk1 = 0;
wire [7:0]z1;

mul4b mul4b1(clk1, a1, b1, z1);
always #5 clk1 = ~clk1;
initial begin
    a1 = 4'b0010;
    b1 = 4'b0010;
    #100
    a1 = 4'b0011;
    b1 = 4'b0010;
    #100
    a1 = 4'b0011;
    b1 = 4'b0110;
    #100
    a1 = 4'b0101;
    b1 = 4'b0010;
    #100
    a1 = 4'b0111;
    b1 = 4'b0001;

end

endmodule

