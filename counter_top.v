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


module count_0_9(clk, reset, enable, count_out, carry, counted_carry_flag);
	input clk, reset, enable;
	output reg[3:0] count_out;
	output carry, counted_carry_flag;
	assign carry = (count_out== 4'b1001) ? 1 : 0;
	assign counted_carry_flag = (reset)? 1:0;
	
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


module counter_carry(carry, counted_carry_flag, counted_carry);
	input carry;
	input counted_carry_flag;
	output reg[3:0] counted_carry;
    initial begin
        counted_carry = 4'b0000;
    end

    always @ (posedge carry or posedge counted_carry_flag) 
	 begin
		if(counted_carry_flag)
			begin
				counted_carry = 4'b0000;
			end
		else
			begin
				if (counted_carry == 4'b1001) 
            counted_carry <= 4'b0000; 
				else
            counted_carry <= counted_carry + 1;
			end
	end
endmodule
			

module counter_top(clk, reset, enable, seg7_out, seg7_tens_out , dpt_out, carry, led_com);
	input clk, reset, enable;	
	output[6:0] seg7_out;
	output[6:0] seg7_tens_out;
	output dpt_out, carry, led_com;
	wire clk_work;
	wire counted_carry_flag;
	wire[3:0] count_out, counted_carry;
	
	freq_div# (22) M1 (clk, reset,clk_work);
	count_0_9 M2 (clk_work, reset, enable, count_out, carry, counted_carry_flag) ;
	counter_carry M3( carry, counted_carry_flag, counted_carry);
	bcd_to_seg7 M4 (count_out,seg7_out);
	bcd_to_seg7 M5	(counted_carry,seg7_tens_out);
	assign dpt_out = 1'b1; 	//7 segment small dot display
	assign led_com = 1'b0;	//Light up top row LED
	
	
endmodule
