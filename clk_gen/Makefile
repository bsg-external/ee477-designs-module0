# Makefile for Module 0 clk_gen design

TOP_DIR := $(realpath ../../ee477-hammer-cad)
OBJ_DIR := build
INPUT_CFGS := cfg/cfg.yml
TB_CFGS := cfg/tb.yml

include $(TOP_DIR)/module_top.mk

sim-rtl: | disable-sim
sim-rtl-hard: | disable-sim
sim-syn-functional: | disable-sim
sim-par-functional: | disable-sim

report-sim-syn \
report-sim-par: report-sim-%: $(OBJ_DIR)/sim-%-rundir/run.log
	cat $< | grep 'FINISH TESTING CONFIG' | awk '{print $$5}' | xargs -I{} python -c "print(int('{}',2))" > .report.config
	cat $< | grep -B2 'FINISH TESTING CONFIG' | grep 'NEGEDGE' | awk '{print $$9}' > .report.negedge
	cat $< | grep -B2 'FINISH TESTING CONFIG' | grep 'POSEDGE' | awk '{print $$9}' > .report.posedge
	echo "config,negedge,posedge" > $@.log
	paste -d "," .report.config .report.negedge .report.posedge >> $@.log
	rm -f .report.config .report.negedge .report.posedge

