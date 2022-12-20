
.include dut.sp

* Initial value for n0, this starts the osc
Vrst reset_i 0 PWL( 0p 1.6  50p 1.6  70p  0 )
Xdut reset_i select_i[3] select_i[2] select_i[1] select_i[0] clk_o VSS VDD clk_gen_top

Vselect_i_0 select_i[0] 0 0
Vselect_i_1 select_i[1] 0 0
Vselect_i_2 select_i[2] 0 0
Vselect_i_3 select_i[3] 0 0
.param sel=0

.control
    save all
    set num_threads=16
    set noacct

    * Transient analysis
    tran 10p 20n
    plot  reset_i clk_o title 'Select=0'

    alterparam sel=1
    reset
    alter Vselect_i_3 0
    alter Vselect_i_2 0
    alter Vselect_i_1 0
    alter Vselect_i_0 1.6
    tran 10p 20n
    plot  reset_i clk_o title 'Select=1'

    alterparam sel=2
    reset
    alter Vselect_i_3 0
    alter Vselect_i_2 0
    alter Vselect_i_1 1.6
    alter Vselect_i_0 0
    tran 10p 20n
    plot  reset_i clk_o title 'Select=2'

    alterparam sel=3
    reset
    alter Vselect_i_3 0
    alter Vselect_i_2 0
    alter Vselect_i_1 1.6
    alter Vselect_i_0 1.6
    tran 10p 20n
    plot  reset_i clk_o title 'Select=3'

    alterparam sel=4
    reset
    alter Vselect_i_3 0
    alter Vselect_i_2 1.6
    alter Vselect_i_1 0
    alter Vselect_i_0 0
    tran 10p 20n
    plot  reset_i clk_o title 'Select=4'

    alterparam sel=5
    reset
    alter Vselect_i_3 0
    alter Vselect_i_2 1.6
    alter Vselect_i_1 0
    alter Vselect_i_0 1.6
    tran 10p 20n
    plot  reset_i clk_o title 'Select=5'

    alterparam sel=6
    reset
    alter Vselect_i_3 0
    alter Vselect_i_2 1.6
    alter Vselect_i_1 1.6
    alter Vselect_i_0 0
    tran 10p 20n
    plot  reset_i clk_o title 'Select=6'

    alterparam sel=7
    reset
    alter Vselect_i_3 0
    alter Vselect_i_2 1.6
    alter Vselect_i_1 1.6
    alter Vselect_i_0 1.6
    tran 10p 20n
    plot  reset_i clk_o title 'Select=7'

    alterparam sel=8
    reset
    alter Vselect_i_3 1.6
    alter Vselect_i_2 0
    alter Vselect_i_1 0
    alter Vselect_i_0 0
    tran 10p 30n
    plot  reset_i clk_o title 'Select=8'

    alterparam sel=9
    reset
    alter Vselect_i_3 1.6
    alter Vselect_i_2 0
    alter Vselect_i_1 0
    alter Vselect_i_0 1.6
    tran 10p 30n
    plot  reset_i clk_o title 'Select=9'

    alterparam sel=10
    reset
    alter Vselect_i_3 1.6
    alter Vselect_i_2 0
    alter Vselect_i_1 1.6
    alter Vselect_i_0 0
    tran 10p 30n
    plot  reset_i clk_o title 'Select=10'

    alterparam sel=11
    reset
    alter Vselect_i_3 1.6
    alter Vselect_i_2 0
    alter Vselect_i_1 1.6
    alter Vselect_i_0 1.6
    tran 10p 30n
    plot  reset_i clk_o title 'Select=11'

    alterparam sel=12
    reset
    alter Vselect_i_3 1.6
    alter Vselect_i_2 1.6
    alter Vselect_i_1 0
    alter Vselect_i_0 0
    tran 10p 30n
    plot  reset_i clk_o title 'Select=12'

    alterparam sel=13
    reset
    alter Vselect_i_3 1.6
    alter Vselect_i_2 1.6
    alter Vselect_i_1 0
    alter Vselect_i_0 1.6
    tran 10p 30n
    plot  reset_i clk_o title 'Select=13'

    alterparam sel=14
    reset
    alter Vselect_i_3 1.6
    alter Vselect_i_2 1.6
    alter Vselect_i_1 1.6
    alter Vselect_i_0 0
    tran 10p 30n
    plot  reset_i clk_o title 'Select=14'

    alterparam sel=15
    reset
    alter Vselect_i_3 1.6
    alter Vselect_i_2 1.6
    alter Vselect_i_1 1.6
    alter Vselect_i_0 1.6
    tran 10p 30n
    plot  reset_i clk_o title 'Select=15'
.endc

* Put measure statements here!
.meas tran select_value param=sel

.meas tran period
+ TRIG v(clk_o) VAL=0.6 RISE=2
+ TARG v(clk_o) VAL=0.6 RISE=3

.meas tran rise_slew
+ TRIG v(clk_o) VAL=0.32 RISE=3
+ TARG v(clk_o) VAL=1.28 RISE=3

.meas tran fall_slew
+ TRIG v(clk_o) VAL=1.28 FALL=3
+ TARG v(clk_o) VAL=0.32 FALL=3

.meas tran temp_duty_cycle_1
+ TRIG v(clk_o) VAL=0.6 CROSS=3
+ TARG v(clk_o) VAL=0.6 CROSS=4
.meas tran temp_duty_cycle_2
+ TRIG v(clk_o) VAL=0.6 CROSS=4
+ TARG v(clk_o) VAL=0.6 CROSS=5

.measure tran duty_cycle param='temp_duty_cycle_1/(temp_duty_cycle_1+temp_duty_cycle_2)'

.end
