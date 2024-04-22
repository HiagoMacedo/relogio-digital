module maq_s(input maqs_clock,
				 input maqs_reset,
				 input maqs_enable,
				 output logic [3:0] maqs_lsd,
				 output logic [2:0] maqs_msd,
				 output logic maqs_incrementa_minuto);
			
	/* Incrementa o numero menos significativo */
	always_ff @ (posedge maqs_clock) begin
		if (maqs_reset) begin
			maqs_lsd <= 4'd0;
		end
		else begin
			if (maqs_enable) begin
				if(maqs_lsd == 4'd9) begin
					maqs_lsd <= 4'd0;
				end
				else begin
					maqs_lsd <= maqs_lsd + 4'd1;
				end
			end
			else begin
				maqs_lsd <= maqs_lsd;
			end
		end
	end
	
	/* Incrementa o numero mais significativo */
	always_ff @ (posedge maqs_clock) begin
		if (maqs_reset)
			maqs_msd <= 3'd0;
		else begin
			if (maqs_enable) begin
				if (maqs_lsd == 4'd9) begin
					if (maqs_msd == 3'd5)
						maqs_msd <= 3'd0;
					else
						maqs_msd <= maqs_msd + 3'd1;
				end
				else begin
					maqs_msd <= maqs_msd;
				end
			end
			else begin
				maqs_msd <= maqs_msd;
			end
		end
	end
	
	always_comb begin
		maqs_incrementa_minuto = ( (maqs_lsd == 4'd9) && (maqs_msd == 3'd5) );
	end
endmodule 