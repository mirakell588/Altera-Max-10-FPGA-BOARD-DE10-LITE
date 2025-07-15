module bcd_to_seg7(bcd_in, seg7);
input[3:0] bcd_in;
output[6:0] seg7;
reg[6:0] seg7;
always@ (bcd_in)
begin
	case(bcd_in) // abcdefg
		4'b0000: seg7 = 7'b1000000;	//0
		4'b0001: seg7 = 7'b1111001;	//1
		4'b0010: seg7 = 7'b0100100;	//2
		4'b0011: seg7 = 7'b0110000;	//3
		4'b0100: seg7 = 7'b0011001;	//4
		4'b0101: seg7 = 7'b0010010;	//5
		4'b0110: seg7 = 7'b0000010;	//6
		4'b0111: seg7 = 7'b1111000;	//7
		4'b1000: seg7 = 7'b0000000;	//8
		4'b1001: seg7 = 7'b0010000;	//9
		default: seg7 = 7'b1111111;	//off
	endcase
end
endmodule


module count_0_9(clk, reset, enable, count_out, carry);
	input clk, reset, enable;
	output reg[3:0] count_out;
	output carry;
	assign carry = (count_out== 4'b1001) ? 1 : 0;
	always@ (posedge clk or posedge reset)
	begin
		
		if(reset)
			begin
				count_out= 4'b0;
			end
		else if(enable == 1)
		begin
			if(count_out== 4'b1001)
				count_out<=4'b0000;
			else
				count_out<=count_out +1;
		end
end
endmodule


module freq_div (
    input clk_in, 
    input reset, 
    output clk_out
);
    parameter exp = 20;   
    reg [exp-1:0] divider;

    assign clk_out = divider[exp-1];

    always @ (posedge clk_in or posedge reset) begin
	 
        if (reset)
            divider <= 0;
        else
            divider <= divider + 1;
    end
endmodule
			

module up_counter_0_9_top(clk, reset, enable, seg7_out, dpt_out, carry, led_com);
	input clk, reset, enable;	
	output[6:0] seg7_out;
	output dpt_out, carry, led_com;
	wire clk_work;
	wire[3:0] count_out;
	
	freq_div# (22) M1 (clk, reset,clk_work);
	count_0_9 M2 (clk_work, reset, enable, count_out, carry) ;
	bcd_to_seg7 M4 (count_out,seg7_out);
	
	assign dpt_out = 1'b1; 	
	assign led_com = 1'b0;	

endmodule
