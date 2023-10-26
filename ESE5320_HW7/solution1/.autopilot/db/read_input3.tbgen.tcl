set moduleName read_input3
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {read_input3}
set C_modelType { void 0 }
set C_modelArgList {
	{ aximm1 int 512 regular {axi_master 0}  }
	{ Input_r int 64 regular {fifo 0}  }
	{ Output_r int 64 regular {fifo 0}  }
	{ Output_out int 64 regular {fifo 1}  }
	{ inStream int 8 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "aximm1", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "Input_r", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "Output_r", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "Output_out", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inStream", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 67
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ m_axi_aximm1_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm1_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm1_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_aximm1_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm1_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_aximm1_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm1_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm1_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm1_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm1_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm1_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm1_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm1_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm1_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm1_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm1_WDATA sc_out sc_lv 512 signal 0 } 
	{ m_axi_aximm1_WSTRB sc_out sc_lv 64 signal 0 } 
	{ m_axi_aximm1_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm1_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm1_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm1_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm1_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm1_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_aximm1_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm1_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_aximm1_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm1_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm1_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_aximm1_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm1_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_aximm1_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm1_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_aximm1_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm1_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm1_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm1_RDATA sc_in sc_lv 512 signal 0 } 
	{ m_axi_aximm1_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm1_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm1_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm1_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_aximm1_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm1_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm1_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_aximm1_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_aximm1_BUSER sc_in sc_lv 1 signal 0 } 
	{ Input_r_dout sc_in sc_lv 64 signal 1 } 
	{ Input_r_empty_n sc_in sc_logic 1 signal 1 } 
	{ Input_r_read sc_out sc_logic 1 signal 1 } 
	{ Output_r_dout sc_in sc_lv 64 signal 2 } 
	{ Output_r_empty_n sc_in sc_logic 1 signal 2 } 
	{ Output_r_read sc_out sc_logic 1 signal 2 } 
	{ Output_out_din sc_out sc_lv 64 signal 3 } 
	{ Output_out_full_n sc_in sc_logic 1 signal 3 } 
	{ Output_out_write sc_out sc_logic 1 signal 3 } 
	{ inStream_din sc_out sc_lv 8 signal 4 } 
	{ inStream_full_n sc_in sc_logic 1 signal 4 } 
	{ inStream_write sc_out sc_logic 1 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "m_axi_aximm1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_aximm1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_aximm1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_aximm1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "AWID" }} , 
 	{ "name": "m_axi_aximm1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm1", "role": "AWLEN" }} , 
 	{ "name": "m_axi_aximm1_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm1", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_aximm1_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "AWBURST" }} , 
 	{ "name": "m_axi_aximm1_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_aximm1_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm1", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_aximm1_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm1", "role": "AWPROT" }} , 
 	{ "name": "m_axi_aximm1_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm1", "role": "AWQOS" }} , 
 	{ "name": "m_axi_aximm1_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm1", "role": "AWREGION" }} , 
 	{ "name": "m_axi_aximm1_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "AWUSER" }} , 
 	{ "name": "m_axi_aximm1_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "WVALID" }} , 
 	{ "name": "m_axi_aximm1_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "WREADY" }} , 
 	{ "name": "m_axi_aximm1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "aximm1", "role": "WDATA" }} , 
 	{ "name": "m_axi_aximm1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm1", "role": "WSTRB" }} , 
 	{ "name": "m_axi_aximm1_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "WLAST" }} , 
 	{ "name": "m_axi_aximm1_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "WID" }} , 
 	{ "name": "m_axi_aximm1_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "WUSER" }} , 
 	{ "name": "m_axi_aximm1_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "ARVALID" }} , 
 	{ "name": "m_axi_aximm1_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "ARREADY" }} , 
 	{ "name": "m_axi_aximm1_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm1", "role": "ARADDR" }} , 
 	{ "name": "m_axi_aximm1_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "ARID" }} , 
 	{ "name": "m_axi_aximm1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "aximm1", "role": "ARLEN" }} , 
 	{ "name": "m_axi_aximm1_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm1", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_aximm1_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "ARBURST" }} , 
 	{ "name": "m_axi_aximm1_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_aximm1_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm1", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_aximm1_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "aximm1", "role": "ARPROT" }} , 
 	{ "name": "m_axi_aximm1_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm1", "role": "ARQOS" }} , 
 	{ "name": "m_axi_aximm1_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "aximm1", "role": "ARREGION" }} , 
 	{ "name": "m_axi_aximm1_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "ARUSER" }} , 
 	{ "name": "m_axi_aximm1_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "RVALID" }} , 
 	{ "name": "m_axi_aximm1_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "RREADY" }} , 
 	{ "name": "m_axi_aximm1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "aximm1", "role": "RDATA" }} , 
 	{ "name": "m_axi_aximm1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "RLAST" }} , 
 	{ "name": "m_axi_aximm1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "RID" }} , 
 	{ "name": "m_axi_aximm1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "RUSER" }} , 
 	{ "name": "m_axi_aximm1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "RRESP" }} , 
 	{ "name": "m_axi_aximm1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "BVALID" }} , 
 	{ "name": "m_axi_aximm1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "BREADY" }} , 
 	{ "name": "m_axi_aximm1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "aximm1", "role": "BRESP" }} , 
 	{ "name": "m_axi_aximm1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "BID" }} , 
 	{ "name": "m_axi_aximm1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "BUSER" }} , 
 	{ "name": "Input_r_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "Input_r", "role": "dout" }} , 
 	{ "name": "Input_r_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Input_r", "role": "empty_n" }} , 
 	{ "name": "Input_r_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Input_r", "role": "read" }} , 
 	{ "name": "Output_r_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "Output_r", "role": "dout" }} , 
 	{ "name": "Output_r_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Output_r", "role": "empty_n" }} , 
 	{ "name": "Output_r_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Output_r", "role": "read" }} , 
 	{ "name": "Output_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "Output_out", "role": "din" }} , 
 	{ "name": "Output_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Output_out", "role": "full_n" }} , 
 	{ "name": "Output_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Output_out", "role": "write" }} , 
 	{ "name": "inStream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inStream", "role": "din" }} , 
 	{ "name": "inStream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inStream", "role": "full_n" }} , 
 	{ "name": "inStream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inStream", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "read_input3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "129673", "EstimateLatencyMax" : "129673",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "aximm1", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "aximm1_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "aximm1_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "Input_r", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "Input_r_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Output_r", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "Output_r_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Output_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "Output_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "inStream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inStream_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	read_input3 {
		aximm1 {Type I LastRead 72 FirstWrite -1}
		Input_r {Type I LastRead 0 FirstWrite -1}
		Output_r {Type I LastRead 0 FirstWrite -1}
		Output_out {Type O LastRead -1 FirstWrite 0}
		inStream {Type O LastRead -1 FirstWrite 73}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "129673", "Max" : "129673"}
	, {"Name" : "Interval", "Min" : "129673", "Max" : "129673"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	aximm1 { m_axi {  { m_axi_aximm1_AWVALID VALID 1 1 }  { m_axi_aximm1_AWREADY READY 0 1 }  { m_axi_aximm1_AWADDR ADDR 1 64 }  { m_axi_aximm1_AWID ID 1 1 }  { m_axi_aximm1_AWLEN LEN 1 32 }  { m_axi_aximm1_AWSIZE SIZE 1 3 }  { m_axi_aximm1_AWBURST BURST 1 2 }  { m_axi_aximm1_AWLOCK LOCK 1 2 }  { m_axi_aximm1_AWCACHE CACHE 1 4 }  { m_axi_aximm1_AWPROT PROT 1 3 }  { m_axi_aximm1_AWQOS QOS 1 4 }  { m_axi_aximm1_AWREGION REGION 1 4 }  { m_axi_aximm1_AWUSER USER 1 1 }  { m_axi_aximm1_WVALID VALID 1 1 }  { m_axi_aximm1_WREADY READY 0 1 }  { m_axi_aximm1_WDATA DATA 1 512 }  { m_axi_aximm1_WSTRB STRB 1 64 }  { m_axi_aximm1_WLAST LAST 1 1 }  { m_axi_aximm1_WID ID 1 1 }  { m_axi_aximm1_WUSER USER 1 1 }  { m_axi_aximm1_ARVALID VALID 1 1 }  { m_axi_aximm1_ARREADY READY 0 1 }  { m_axi_aximm1_ARADDR ADDR 1 64 }  { m_axi_aximm1_ARID ID 1 1 }  { m_axi_aximm1_ARLEN LEN 1 32 }  { m_axi_aximm1_ARSIZE SIZE 1 3 }  { m_axi_aximm1_ARBURST BURST 1 2 }  { m_axi_aximm1_ARLOCK LOCK 1 2 }  { m_axi_aximm1_ARCACHE CACHE 1 4 }  { m_axi_aximm1_ARPROT PROT 1 3 }  { m_axi_aximm1_ARQOS QOS 1 4 }  { m_axi_aximm1_ARREGION REGION 1 4 }  { m_axi_aximm1_ARUSER USER 1 1 }  { m_axi_aximm1_RVALID VALID 0 1 }  { m_axi_aximm1_RREADY READY 1 1 }  { m_axi_aximm1_RDATA DATA 0 512 }  { m_axi_aximm1_RLAST LAST 0 1 }  { m_axi_aximm1_RID ID 0 1 }  { m_axi_aximm1_RUSER USER 0 1 }  { m_axi_aximm1_RRESP RESP 0 2 }  { m_axi_aximm1_BVALID VALID 0 1 }  { m_axi_aximm1_BREADY READY 1 1 }  { m_axi_aximm1_BRESP RESP 0 2 }  { m_axi_aximm1_BID ID 0 1 }  { m_axi_aximm1_BUSER USER 0 1 } } }
	Input_r { ap_fifo {  { Input_r_dout fifo_data 0 64 }  { Input_r_empty_n fifo_status 0 1 }  { Input_r_read fifo_update 1 1 } } }
	Output_r { ap_fifo {  { Output_r_dout fifo_data 0 64 }  { Output_r_empty_n fifo_status 0 1 }  { Output_r_read fifo_update 1 1 } } }
	Output_out { ap_fifo {  { Output_out_din fifo_data 1 64 }  { Output_out_full_n fifo_status 0 1 }  { Output_out_write fifo_update 1 1 } } }
	inStream { ap_fifo {  { inStream_din fifo_data 1 8 }  { inStream_full_n fifo_status 0 1 }  { inStream_write fifo_update 1 1 } } }
}
