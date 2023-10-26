set moduleName Filter_HW
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_chain
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {Filter_HW}
set C_modelType { void 0 }
set C_modelArgList {
	{ aximm1 int 512 regular {axi_master 2}  }
	{ Input_r int 64 regular {axi_slave 0}  }
	{ Output_r int 64 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "aximm1", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "Input","cData": "int512","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "Input_r","bundle": "control"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]},{"cName": "Output","cData": "int512","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "Output_r","bundle": "control"},"direction": "WRITEONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "Input_r", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "Output_r", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} ]}
# RTL Port declarations: 
set portNum 65
set portList { 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
	{ m_axi_aximm1_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_aximm1_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_aximm1_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_aximm1_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_aximm1_AWLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_aximm1_ARLEN sc_out sc_lv 8 signal 0 } 
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
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"Filter_HW","role":"start","value":"0","valid_bit":"0"},{"name":"Filter_HW","role":"continue","value":"0","valid_bit":"4"},{"name":"Filter_HW","role":"auto_start","value":"0","valid_bit":"7"},{"name":"Input_r","role":"data","value":"16"},{"name":"Output_r","role":"data","value":"28"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"Filter_HW","role":"start","value":"0","valid_bit":"0"},{"name":"Filter_HW","role":"done","value":"0","valid_bit":"1"},{"name":"Filter_HW","role":"idle","value":"0","valid_bit":"2"},{"name":"Filter_HW","role":"ready","value":"0","valid_bit":"3"},{"name":"Filter_HW","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_aximm1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_aximm1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_aximm1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "aximm1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_aximm1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "AWID" }} , 
 	{ "name": "m_axi_aximm1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "aximm1", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_aximm1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "aximm1", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_aximm1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "aximm1", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "7", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36"],
		"CDFG" : "Filter_HW",
		"Protocol" : "ap_ctrl_chain",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "255709", "EstimateLatencyMax" : "255709",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "3", "Name" : "Filter_HW_entry3_U0"},
			{"ID" : "4", "Name" : "read_input3_U0"}],
		"OutputProcess" : [
			{"ID" : "27", "Name" : "write_output_U0"}],
		"Port" : [
			{"Name" : "aximm1", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "read_input3_U0", "Port" : "aximm1"},
					{"ID" : "27", "SubInstance" : "write_output_U0", "Port" : "aximm1"}]},
			{"Name" : "Input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "Output_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "inStream", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "read_input3_U0", "Port" : "inStream"},
					{"ID" : "5", "SubInstance" : "Filter_horizontal_HW_U0", "Port" : "inStream"}]},
			{"Name" : "TempStream", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "Filter_vertical_HW_U0", "Port" : "TempStream"},
					{"ID" : "5", "SubInstance" : "Filter_horizontal_HW_U0", "Port" : "TempStream"}]},
			{"Name" : "outStream", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "Filter_vertical_HW_U0", "Port" : "outStream"},
					{"ID" : "27", "SubInstance" : "write_output_U0", "Port" : "outStream"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.aximm1_m_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Filter_HW_entry3_U0", "Parent" : "0",
		"CDFG" : "Filter_HW_entry3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "Input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "Output_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "Input_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "4", "DependentChan" : "28", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "Input_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Output_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "4", "DependentChan" : "29", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "Output_out_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.read_input3_U0", "Parent" : "0",
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
			{"Name" : "Input_r", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "3", "DependentChan" : "28", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "Input_r_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Output_r", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "3", "DependentChan" : "29", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "Output_r_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Output_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "27", "DependentChan" : "30", "DependentChanDepth" : "4", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "Output_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "inStream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "31", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inStream_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Filter_horizontal_HW_U0", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "Filter_horizontal_HW",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "130951", "EstimateLatencyMax" : "130951",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "4",
		"StartFifo" : "start_for_Filter_horizontal_HW_U0_U",
		"Port" : [
			{"Name" : "inStream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "4", "DependentChan" : "31", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inStream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "TempStream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "7", "DependentChan" : "32", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "TempStream_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_horizontal_HW_U0.mac_muladd_8ns_8ns_10ns_15_4_1_U10", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0", "Parent" : "0", "Child" : ["8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26"],
		"CDFG" : "Filter_vertical_HW",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "128005", "EstimateLatencyMax" : "128005",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "5",
		"StartFifo" : "start_for_Filter_vertical_HW_U0_U",
		"Port" : [
			{"Name" : "TempStream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "5", "DependentChan" : "32", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "TempStream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outStream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "27", "DependentChan" : "33", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outStream_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0.Input_tmp_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0.urem_9ns_4ns_9_13_1_U14", "Parent" : "7"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0.urem_9ns_4ns_9_13_1_U15", "Parent" : "7"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0.urem_9ns_4ns_9_13_1_U16", "Parent" : "7"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0.urem_9ns_4ns_9_13_1_U17", "Parent" : "7"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0.urem_9ns_4ns_9_13_1_U18", "Parent" : "7"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0.urem_9ns_4ns_9_13_1_U19", "Parent" : "7"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0.urem_9ns_4ns_9_13_1_U20", "Parent" : "7"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0.urem_9ns_4ns_9_13_1_U21", "Parent" : "7"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0.mul_4ns_10ns_12_1_1_U22", "Parent" : "7"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0.mul_4ns_10ns_12_1_1_U23", "Parent" : "7"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0.mul_4ns_10ns_12_1_1_U24", "Parent" : "7"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0.mac_muladd_3ns_10ns_9ns_12_4_1_U25", "Parent" : "7"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0.mac_muladd_4ns_10ns_9ns_12_4_1_U26", "Parent" : "7"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0.mac_muladd_4ns_10ns_9ns_12_4_1_U27", "Parent" : "7"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0.mac_muladd_4ns_10ns_9ns_12_4_1_U28", "Parent" : "7"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0.mac_muladd_4ns_10ns_9ns_12_4_1_U29", "Parent" : "7"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0.mac_muladd_4ns_10ns_9ns_12_4_1_U30", "Parent" : "7"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Filter_vertical_HW_U0.mac_muladd_8ns_8ns_10ns_15_4_1_U31", "Parent" : "7"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.write_output_U0", "Parent" : "0",
		"CDFG" : "write_output",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "125207", "EstimateLatencyMax" : "125207",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "4",
		"StartFifo" : "start_for_write_output_U0_U",
		"Port" : [
			{"Name" : "aximm1", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "aximm1_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "aximm1_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "aximm1_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "out_r", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "4", "DependentChan" : "30", "DependentChanDepth" : "4", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "out_r_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outStream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "7", "DependentChan" : "33", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outStream_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Input_c_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Output_c1_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Output_c_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.inStream_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TempStream_U", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.outStream_U", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Filter_horizontal_HW_U0_U", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_write_output_U0_U", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Filter_vertical_HW_U0_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Filter_HW {
		aximm1 {Type IO LastRead 72 FirstWrite -1}
		Input_r {Type I LastRead 0 FirstWrite -1}
		Output_r {Type I LastRead 0 FirstWrite -1}
		inStream {Type IO LastRead -1 FirstWrite -1}
		TempStream {Type IO LastRead -1 FirstWrite -1}
		outStream {Type IO LastRead -1 FirstWrite -1}}
	Filter_HW_entry3 {
		Input_r {Type I LastRead 0 FirstWrite -1}
		Output_r {Type I LastRead 0 FirstWrite -1}
		Input_out {Type O LastRead -1 FirstWrite 0}
		Output_out {Type O LastRead -1 FirstWrite 0}}
	read_input3 {
		aximm1 {Type I LastRead 72 FirstWrite -1}
		Input_r {Type I LastRead 0 FirstWrite -1}
		Output_r {Type I LastRead 0 FirstWrite -1}
		Output_out {Type O LastRead -1 FirstWrite 0}
		inStream {Type O LastRead -1 FirstWrite 73}}
	Filter_horizontal_HW {
		inStream {Type I LastRead 8 FirstWrite -1}
		TempStream {Type O LastRead -1 FirstWrite 11}}
	Filter_vertical_HW {
		TempStream {Type I LastRead 18 FirstWrite -1}
		outStream {Type O LastRead -1 FirstWrite 23}}
	write_output {
		aximm1 {Type O LastRead 4 FirstWrite 3}
		out_r {Type I LastRead 0 FirstWrite -1}
		outStream {Type I LastRead 2 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "255709", "Max" : "255709"}
	, {"Name" : "Interval", "Min" : "130952", "Max" : "130952"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	aximm1 { m_axi {  { m_axi_aximm1_AWVALID VALID 1 1 }  { m_axi_aximm1_AWREADY READY 0 1 }  { m_axi_aximm1_AWADDR ADDR 1 64 }  { m_axi_aximm1_AWID ID 1 1 }  { m_axi_aximm1_AWLEN LEN 1 8 }  { m_axi_aximm1_AWSIZE SIZE 1 3 }  { m_axi_aximm1_AWBURST BURST 1 2 }  { m_axi_aximm1_AWLOCK LOCK 1 2 }  { m_axi_aximm1_AWCACHE CACHE 1 4 }  { m_axi_aximm1_AWPROT PROT 1 3 }  { m_axi_aximm1_AWQOS QOS 1 4 }  { m_axi_aximm1_AWREGION REGION 1 4 }  { m_axi_aximm1_AWUSER USER 1 1 }  { m_axi_aximm1_WVALID VALID 1 1 }  { m_axi_aximm1_WREADY READY 0 1 }  { m_axi_aximm1_WDATA DATA 1 512 }  { m_axi_aximm1_WSTRB STRB 1 64 }  { m_axi_aximm1_WLAST LAST 1 1 }  { m_axi_aximm1_WID ID 1 1 }  { m_axi_aximm1_WUSER USER 1 1 }  { m_axi_aximm1_ARVALID VALID 1 1 }  { m_axi_aximm1_ARREADY READY 0 1 }  { m_axi_aximm1_ARADDR ADDR 1 64 }  { m_axi_aximm1_ARID ID 1 1 }  { m_axi_aximm1_ARLEN LEN 1 8 }  { m_axi_aximm1_ARSIZE SIZE 1 3 }  { m_axi_aximm1_ARBURST BURST 1 2 }  { m_axi_aximm1_ARLOCK LOCK 1 2 }  { m_axi_aximm1_ARCACHE CACHE 1 4 }  { m_axi_aximm1_ARPROT PROT 1 3 }  { m_axi_aximm1_ARQOS QOS 1 4 }  { m_axi_aximm1_ARREGION REGION 1 4 }  { m_axi_aximm1_ARUSER USER 1 1 }  { m_axi_aximm1_RVALID VALID 0 1 }  { m_axi_aximm1_RREADY READY 1 1 }  { m_axi_aximm1_RDATA DATA 0 512 }  { m_axi_aximm1_RLAST LAST 0 1 }  { m_axi_aximm1_RID ID 0 1 }  { m_axi_aximm1_RUSER USER 0 1 }  { m_axi_aximm1_RRESP RESP 0 2 }  { m_axi_aximm1_BVALID VALID 0 1 }  { m_axi_aximm1_BREADY READY 1 1 }  { m_axi_aximm1_BRESP RESP 0 2 }  { m_axi_aximm1_BID ID 0 1 }  { m_axi_aximm1_BUSER USER 0 1 } } }
}

set busDeadlockParameterList { 
	{ aximm1 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ aximm1 64 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ aximm1 64 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
