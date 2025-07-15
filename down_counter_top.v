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


module count_0_9(clk, reset, enable, count_out, borrow, counted_borrow_flag);
	input clk, reset, enable;
	output reg[3:0] count_out;
	output borrow, counted_borrow_flag;
	assign borrow = (count_out== 4'b0000) ? 1 : 0;
	assign counted_borrow_flag = (reset)? 1:0;
	
	always@ (posedge clk or posedge reset)
	begin
		
		if(reset)
			begin
				count_out= 4'b1001;
			end
		else if(enable == 1)
		begin
			if(count_out== 4'b0000)
				count_out<=4'b1001;
			else
				count_out<=count_out -1;
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


module counter_borrow(borrow, counted_borrow_flag, counted_borrow);
	input borrow;
	input counted_borrow_flag;
	output reg[3:0] counted_borrow;
    initial begin
        counted_borrow = 4'b1001;
    end

    always @ (posedge borrow or posedge counted_borrow_flag) 
	 begin
		if(counted_borrow_flag)
			begin
				counted_borrow = 4'b1001;
			end
		else
			begin
				if (counted_borrow == 4'b0000) 
            counted_borrow <= 4'b1001; 
				else
            counted_borrow <= counted_borrow - 1;
			end
	end
endmodule
			

module down_counter_top(clk, reset, enable, seg7_out, seg7_tens_out , dpt_out, borrow, led_com);
	input clk, reset, enable;	
	output[6:0] seg7_out;
	output[6:0] seg7_tens_out;
	output dpt_out, borrow, led_com;
	wire clk_work;
	wire counted_borrow_flag;
	wire[3:0] count_out, counted_borrow;
	
	freq_div# (22) M1 (clk, reset,clk_work);
	count_0_9 M2 (clk_work, reset, enable, count_out, borrow, counted_borrow_flag) ;
	counter_borrow M3( borrow, counted_borrow_flag, counted_borrow);
	bcd_to_seg7 M4 (count_out,seg7_out);
	bcd_to_seg7 M5	(counted_borrow,seg7_tens_out);
	assign dpt_out = 1'b0; 	//7 segment small dot display
	assign led_com = 1'b0;	//Light up top row LED

endmodule
