module maq_h(input maqh_clock,
				 input maqh_reset,
				 input maqh_enable,
				 input maqh_incremento,
				 output logic [3:0] maqh_lsd,
				 output logic [1:0] maqh_msd);
	
/* Incrementa o numero menos significativo */
	always_ff @ (posedge maqh_clock) begin
		if (maqh_reset)
			maqh_lsd <= 4'd0;
		else begin
			if (maqh_enable && maqh_incremento) begin
				if(maqh_msd == 2'd2) begin
					if(maqh_lsd == 4'd3) begin
						maqh_lsd <= 4'd0;
					end
				end
				if(maqh_lsd == 4'd9)
					maqh_lsd <= 4'd0;
				else
					maqh_lsd <= maqh_lsd + 4'd1;
			end
			else
				maqh_lsd <= maqh_lsd;
		end
	end
	
	/* Incrementa o numero mais significativo */
	always_ff @ (posedge maqh_clock) begin
		if (maqh_reset)
			maqh_msd <= 2'd0;
		else begin
			if (maqh_enable && maqh_incremento) begin
				if (maqh_lsd == 2'd3) begin
					if (maqh_msd == 2'd2)
						maqh_msd <= 2'd0;
					else
						maqh_msd <= maqh_msd + 2'd1;
				end
				else
					maqh_msd <= maqh_msd;
			end
			else
				maqh_msd <= maqh_msd;
		end
	end
	
	
endmodule 