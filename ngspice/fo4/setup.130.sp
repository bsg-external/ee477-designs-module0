* Setup spice file for SKY130 sipce simulations with NGSPICE

.lib     "SED_pdkpath_SED/libs.tech/ngspice/sky130.lib.spice" ss
.include "SED_pdkpath_SED/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice" 
* CDL spice models: currently broken :(
* .include "SED_pdkpath_SED/libs.ref/sky130_fd_sc_hd/cdl/sky130_fd_sc_hd.cdl" 

.temp 100

.option accurate
.option nomod
.option post

.param SUPPLY=1.6
.param GND=0

.global VDD VSS
Vvdd VDD  0  SUPPLY
Vvss VSS  0  0
