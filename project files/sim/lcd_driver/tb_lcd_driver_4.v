module tb_lcd_driver_4();
    reg [3:0] alarm_time_ms_hr,
            alarm_time_ls_hr,
            alarm_time_ms_min,
            alarm_time_ls_min,
            current_time_ms_hr,
            current_time_ls_hr,
            current_time_ms_min,
            current_time_ls_min,
            key_ms_hr,
            key_ls_hr,
            key_ms_min,
            key_ls_min;

reg show_a, show_current_time; 

wire [7:0]    display_ms_hr,
                display_ls_hr,
                display_ms_min,
                display_ls_min;

wire sound_a;

 reg clock;
 reg reset;

lcd_driver_4 LCD1 (.alarm_time_ms_hr(alarm_time_ms_hr),
                    .alarm_time_ls_hr(alarm_time_ls_hr),
                    .alarm_time_ms_min(alarm_time_ms_min),
                    .alarm_time_ls_min(alarm_time_ls_min),
                    .current_time_ms_hr(current_time_ms_hr),
                    .current_time_ls_hr(current_time_ls_hr),
                    .current_time_ms_min(current_time_ms_min),
                    .current_time_ls_min(current_time_ls_min),
                    .key_ms_hr(key_ms_hr),
                    .key_ls_hr(key_ls_hr),
                    .key_ms_min(key_ms_min),
                    .key_ls_min(key_ls_min),
                    .show_a(show_a),
                    .show_current_time(show_current_time),
		    .display_ms_hr(display_ms_hr),
                    .display_ls_hr(display_ls_hr),
                    .display_ms_min(display_ms_min),
                    .display_ls_min(display_ls_min),
                    .sound_a(sound_a));

always begin
    #5 clock = ~clock;
  end


  initial begin
   clock = 0;

    // Initialize input values here
    alarm_time_ms_hr = 4'b0111;
    alarm_time_ls_hr = 4'b0111;
    alarm_time_ms_min = 4'b0111;
    alarm_time_ls_min = 4'b0111;
    current_time_ms_hr = 4'b0010;
    current_time_ls_hr = 4'b0001;
    current_time_ms_min = 4'b0011;
    current_time_ls_min = 4'b0100;
    key_ms_hr = 4'b0010;
    key_ls_hr = 4'b0001;
    key_ms_min = 4'b0011;
    key_ls_min = 4'b0100;
    show_a = 1'b1;
    show_current_time = 1'b0;
	
#100 $finish;

  end

endmodule