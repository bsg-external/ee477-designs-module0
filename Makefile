# Make file for Module 0

TOP_DIR = $(realpath ../ee477-modules)
OBJ_DIR = build
INPUT_CFGS = cfg/module_0_cfg.yml cfg/module_0_src.yml
TB_CFGS ?= cfg/module_0_tb.yml

include $(TOP_DIR)/module_top.mk

### SPICE simulation targets ###

# PDK and NGSPICE simulator paths
export PDK_PATH    := /home/projects/ee477.2023wtr/cad/pdk/sky130A
export NGSPICE_BIN := /home/projects/ee477.2023wtr/cad/ngspice/bin/ngspice

.PHONY: ngspice-fo4 clean-ngspice-fo4 ngspice-clk_gen clean-ngspice-clk_gen
ngspice-fo4: 
	cd ./ngspice/fo4 && make run
clean-ngspice-fo4:
	cd ./ngspice/fo4 && make clean

# Depends on PAR output netlist
ngspice-clk_gen: $(realpath $(OBJ_DIR)/par-rundir/par-output-full.json)
	cd ./ngspice/clk_gen && make run
clean-ngspice-clk_gen:
	cd ./ngspice/clk_gen && make clean


