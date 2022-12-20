
.include "dut.sp"


* Initial value for n0, this starts the osc
Vrst reset_i 0 PWL( 0p 1.6  10p 1.6  20p  0 )
Xdut reset_i probe_in_o probe_out_o fo4

.control
    save all
    set num_threads=16
    set noacct

    * Transient analysis
    tran 10p 20n
    * tran 0.1p 50n
    plot  probe_in_o probe_out_o
.endc

* Put measure statements here!
.meas tran tpdr
+ TRIG probe_in_o  VAL=0.6 FALL=3
+ TARG probe_out_o VAL=0.6 RISE=3

.meas tran tpdf
+ TRIG probe_in_o  VAL=0.6 RISE=3
+ TARG probe_out_o VAL=0.6 FALL=3

.meas tran fo4_val param='(tpdr+tpdf)/2'


.end
