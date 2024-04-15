module maq_m(input maqm_clock,
				 input maqm_reset,
				 input maqm_enable,
				 input maqm_incremento,
				 output logic [3:0] maqm_lsd,
				 output logic [2:0] maqm_msd,
				 output logic maqm_incrementa_hora);

/* Incrementa o numero menos significativo */
	always_ff @ (posedge maqm_clock) begin
		if (maqm_reset)
			maqm_lsd <= 4'd0;
		else begin
			if (maqm_enable && maqm_incremento) begin
				if(maqm_lsd == 4'd9)
					maqm_lsd <= 4'd0;
				else
					maqm_lsd <= maqm_lsd + 4'd1;
			end
			else
				maqm_lsd <= maqm_lsd;
		end
	end
	
	/* Incrementa o numero mais significativo */
	always_ff @ (posedge maqm_clock) begin
		if (maqm_reset)
			maqm_msd <= 3'd0;
		else begin
			if (maqm_enable && maqm_incremento) begin
				if (maqm_lsd == 4'd9) begin
					if (maqm_msd == 3'd5)
						maqm_msd <= 3'd0;
					else
						maqm_msd <= maqm_msd + 3'd1;
				end
				else
					maqm_msd <= maqm_msd;
			end
			else
				maqm_msd <= maqm_msd;
		end
	end
	
	always_comb begin
		maqm_incrementa_hora = ( (maqm_lsd == 4'd9) & (maqm_msd == 3'd5) );
	end
				 
endmodule 