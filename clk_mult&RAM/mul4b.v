`timescale 1ns / 1ps

module mul4b(
	input clk,
	input[3:0] A,
	input[3:0] B,
	output reg[7:0]r
	);
    reg[3:0]a2;
    reg[3:0]b2;
	reg[7:0] S; //积寄存器
	reg[7:0] T; //被乘数寄存器
	reg state=0;
    reg sign;
	reg [3:0]B_reg;//乘数寄存器
	reg [2:0] cnt;

    
	always @(posedge clk) begin
		case(state)
			1'b0:begin //第一个周期 初始化
                sign = A[3] ^ B[3];//sign为1负
                a2 = A;
                b2 = B;	
                if(B[3]==1)
                    b2 = ~B + 1;
                if(A[3]==1)
                    a2 = ~A + 1;
				B_reg = b2;
				S = 8'b0000_0000;
				T = {4'b0000,a2};
				cnt = 3'b000;
				state = 1'b1;
			end
			1'b1:begin 
				if(cnt < 3'b011) begin //第2、3、4周期，运算
					if(B_reg[0] == 1'b1) begin
						S <= S + T;
					end
					else begin
						S <= S;
					end
					B_reg <= B_reg>>1; // B_reg[0]置于判断位
					T <= T<<1;
					cnt <= cnt + 1'b1;
				end
				else begin//第5个周期，判断正负
                    if(sign)
                    begin
                        S = ~S + 1;
                    end
					state <= 1'b0;
                    r = S;
				end
				
			end				
			default:;
		endcase				
	end

endmodule
