// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xfilter_hw.h"

extern XFilter_hw_Config XFilter_hw_ConfigTable[];

XFilter_hw_Config *XFilter_hw_LookupConfig(u16 DeviceId) {
	XFilter_hw_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XFILTER_HW_NUM_INSTANCES; Index++) {
		if (XFilter_hw_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XFilter_hw_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFilter_hw_Initialize(XFilter_hw *InstancePtr, u16 DeviceId) {
	XFilter_hw_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFilter_hw_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFilter_hw_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

