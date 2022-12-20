
# Top level simulation
TB_FILE := fo4_test_harness.sp

# Top level design subcircuit
SPICE_SRC := ../../spice/fo4.spice

LOG := ngspice.log

clean:
	-rm run.tmp.*
	-rm dut.sp
	-rm $(LOG)

dut.sp: $(SPICE_SRC)
	cp $< $@

run.tmp.sp: setup.130.sp $(TB_FILE)
	cat $^ > $@
	sed -i 's+SED_pdkpath_SED+$(PDK_PATH)+g' $@

.DEFAULT_GOAL:=run
.PHONY=run
run: run.tmp.sp dut.sp
	 $(NGSPICE_BIN) -i $< | tee $(LOG)
