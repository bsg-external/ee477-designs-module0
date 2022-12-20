
# Add to path
export CALIBRE_BIN:=$(MGC_HOME)/bin
export PATH:=$(CALIBRE_BIN):$(PATH)


# Top level simulation
TB_FILE := clk_gen_test_harness.sp

VLOG_SRC := ../../build/par-rundir/clk_gen_top.lvs.v

SC_MODEL_PATH := $(PDK_PATH)/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
# * CDL spice models: currently broken :(
# SC_MODEL_PATH := $(PDK_PATH)/libs.ref/sky130_fd_sc_hd/cdl/sky130_fd_sc_hd.cdl

# Top level design subcircuit
SPICE_SRC := dut.sp

LOG := ngspice.log

# Generate spice subcircuit
# (delete filler cell lines from the spice script)
$(SPICE_SRC): $(VLOG_SRC)
	v2lvs -64 -i -n -lsr $(SC_MODEL_PATH) -v $< -o $@
	sed -i '/**sky130_fd_sc_hd__decap_*/d' $@

clean:
	-rm run.tmp.*
	-rm dut.sp
	-rm v2lvs.log
	-rm $(LOG)

run.tmp.sp: setup.130.sp $(TB_FILE)
	cat $^ > $@
	sed -i 's+SED_pdkpath_SED+$(PDK_PATH)+g' $@

.DEFAULT_GOAL:=run
.PHONY=run
run: run.tmp.sp $(SPICE_SRC)
	 $(NGSPICE_BIN) -i $< | tee $(LOG)
