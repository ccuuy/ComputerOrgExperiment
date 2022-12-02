module mult4(
 input [3:0] a, 
 input [3:0] b, 
 output reg[7:0] z , // 乘积输出 z
 output reg ZF 
 );
 
 
reg [3:0]r;
reg [7:0]a1;
reg [3:0]_a;
reg [3:0]a2;
reg [3:0]b2;


always@(*)
begin
    a2=a;
    b2=b;
	if(a[3])
        a2=~a+1;
    if(b[3])
        b2=~b+1;
        
    a1={0,0,0,0,0,a2[2],a2[1],a2[0]};
	z=0;
    if(b2[0])
        z=z+(a1);
    if(b2[1])
        z=z+(a1<<1);
    if(b2[2])
        z=z+(a1<<2);
    if(a[3]^b[3])//符号不同
    	z=~z+1;
    if(z==0)
        ZF=1;
    else
        ZF=0;

end
endmodule