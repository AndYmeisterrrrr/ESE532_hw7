############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project ESE5320_HW7
set_top Filter_HW
add_files Filter.cpp
add_files Pipeline.h
add_files -tb Testbench_filter.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vitis
set_part {xczu3eg-sbva484-1-i}
create_clock -period 6.67ns -name default
config_interface -m_axi_alignment_byte_size 64 -m_axi_latency 64 -m_axi_max_widen_bitwidth 512 -m_axi_offset slave
config_rtl -register_reset_num 3
source "./ESE5320_HW7/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
