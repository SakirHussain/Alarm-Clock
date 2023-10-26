module tb_alarm_reg();
    reg [3:0] new_alarm_ms_hr,
              new_alarm_ls_hr,
              new_alarm_ms_min,
              new_alarm_ls_min;

    reg load_new_alarm, reset, clock;

    // reg [3:0] temp_ms_hr,
    //           temp_ls_hr,
    //           temp_ms_min,
    //           temp_ls_min;

    wire [3:0] alarm_time_ms_hr,
              alarm_time_ls_hr,
              alarm_time_ms_min,
              alarm_time_ls_min;

    parameter cycle = 10;

    alarm_reg DUT(.new_alarm_ms_hr(new_alarm_ms_hr), 
                  .new_alarm_ls_hr(new_alarm_ls_hr),
                  .new_alarm_ms_min(new_alarm_ms_min),
                  .new_alarm_ls_min(new_alarm_ls_min),
                  .load_new_alarm(load_new_alarm),
                  .clock(clock),
                  .reset(reset),
                  .alarm_time_ms_hr(alarm_time_ms_hr),
                  .alarm_time_ls_hr(alarm_time_ls_hr),
                  .alarm_time_ms_min(alarm_time_ms_min),
                  .alarm_time_ls_min(alarm_time_ls_min));

    initial begin
        clock = 1'b0;
        forever begin
            #(cycle/2) clock = ~clock;
        end
    end

    task DLY(input i);
        #i;
    endtask

    task set_rst;
	begin
        reset = 1'b1;
        #10;
        reset = 1'b0;
	end
    endtask

    // task initialize;
    //     begin
            
    //     end
    // endtask

    initial begin
    $display("Test Vector 1: Reset and load new alarm time");
    set_rst;
    load_new_alarm = 0;
    new_alarm_ms_hr <= 4'b1010; // Example values
    new_alarm_ls_hr <= 4'b0011;
    new_alarm_ms_min <= 4'b1100;
    new_alarm_ls_min <= 4'b0111;

    // Apply reset
    #10 set_rst;

    // Load new alarm time
    #10 load_new_alarm = 1'b1;

    // Check the alarm_time registers
    #10 if (
      alarm_time_ms_hr === new_alarm_ms_hr &&
      alarm_time_ls_hr === new_alarm_ls_hr &&
      alarm_time_ms_min === new_alarm_ms_min &&
      alarm_time_ls_min === new_alarm_ls_min
    ) begin
      $display("Test Vector 1 Passed");
    end else begin
      $display("Test Vector 1 Failed");
    end

    // End simulation
    $finish;
  end

  // Add more test vectors here as needed

endmodule
