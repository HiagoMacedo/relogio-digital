module bcd_7seg(input [3:0] bcd_bcd_in,
					 output logic [6:0] bcd_display_out);

	always_comb begin
		case(bcd_bcd_in)
			4'd0: bcd_display_out = 7'b1000000;
			4'd1: bcd_display_out = 7'b1111001;
			4'd2: bcd_display_out = 7'b0100100;
			4'd3: bcd_display_out = 7'b0110000;
			4'd4: bcd_display_out = 7'b0011001;
			4'd5: bcd_display_out = 7'b0010010;
			4'd6: bcd_display_out = 7'b0000010;
			4'd7: bcd_display_out = 7'b1111000;
			4'd8: bcd_display_out = 7'b0000000;
			4'd9: bcd_display_out = 7'b0010000;
			default: bcd_display_out = 7'b1111111;
		endcase
	end
endmodule 