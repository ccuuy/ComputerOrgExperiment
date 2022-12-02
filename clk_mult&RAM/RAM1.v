`timescale 1ns / 1ps
module RAM1(
 input clk, 
 input wena, 
 input [4:0] addr, 
 input [7:0] data_in, 
 output reg [7:0] data_out 
);
reg [7:0] mymem [31:0]; 
always@(posedge clk)
begin
if(wena)
    mymem[addr]<=data_in;
else
    data_out<= mymem[addr];
end
endmodule
