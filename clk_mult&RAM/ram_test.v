`timescale 1ns / 1ps
module ram_test(
);
reg clk1 = 0;
reg wena;
reg [4:0]addr;
reg [7:0]datain;
wire [7:0]dataout;

RAM1 ram(clk1,wena,addr,datain,dataout);
always #5 clk1 = ~clk1;
initial begin
    wena = 1;
    addr = 5'b00001;
    datain = 8'b00100100;
    #30
    wena = 0;
    addr = 5'b00001;
    #30
    wena = 1;
    addr = 5'b00011;
    datain = 8'b00101100;
    #30
    wena = 0;
    addr = 5'b00011;
end

endmodule