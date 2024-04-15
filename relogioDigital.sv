module relogioDigital (input reset,CLOCK_50,
				 output logic [6:0] s_lsd,
				 output logic [6:0] s_msd,
				 output logic [6:0] m_lsd,
				 output logic [6:0] m_msd,
				 output logic [6:0] h_lsd,
				 output logic [6:0] h_msd,
				 output logic [3:0] bcd_s_lsd,
					output logic [2:0] bcd_s_msd,
					output logic incrementa_minuto);

	logic enable1hz;
	
	enable_1hz habilitador(
	.enable_clock(CLOCK_50),
	.enable_reset(reset),
	.enable_pulseout(enable1hz));

	
	// segundos
	//logic [3:0] bcd_s_lsd;
	//logic [2:0] bcd_s_msd;
	//logic incrementa_minuto;
	
	maq_s maqs_display_s (
	.maqs_clock(CLOCK_50),
	.maqs_reset(reset),
	.maqs_enable(CLOCK_50),
	.maqs_lsd(bcd_s_lsd),
	.maqs_msd(bcd_s_msd),
	.maqs_incrementa_minuto(incrementa_minuto));

	bcd_7seg display_s_lsd(
	.bcd_bcd_in(bcd_s_lsd),
	.bcd_display_out(s_lsd));
	
	bcd_7seg display_s_msd(
	.bcd_bcd_in({1'b0, bcd_s_msd}),
	.bcd_display_out(s_msd));

	
	// minutos
	logic [3:0] bcd_m_lsd;
	logic [2:0] bcd_m_msd;
	logic incrementa_hora;
	
	maq_m maqm_display_m(
	.maqm_clock(CLOCK_50),
	.maqm_reset(reset),
	.maqm_enable(CLOCK_50),
	.maqm_incremento(incrementa_minuto),
	.maqm_lsd(bcd_m_lsd),
	.maqm_msd(bcd_m_msd),
	.maqm_incrementa_hora(incrementa_hora));
	
	bcd_7seg display_m_lsd(
	.bcd_bcd_in(bcd_m_lsd),
	.bcd_display_out(m_lsd));
	
	bcd_7seg display_m_msd(
	.bcd_bcd_in({1'b0, bcd_m_msd}),
	.bcd_display_out(m_msd));
	
	
	// horas
	logic [3:0] bcd_h_lsd;
	logic [1:0] bcd_h_msd;
	
	maq_h maqh_display_h(
	.maqh_clock(CLOCK_50),
	.maqh_reset(reset),
	.maqh_enable(CLOCK_50),
	.maqh_incremento(incrementa_hora),
	.maqh_lsd(bcd_h_lsd),
	.maqh_msd(bcd_h_msd));
	
	bcd_7seg display_h_lsd(
	.bcd_bcd_in(bcd_h_lsd),
	.bcd_display_out(h_lsd));
	
	bcd_7seg display_h_msd(
	.bcd_bcd_in({2'b0, bcd_h_msd}),
	.bcd_display_out(h_msd));
	
endmodule 