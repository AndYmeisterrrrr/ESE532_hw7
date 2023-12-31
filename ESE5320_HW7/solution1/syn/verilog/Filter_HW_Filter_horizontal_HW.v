// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Filter_HW_Filter_horizontal_HW (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        inStream_dout,
        inStream_empty_n,
        inStream_read,
        TempStream_din,
        TempStream_full_n,
        TempStream_write
);

parameter    ap_ST_fsm_state1 = 9'd1;
parameter    ap_ST_fsm_state2 = 9'd2;
parameter    ap_ST_fsm_state3 = 9'd4;
parameter    ap_ST_fsm_state4 = 9'd8;
parameter    ap_ST_fsm_state5 = 9'd16;
parameter    ap_ST_fsm_state6 = 9'd32;
parameter    ap_ST_fsm_state7 = 9'd64;
parameter    ap_ST_fsm_pp0_stage0 = 9'd128;
parameter    ap_ST_fsm_state13 = 9'd256;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
input  [7:0] inStream_dout;
input   inStream_empty_n;
output   inStream_read;
output  [7:0] TempStream_din;
input   TempStream_full_n;
output   TempStream_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg inStream_read;
reg TempStream_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [8:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    inStream_blk_n;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln31_fu_169_p2;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
wire    ap_CS_fsm_state7;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] icmp_ln40_reg_374;
reg    TempStream_blk_n;
reg    ap_enable_reg_pp0_iter4;
reg   [0:0] icmp_ln40_reg_374_pp0_iter3_reg;
reg   [8:0] X_reg_88;
reg   [7:0] input_buffer_4_1_reg_99;
reg   [7:0] input_buffer_4_1_reg_99_pp0_iter2_reg;
wire    ap_block_state8_pp0_stage0_iter0;
reg    ap_block_state9_pp0_stage0_iter1;
wire    ap_block_state10_pp0_stage0_iter2;
wire    ap_block_state11_pp0_stage0_iter3;
reg    ap_block_state12_pp0_stage0_iter4;
reg    ap_block_pp0_stage0_11001;
reg   [7:0] input_buffer_3_1_reg_109;
reg   [7:0] input_buffer_3_1_reg_109_pp0_iter2_reg;
reg   [7:0] input_buffer_2_1_reg_120;
reg   [7:0] input_buffer_2_1_reg_120_pp0_iter2_reg;
reg   [7:0] input_buffer_2_1_reg_120_pp0_iter3_reg;
reg   [7:0] input_buffer_1_1_reg_131;
reg   [7:0] input_buffer_0_1_reg_142;
reg   [7:0] input_buffer_0_0_i_reg_153;
wire   [8:0] Y_3_fu_163_p2;
reg   [8:0] Y_3_reg_331;
reg    ap_block_state2;
reg   [7:0] tmp_reg_339;
reg   [7:0] tmp_2_reg_344;
reg   [7:0] tmp_3_reg_349;
reg   [7:0] tmp_4_reg_354;
reg   [7:0] tmp_5_reg_359;
wire   [8:0] X_2_fu_175_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [0:0] icmp_ln40_fu_181_p2;
reg   [0:0] icmp_ln40_reg_374_pp0_iter1_reg;
reg   [0:0] icmp_ln40_reg_374_pp0_iter2_reg;
reg   [7:0] tmp_7_reg_378;
reg   [7:0] tmp_7_reg_378_pp0_iter2_reg;
wire   [8:0] tmp_i_fu_207_p2;
reg   [8:0] tmp_i_reg_389;
wire   [8:0] tmp2_i_fu_213_p2;
reg   [8:0] tmp2_i_reg_395;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_condition_pp0_exit_iter3_state11;
reg   [8:0] Y_reg_77;
reg    ap_block_state1;
wire    ap_CS_fsm_state13;
reg   [7:0] ap_phi_mux_input_buffer_2_1_phi_fu_123_p4;
reg   [7:0] ap_phi_mux_input_buffer_1_1_phi_fu_134_p4;
reg   [7:0] ap_phi_mux_input_buffer_0_1_phi_fu_145_p4;
reg   [7:0] ap_phi_mux_input_buffer_0_0_i_phi_fu_156_p4;
reg    ap_block_pp0_stage0_01001;
wire   [8:0] zext_ln43_fu_199_p1;
wire   [8:0] zext_ln48_1_fu_195_p1;
wire   [8:0] zext_ln43_1_fu_203_p1;
wire   [8:0] zext_ln48_fu_191_p1;
wire   [8:0] input_buffer_0_0_cast_i_fu_222_p1;
wire   [8:0] tmp_16_cast_i_fu_219_p1;
wire   [8:0] tmp41_i_fu_226_p2;
wire   [9:0] tmp5_i_fu_232_p3;
wire   [14:0] p_shl3_i_fu_244_p3;
wire   [9:0] p_shl4_i_fu_255_p3;
wire   [15:0] p_shl3_cast_i_fu_251_p1;
wire   [15:0] p_shl4_cast_i_fu_262_p1;
wire   [12:0] p_shl_i_fu_275_p3;
wire   [13:0] p_shl_cast_i_fu_282_p1;
wire   [13:0] tmp2_cast13_i_fu_272_p1;
wire   [13:0] tmp3_i_fu_286_p2;
wire   [14:0] grp_fu_322_p3;
wire   [15:0] zext_ln48_4_fu_296_p1;
wire  signed [15:0] tmp3_cast_i_fu_292_p1;
wire   [15:0] add_ln48_1_fu_299_p2;
wire   [15:0] tmp1_i_fu_266_p2;
wire   [15:0] Sum_fu_305_p2;
wire   [7:0] grp_fu_322_p0;
wire   [7:0] grp_fu_322_p1;
wire   [9:0] grp_fu_322_p2;
reg    grp_fu_322_ce;
reg   [8:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire   [14:0] grp_fu_322_p00;
wire   [14:0] grp_fu_322_p20;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 9'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
end

Filter_HW_mac_muladd_8ns_8ns_10ns_15_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 8 ),
    .din2_WIDTH( 10 ),
    .dout_WIDTH( 15 ))
