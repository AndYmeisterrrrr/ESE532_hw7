// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
module Filter_HW_Filter_vertical_HW_Input_tmp_ram (addr0, ce0, d0, we0, addr1, ce1, q1, addr2, ce2, q2, addr3, ce3, q3, addr4, ce4, q4, addr5, ce5, q5, addr6, ce6, q6,  clk);

parameter DWIDTH = 8;
parameter AWIDTH = 12;
parameter MEM_SIZE = 3318;

input[AWIDTH-1:0] addr0;
input ce0;
input[DWIDTH-1:0] d0;
input we0;
input[AWIDTH-1:0] addr1;
input ce1;
output reg[DWIDTH-1:0] q1;
input[AWIDTH-1:0] addr2;
input ce2;
output reg[DWIDTH-1:0] q2;
input[AWIDTH-1:0] addr3;
input ce3;
output reg[DWIDTH-1:0] q3;
input[AWIDTH-1:0] addr4;
input ce4;
output reg[DWIDTH-1:0] q4;
input[AWIDTH-1:0] addr5;
input ce5;
output reg[DWIDTH-1:0] q5;
input[AWIDTH-1:0] addr6;
input ce6;
output reg[DWIDTH-1:0] q6;
input clk;

reg [DWIDTH-1:0] ram0[0:MEM_SIZE-1];
reg [DWIDTH-1:0] ram1[0:MEM_SIZE-1];
reg [DWIDTH-1:0] ram2[0:MEM_SIZE-1];
reg [DWIDTH-1:0] ram3[0:MEM_SIZE-1];
reg [DWIDTH-1:0] ram4[0:MEM_SIZE-1];
reg [DWIDTH-1:0] ram5[0:MEM_SIZE-1];



always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram0[addr0] <= d0; 
    end
end


always @(posedge clk)  
begin 
    if (ce1) begin
        q1 <= ram0[addr1];
    end
end


always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram1[addr0] <= d0; 
    end
end

always @(posedge clk)  
begin 
    if (ce2) begin
        q2 <= ram1[addr2];
    end
end


always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram2[addr0] <= d0; 
    end
end

always @(posedge clk)  
begin 
    if (ce3) begin
        q3 <= ram2[addr3];
    end
end


always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram3[addr0] <= d0; 
    end
end

always @(posedge clk)  
begin 
    if (ce4) begin
        q4 <= ram3[addr4];
    end
end


always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram4[addr0] <= d0; 
    end
end

always @(posedge clk)  
begin 
    if (ce5) begin
        q5 <= ram4[addr5];
    end
end


always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram5[addr0] <= d0; 
    end
end

always @(posedge clk)  
begin 
    if (ce6) begin
        q6 <= ram5[addr6];
    end
end


endmodule

`timescale 1 ns / 1 ps
module Filter_HW_Filter_vertical_HW_Input_tmp(
    reset,
    clk,
    address0,
    ce0,
    we0,
    d0,
    address1,
    ce1,
    q1,
    address2,
    ce2,
    q2,
    address3,
    ce3,
    q3,
    address4,
    ce4,
    q4,
    address5,
    ce5,
    q5,
    address6,
    ce6,
    q6);

parameter DataWidth = 32'd8;
parameter AddressRange = 32'd3318;
parameter AddressWidth = 32'd12;
input reset;
input clk;
input[AddressWidth - 1:0] address0;
input ce0;
input we0;
input[DataWidth - 1:0] d0;
input[AddressWidth - 1:0] address1;
input ce1;
output[DataWidth - 1:0] q1;
input[AddressWidth - 1:0] address2;
input ce2;
output[DataWidth - 1:0] q2;
input[AddressWidth - 1:0] address3;
input ce3;
output[DataWidth - 1:0] q3;
input[AddressWidth - 1:0] address4;
input ce4;
output[DataWidth - 1:0] q4;
input[AddressWidth - 1:0] address5;
input ce5;
output[DataWidth - 1:0] q5;
input[AddressWidth - 1:0] address6;
input ce6;
output[DataWidth - 1:0] q6;



Filter_HW_Filter_vertical_HW_Input_tmp_ram Filter_HW_Filter_vertical_HW_Input_tmp_ram_U(
    .clk( clk ),
    .addr0( address0 ),
    .ce0( ce0 ),
    .we0( we0 ),
    .d0( d0 ),
    .addr1( address1 ),
    .ce1( ce1 ),
    .q1( q1 ),
    .addr2( address2 ),
    .ce2( ce2 ),
    .q2( q2 ),
    .addr3( address3 ),
    .ce3( ce3 ),
    .q3( q3 ),
    .addr4( address4 ),
    .ce4( ce4 ),
    .q4( q4 ),
    .addr5( address5 ),
    .ce5( ce5 ),
    .q5( q5 ),
    .addr6( address6 ),
    .ce6( ce6 ),
    .q6( q6 ));

endmodule

