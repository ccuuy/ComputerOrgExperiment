module alu(
 input [3:0] a, //操作数 a
 input [3:0] b, //操作数 b
 input [3:0] aluc, //控制 alu 的操作。如 aluc==3’b100 时执行异或
 output reg[3:0] r, //运算结果
 output reg ZF //零标志位, 运算结果为 0(全零)则置 1, 否则置 0 

 );
wire[3:0]r1;
wire[3:0]r2;

wire OF1,OF2;
add_sub addr(a,b,0,0,r1,OF1);
add_sub subr(a,b,0,1,r2,OF2);
always@(*)
begin
	case(aluc)
    4'b0010:begin
    	r = r1;
    end
    4'b0110:begin
    	r = r2;
    end
    4'b0000:begin
    	r = a&b;
    end
    4'b0001:begin
    	r = a|b;
    end
    4'b1101:begin
    	r = ~(a&b);
    end
    4'b1100:begin
    	r = ~(a|b);
    end
    4'b0111:begin
    	if(r2[3]==1)
        	r=4'b0001;
        else
            r=4'b0000;
    end
  
    endcase
    
    if(r==0)
    	ZF=1;
    else
    	ZF=0;
end

endmodule
