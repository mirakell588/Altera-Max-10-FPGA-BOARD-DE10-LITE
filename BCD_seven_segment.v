module BCD_seven_segment_top(bcd_in, seg7_out, dpt_out);
input [3:0] bcd_in;
output [6:0] seg7_out; 
output dpt_out; 
bcd_to_seg7 M1 (bcd_in,seg7_out);
assign dpt_out= 1'b0; 
endmodule

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
