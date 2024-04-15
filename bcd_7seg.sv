module bcd_7seg(input [3:0] bcd_bcd_in,
					 output logic [6:0] bcd_display_out);

	always_comb begin
		case(bcd_bcd_in)
			4'd0: bcd_display_out = 7'b0000001;
			4'd1: bcd_display_out = 7'b1001111;
			4'd2: bcd_display_out = 7'b0010010;
			4'd3: bcd_display_out = 7'b0000110;
			4'd4: bcd_display_out = 7'b1001100;
			4'd5: bcd_display_out = 7'b0100100;
			4'd6: bcd_display_out = 7'b0100000;
			4'd7: bcd_display_out = 7'b0001111;
			4'd8: bcd_display_out = 7'b0000000;
			4'd9: bcd_display_out = 7'b0000100;
			default: bcd_display_out = 7'b1111111;
		endcase
	end
endmodule 