mac_muladd_8ns_8ns_10ns_15_4_1_U10(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_322_p0),
    .din1(grp_fu_322_p1),
    .din2(grp_fu_322_p2),
    .ce(grp_fu_322_ce),
    .dout(grp_fu_322_p3)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((~((icmp_ln31_fu_169_p2 == 1'd0) & (inStream_empty_n == 1'b0)) & (icmp_ln31_fu_169_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_pp0_flush_enable)) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state7))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end else if ((((ap_enable_reg_pp0_iter2 == 1'b0) & (1'b1 == ap_condition_pp0_exit_iter3_state11) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state7)))) begin
            ap_enable_reg_pp0_iter3 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter3_state11) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter2;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end else if (((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state7))) begin
            ap_enable_reg_pp0_iter4 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((internal_ap_ready == 1'b0) & (real_start == 1'b1))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln40_fu_181_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        X_reg_88 <= X_2_fu_175_p2;
    end else if (((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state7))) begin
        X_reg_88 <= 9'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        Y_reg_77 <= Y_3_reg_331;
    end else if ((~((ap_done_reg == 1'b1) | (real_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        Y_reg_77 <= 9'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln40_reg_374_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        input_buffer_0_0_i_reg_153 <= input_buffer_0_1_reg_142;
    end else if (((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state7))) begin
        input_buffer_0_0_i_reg_153 <= tmp_reg_339;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln40_reg_374_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        input_buffer_0_1_reg_142 <= input_buffer_1_1_reg_131;
    end else if (((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state7))) begin
        input_buffer_0_1_reg_142 <= tmp_2_reg_344;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln40_reg_374_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        input_buffer_1_1_reg_131 <= input_buffer_2_1_reg_120_pp0_iter3_reg;
    end else if (((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state7))) begin
        input_buffer_1_1_reg_131 <= tmp_3_reg_349;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln40_reg_374_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        input_buffer_2_1_reg_120 <= input_buffer_3_1_reg_109;
    end else if (((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state7))) begin
        input_buffer_2_1_reg_120 <= tmp_4_reg_354;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln40_reg_374_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        input_buffer_3_1_reg_109 <= input_buffer_4_1_reg_99;
    end else if (((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state7))) begin
        input_buffer_3_1_reg_109 <= tmp_5_reg_359;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln40_reg_374_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        input_buffer_4_1_reg_99 <= tmp_7_reg_378;
    end else if (((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state7))) begin
        input_buffer_4_1_reg_99 <= inStream_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((~((icmp_ln31_fu_169_p2 == 1'd0) & (inStream_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        Y_3_reg_331 <= Y_3_fu_163_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln40_reg_374 <= icmp_ln40_fu_181_p2;
        icmp_ln40_reg_374_pp0_iter1_reg <= icmp_ln40_reg_374;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln40_reg_374_pp0_iter2_reg <= icmp_ln40_reg_374_pp0_iter1_reg;
        icmp_ln40_reg_374_pp0_iter3_reg <= icmp_ln40_reg_374_pp0_iter2_reg;
        input_buffer_2_1_reg_120_pp0_iter2_reg <= input_buffer_2_1_reg_120;
        input_buffer_2_1_reg_120_pp0_iter3_reg <= input_buffer_2_1_reg_120_pp0_iter2_reg;
        input_buffer_3_1_reg_109_pp0_iter2_reg <= input_buffer_3_1_reg_109;
        input_buffer_4_1_reg_99_pp0_iter2_reg <= input_buffer_4_1_reg_99;
        tmp_7_reg_378_pp0_iter2_reg <= tmp_7_reg_378;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln40_reg_374_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp2_i_reg_395 <= tmp2_i_fu_213_p2;
        tmp_i_reg_389 <= tmp_i_fu_207_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        tmp_2_reg_344 <= inStream_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        tmp_3_reg_349 <= inStream_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        tmp_4_reg_354 <= inStream_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        tmp_5_reg_359 <= inStream_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln40_reg_374 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_7_reg_378 <= inStream_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln31_fu_169_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp_reg_339 <= inStream_dout;
    end
end

always @ (*) begin
    if (((icmp_ln40_reg_374_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        TempStream_blk_n = TempStream_full_n;
    end else begin
        TempStream_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln40_reg_374_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        TempStream_write = 1'b1;
    end else begin
        TempStream_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b0))) begin
        ap_condition_pp0_exit_iter3_state11 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter3_state11 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln40_fu_181_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
    end
end

always @ (*) begin
    if ((~((icmp_ln31_fu_169_p2 == 1'd0) & (inStream_empty_n == 1'b0)) & (icmp_ln31_fu_169_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (real_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln40_reg_374_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_input_buffer_0_0_i_phi_fu_156_p4 = input_buffer_0_1_reg_142;
    end else begin
        ap_phi_mux_input_buffer_0_0_i_phi_fu_156_p4 = input_buffer_0_0_i_reg_153;
    end
end

always @ (*) begin
    if (((icmp_ln40_reg_374_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_input_buffer_0_1_phi_fu_145_p4 = input_buffer_1_1_reg_131;
    end else begin
        ap_phi_mux_input_buffer_0_1_phi_fu_145_p4 = input_buffer_0_1_reg_142;
    end
end

always @ (*) begin
    if (((icmp_ln40_reg_374_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_input_buffer_1_1_phi_fu_134_p4 = input_buffer_2_1_reg_120_pp0_iter3_reg;
    end else begin
        ap_phi_mux_input_buffer_1_1_phi_fu_134_p4 = input_buffer_1_1_reg_131;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln40_reg_374_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_input_buffer_2_1_phi_fu_123_p4 = input_buffer_3_1_reg_109;
    end else begin
        ap_phi_mux_input_buffer_2_1_phi_fu_123_p4 = input_buffer_2_1_reg_120;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        grp_fu_322_ce = 1'b1;
    end else begin
        grp_fu_322_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln40_reg_374 == 1'd0) & (1'b0 == ap_block_pp0_stage0)) | ((icmp_ln31_fu_169_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
        inStream_blk_n = inStream_empty_n;
    end else begin
        inStream_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln40_reg_374 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state7)) | ((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state6)) | ((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state5)) | ((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state4)) | ((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state3)) | (~((icmp_ln31_fu_169_p2 == 1'd0) & (inStream_empty_n == 1'b0)) & (icmp_ln31_fu_169_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
        inStream_read = 1'b1;
    end else begin
        inStream_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((icmp_ln31_fu_169_p2 == 1'd0) & (inStream_empty_n == 1'b0)) & (icmp_ln31_fu_169_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (start_full_n == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (real_start == 1'b1))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (real_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((icmp_ln31_fu_169_p2 == 1'd0) & (inStream_empty_n == 1'b0)) & (icmp_ln31_fu_169_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~((icmp_ln31_fu_169_p2 == 1'd0) & (inStream_empty_n == 1'b0)) & (icmp_ln31_fu_169_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state7 : begin
            if (((inStream_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state7))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign Sum_fu_305_p2 = (add_ln48_1_fu_299_p2 + tmp1_i_fu_266_p2);

assign TempStream_din = {{Sum_fu_305_p2[15:8]}};

assign X_2_fu_175_p2 = (X_reg_88 + 9'd1);

assign Y_3_fu_163_p2 = (Y_reg_77 + 9'd1);

assign add_ln48_1_fu_299_p2 = ($signed(zext_ln48_4_fu_296_p1) + $signed(tmp3_cast_i_fu_292_p1));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd8];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((ap_enable_reg_pp0_iter1 == 1'b1) & (inStream_empty_n == 1'b0) & (icmp_ln40_reg_374 == 1'd0)) | ((1'b0 == TempStream_full_n) & (icmp_ln40_reg_374_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_enable_reg_pp0_iter1 == 1'b1) & (inStream_empty_n == 1'b0) & (icmp_ln40_reg_374 == 1'd0)) | ((1'b0 == TempStream_full_n) & (icmp_ln40_reg_374_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_enable_reg_pp0_iter1 == 1'b1) & (inStream_empty_n == 1'b0) & (icmp_ln40_reg_374 == 1'd0)) | ((1'b0 == TempStream_full_n) & (icmp_ln40_reg_374_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1)));
end

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (real_start == 1'b0));
end

assign ap_block_state10_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state12_pp0_stage0_iter4 = ((1'b0 == TempStream_full_n) & (icmp_ln40_reg_374_pp0_iter3_reg == 1'd0));
end

always @ (*) begin
    ap_block_state2 = ((icmp_ln31_fu_169_p2 == 1'd0) & (inStream_empty_n == 1'b0));
end

assign ap_block_state8_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state9_pp0_stage0_iter1 = ((inStream_empty_n == 1'b0) & (icmp_ln40_reg_374 == 1'd0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_ready = internal_ap_ready;

assign grp_fu_322_p0 = grp_fu_322_p00;

assign grp_fu_322_p00 = ap_phi_mux_input_buffer_2_1_phi_fu_123_p4;

assign grp_fu_322_p1 = 15'd98;

assign grp_fu_322_p2 = grp_fu_322_p20;

assign grp_fu_322_p20 = tmp5_i_fu_232_p3;

assign icmp_ln31_fu_169_p2 = ((Y_reg_77 == 9'd270) ? 1'b1 : 1'b0);

assign icmp_ln40_fu_181_p2 = ((X_reg_88 == 9'd474) ? 1'b1 : 1'b0);

assign input_buffer_0_0_cast_i_fu_222_p1 = ap_phi_mux_input_buffer_0_0_i_phi_fu_156_p4;

assign p_shl3_cast_i_fu_251_p1 = p_shl3_i_fu_244_p3;

assign p_shl3_i_fu_244_p3 = {{tmp_i_reg_389}, {6'd0}};

assign p_shl4_cast_i_fu_262_p1 = p_shl4_i_fu_255_p3;

assign p_shl4_i_fu_255_p3 = {{tmp_i_reg_389}, {1'd0}};

assign p_shl_cast_i_fu_282_p1 = p_shl_i_fu_275_p3;

assign p_shl_i_fu_275_p3 = {{tmp2_i_reg_395}, {4'd0}};

assign start_out = real_start;

assign tmp1_i_fu_266_p2 = (p_shl3_cast_i_fu_251_p1 - p_shl4_cast_i_fu_262_p1);

assign tmp2_cast13_i_fu_272_p1 = tmp2_i_reg_395;

assign tmp2_i_fu_213_p2 = (zext_ln43_1_fu_203_p1 + zext_ln48_fu_191_p1);

assign tmp3_cast_i_fu_292_p1 = $signed(tmp3_i_fu_286_p2);

assign tmp3_i_fu_286_p2 = (p_shl_cast_i_fu_282_p1 - tmp2_cast13_i_fu_272_p1);

assign tmp41_i_fu_226_p2 = (input_buffer_0_0_cast_i_fu_222_p1 + tmp_16_cast_i_fu_219_p1);

assign tmp5_i_fu_232_p3 = {{tmp41_i_fu_226_p2}, {1'd0}};

assign tmp_16_cast_i_fu_219_p1 = tmp_7_reg_378_pp0_iter2_reg;

assign tmp_i_fu_207_p2 = (zext_ln43_fu_199_p1 + zext_ln48_1_fu_195_p1);

assign zext_ln43_1_fu_203_p1 = input_buffer_4_1_reg_99_pp0_iter2_reg;

assign zext_ln43_fu_199_p1 = input_buffer_3_1_reg_109_pp0_iter2_reg;

assign zext_ln48_1_fu_195_p1 = ap_phi_mux_input_buffer_1_1_phi_fu_134_p4;

assign zext_ln48_4_fu_296_p1 = grp_fu_322_p3;

assign zext_ln48_fu_191_p1 = ap_phi_mux_input_buffer_0_1_phi_fu_145_p4;

endmodule //Filter_HW_Filter_horizontal_HW
