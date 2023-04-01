// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Mon Jan 23 15:24:27 2023
// Host        : ensc-pit-w07 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/crosenau/Desktop/ughHardware/backup/backup.gen/sources_1/bd/design_1/ip/design_1_vga_controller_1_0/design_1_vga_controller_1_0_sim_netlist.v
// Design      : design_1_vga_controller_1_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_vga_controller_1_0,vga_controller,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "package_project" *) 
(* x_core_info = "vga_controller,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module design_1_vga_controller_1_0
   (VGA_R,
    VGA_G,
    VGA_B,
    VGA_HS,
    VGA_VS,
    clk,
    pixel_clk,
    rstn,
    pixel_rstn,
    fifo_rst,
    rfifo_count,
    switch_buffer,
    switch_buffer_ack,
    M_AXI_AWID,
    M_AXI_AWADDR,
    M_AXI_AWLEN,
    M_AXI_AWSIZE,
    M_AXI_AWBURST,
    M_AXI_AWLOCK,
    M_AXI_AWCACHE,
    M_AXI_AWPROT,
    M_AXI_AWQOS,
    M_AXI_AWUSER,
    M_AXI_AWVALID,
    M_AXI_AWREADY,
    M_AXI_WID,
    M_AXI_WDATA,
    M_AXI_WSTRB,
    M_AXI_WLAST,
    M_AXI_WVALID,
    M_AXI_WREADY,
    M_AXI_BID,
    M_AXI_BRESP,
    M_AXI_BVALID,
    M_AXI_BREADY,
    M_AXI_ARID,
    M_AXI_ARADDR,
    M_AXI_ARLEN,
    M_AXI_ARSIZE,
    M_AXI_ARBURST,
    M_AXI_ARLOCK,
    M_AXI_ARCACHE,
    M_AXI_ARPROT,
    M_AXI_ARQOS,
    M_AXI_ARUSER,
    M_AXI_ARVALID,
    M_AXI_ARREADY,
    M_AXI_RID,
    M_AXI_RDATA,
    M_AXI_RRESP,
    M_AXI_RLAST,
    M_AXI_RVALID,
    M_AXI_RREADY);
  output [3:0]VGA_R;
  output [3:0]VGA_G;
  output [3:0]VGA_B;
  output VGA_HS;
  output VGA_VS;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rstn, ASSOCIATED_BUSIF M_AXI, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 pixel_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME pixel_clk, ASSOCIATED_RESET pixel_rstn, FREQ_HZ 108000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input pixel_clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 rstn RST" *) (* x_interface_parameter = "XIL_INTERFACENAME rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rstn;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 pixel_rstn RST" *) (* x_interface_parameter = "XIL_INTERFACENAME pixel_rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input pixel_rstn;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 fifo_rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME fifo_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input fifo_rst;
  input [7:0]rfifo_count;
  input switch_buffer;
  output switch_buffer_ack;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWID" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXI, DATA_WIDTH 64, PROTOCOL AXI3, FREQ_HZ 125000000, ID_WIDTH 3, ADDR_WIDTH 32, AWUSER_WIDTH 5, ARUSER_WIDTH 5, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 16, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output [2:0]M_AXI_AWID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWADDR" *) output [31:0]M_AXI_AWADDR;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWLEN" *) output [3:0]M_AXI_AWLEN;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWSIZE" *) output [2:0]M_AXI_AWSIZE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWBURST" *) output [1:0]M_AXI_AWBURST;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWLOCK" *) output [1:0]M_AXI_AWLOCK;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWCACHE" *) output [3:0]M_AXI_AWCACHE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWPROT" *) output [2:0]M_AXI_AWPROT;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWQOS" *) output [3:0]M_AXI_AWQOS;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWUSER" *) output [4:0]M_AXI_AWUSER;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWVALID" *) output M_AXI_AWVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWREADY" *) input M_AXI_AWREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI WID" *) output [5:0]M_AXI_WID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI WDATA" *) output [63:0]M_AXI_WDATA;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI WSTRB" *) output [7:0]M_AXI_WSTRB;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI WLAST" *) output M_AXI_WLAST;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI WVALID" *) output M_AXI_WVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI WREADY" *) input M_AXI_WREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI BID" *) input [2:0]M_AXI_BID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI BRESP" *) input [1:0]M_AXI_BRESP;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI BVALID" *) input M_AXI_BVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI BREADY" *) output M_AXI_BREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARID" *) output [2:0]M_AXI_ARID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARADDR" *) output [31:0]M_AXI_ARADDR;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARLEN" *) output [3:0]M_AXI_ARLEN;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARSIZE" *) output [2:0]M_AXI_ARSIZE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARBURST" *) output [1:0]M_AXI_ARBURST;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARLOCK" *) output [1:0]M_AXI_ARLOCK;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARCACHE" *) output [3:0]M_AXI_ARCACHE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARPROT" *) output [2:0]M_AXI_ARPROT;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARQOS" *) output [3:0]M_AXI_ARQOS;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARUSER" *) output [4:0]M_AXI_ARUSER;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARVALID" *) output M_AXI_ARVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARREADY" *) input M_AXI_ARREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI RID" *) input [2:0]M_AXI_RID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI RDATA" *) input [63:0]M_AXI_RDATA;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI RRESP" *) input [1:0]M_AXI_RRESP;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI RLAST" *) input M_AXI_RLAST;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI RVALID" *) input M_AXI_RVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI RREADY" *) output M_AXI_RREADY;

  wire \<const0> ;
  wire \<const1> ;
  wire [31:0]\^M_AXI_ARADDR ;
  wire M_AXI_ARREADY;
  wire M_AXI_ARVALID;
  wire M_AXI_RREADY;
  wire M_AXI_RVALID;
  wire clk;
  wire fifo_rst;
  wire pixel_clk;
  wire [7:0]rfifo_count;
  wire rstn;
  wire switch_buffer;
  wire switch_buffer_ack;

  assign M_AXI_ARADDR[31:6] = \^M_AXI_ARADDR [31:6];
  assign M_AXI_ARADDR[5] = \<const0> ;
  assign M_AXI_ARADDR[4] = \<const0> ;
  assign M_AXI_ARADDR[3] = \<const0> ;
  assign M_AXI_ARADDR[2] = \<const0> ;
  assign M_AXI_ARADDR[1] = \<const0> ;
  assign M_AXI_ARADDR[0] = \^M_AXI_ARADDR [0];
  assign M_AXI_ARBURST[1] = \<const0> ;
  assign M_AXI_ARBURST[0] = \<const1> ;
  assign M_AXI_ARCACHE[3] = \<const0> ;
  assign M_AXI_ARCACHE[2] = \<const0> ;
  assign M_AXI_ARCACHE[1] = \<const1> ;
  assign M_AXI_ARCACHE[0] = \<const1> ;
  assign M_AXI_ARID[2] = \<const0> ;
  assign M_AXI_ARID[1] = \<const0> ;
  assign M_AXI_ARID[0] = \<const0> ;
  assign M_AXI_ARLEN[3] = \<const1> ;
  assign M_AXI_ARLEN[2] = \<const1> ;
  assign M_AXI_ARLEN[1] = \<const1> ;
  assign M_AXI_ARLEN[0] = \<const1> ;
  assign M_AXI_ARLOCK[1] = \<const0> ;
  assign M_AXI_ARLOCK[0] = \<const0> ;
  assign M_AXI_ARPROT[2] = \<const0> ;
  assign M_AXI_ARPROT[1] = \<const0> ;
  assign M_AXI_ARPROT[0] = \<const0> ;
  assign M_AXI_ARQOS[3] = \<const0> ;
  assign M_AXI_ARQOS[2] = \<const0> ;
  assign M_AXI_ARQOS[1] = \<const0> ;
  assign M_AXI_ARQOS[0] = \<const0> ;
  assign M_AXI_ARSIZE[2] = \<const0> ;
  assign M_AXI_ARSIZE[1] = \<const1> ;
  assign M_AXI_ARSIZE[0] = \<const1> ;
  assign M_AXI_ARUSER[4] = \<const0> ;
  assign M_AXI_ARUSER[3] = \<const0> ;
  assign M_AXI_ARUSER[2] = \<const0> ;
  assign M_AXI_ARUSER[1] = \<const0> ;
  assign M_AXI_ARUSER[0] = \<const0> ;
  assign M_AXI_AWADDR[31] = \<const0> ;
  assign M_AXI_AWADDR[30] = \<const0> ;
  assign M_AXI_AWADDR[29] = \<const0> ;
  assign M_AXI_AWADDR[28] = \<const0> ;
  assign M_AXI_AWADDR[27] = \<const0> ;
  assign M_AXI_AWADDR[26] = \<const0> ;
  assign M_AXI_AWADDR[25] = \<const0> ;
  assign M_AXI_AWADDR[24] = \<const0> ;
  assign M_AXI_AWADDR[23] = \<const0> ;
  assign M_AXI_AWADDR[22] = \<const0> ;
  assign M_AXI_AWADDR[21] = \<const0> ;
  assign M_AXI_AWADDR[20] = \<const0> ;
  assign M_AXI_AWADDR[19] = \<const0> ;
  assign M_AXI_AWADDR[18] = \<const0> ;
  assign M_AXI_AWADDR[17] = \<const0> ;
  assign M_AXI_AWADDR[16] = \<const0> ;
  assign M_AXI_AWADDR[15] = \<const0> ;
  assign M_AXI_AWADDR[14] = \<const0> ;
  assign M_AXI_AWADDR[13] = \<const0> ;
  assign M_AXI_AWADDR[12] = \<const0> ;
  assign M_AXI_AWADDR[11] = \<const0> ;
  assign M_AXI_AWADDR[10] = \<const0> ;
  assign M_AXI_AWADDR[9] = \<const0> ;
  assign M_AXI_AWADDR[8] = \<const0> ;
  assign M_AXI_AWADDR[7] = \<const0> ;
  assign M_AXI_AWADDR[6] = \<const0> ;
  assign M_AXI_AWADDR[5] = \<const0> ;
  assign M_AXI_AWADDR[4] = \<const0> ;
  assign M_AXI_AWADDR[3] = \<const0> ;
  assign M_AXI_AWADDR[2] = \<const0> ;
  assign M_AXI_AWADDR[1] = \<const0> ;
  assign M_AXI_AWADDR[0] = \<const0> ;
  assign M_AXI_AWBURST[1] = \<const0> ;
  assign M_AXI_AWBURST[0] = \<const0> ;
  assign M_AXI_AWCACHE[3] = \<const0> ;
  assign M_AXI_AWCACHE[2] = \<const0> ;
  assign M_AXI_AWCACHE[1] = \<const0> ;
  assign M_AXI_AWCACHE[0] = \<const0> ;
  assign M_AXI_AWID[2] = \<const0> ;
  assign M_AXI_AWID[1] = \<const0> ;
  assign M_AXI_AWID[0] = \<const0> ;
  assign M_AXI_AWLEN[3] = \<const0> ;
  assign M_AXI_AWLEN[2] = \<const0> ;
  assign M_AXI_AWLEN[1] = \<const0> ;
  assign M_AXI_AWLEN[0] = \<const0> ;
  assign M_AXI_AWLOCK[1] = \<const0> ;
  assign M_AXI_AWLOCK[0] = \<const0> ;
  assign M_AXI_AWPROT[2] = \<const0> ;
  assign M_AXI_AWPROT[1] = \<const0> ;
  assign M_AXI_AWPROT[0] = \<const0> ;
  assign M_AXI_AWQOS[3] = \<const0> ;
  assign M_AXI_AWQOS[2] = \<const0> ;
  assign M_AXI_AWQOS[1] = \<const0> ;
  assign M_AXI_AWQOS[0] = \<const0> ;
  assign M_AXI_AWSIZE[2] = \<const0> ;
  assign M_AXI_AWSIZE[1] = \<const0> ;
  assign M_AXI_AWSIZE[0] = \<const0> ;
  assign M_AXI_AWUSER[4] = \<const0> ;
  assign M_AXI_AWUSER[3] = \<const0> ;
  assign M_AXI_AWUSER[2] = \<const0> ;
  assign M_AXI_AWUSER[1] = \<const0> ;
  assign M_AXI_AWUSER[0] = \<const0> ;
  assign M_AXI_AWVALID = \<const0> ;
  assign M_AXI_BREADY = \<const0> ;
  assign M_AXI_WDATA[63] = \<const0> ;
  assign M_AXI_WDATA[62] = \<const0> ;
  assign M_AXI_WDATA[61] = \<const0> ;
  assign M_AXI_WDATA[60] = \<const0> ;
  assign M_AXI_WDATA[59] = \<const0> ;
  assign M_AXI_WDATA[58] = \<const0> ;
  assign M_AXI_WDATA[57] = \<const0> ;
  assign M_AXI_WDATA[56] = \<const0> ;
  assign M_AXI_WDATA[55] = \<const0> ;
  assign M_AXI_WDATA[54] = \<const0> ;
  assign M_AXI_WDATA[53] = \<const0> ;
  assign M_AXI_WDATA[52] = \<const0> ;
  assign M_AXI_WDATA[51] = \<const0> ;
  assign M_AXI_WDATA[50] = \<const0> ;
  assign M_AXI_WDATA[49] = \<const0> ;
  assign M_AXI_WDATA[48] = \<const0> ;
  assign M_AXI_WDATA[47] = \<const0> ;
  assign M_AXI_WDATA[46] = \<const0> ;
  assign M_AXI_WDATA[45] = \<const0> ;
  assign M_AXI_WDATA[44] = \<const0> ;
  assign M_AXI_WDATA[43] = \<const0> ;
  assign M_AXI_WDATA[42] = \<const0> ;
  assign M_AXI_WDATA[41] = \<const0> ;
  assign M_AXI_WDATA[40] = \<const0> ;
  assign M_AXI_WDATA[39] = \<const0> ;
  assign M_AXI_WDATA[38] = \<const0> ;
  assign M_AXI_WDATA[37] = \<const0> ;
  assign M_AXI_WDATA[36] = \<const0> ;
  assign M_AXI_WDATA[35] = \<const0> ;
  assign M_AXI_WDATA[34] = \<const0> ;
  assign M_AXI_WDATA[33] = \<const0> ;
  assign M_AXI_WDATA[32] = \<const0> ;
  assign M_AXI_WDATA[31] = \<const0> ;
  assign M_AXI_WDATA[30] = \<const0> ;
  assign M_AXI_WDATA[29] = \<const0> ;
  assign M_AXI_WDATA[28] = \<const0> ;
  assign M_AXI_WDATA[27] = \<const0> ;
  assign M_AXI_WDATA[26] = \<const0> ;
  assign M_AXI_WDATA[25] = \<const0> ;
  assign M_AXI_WDATA[24] = \<const0> ;
  assign M_AXI_WDATA[23] = \<const0> ;
  assign M_AXI_WDATA[22] = \<const0> ;
  assign M_AXI_WDATA[21] = \<const0> ;
  assign M_AXI_WDATA[20] = \<const0> ;
  assign M_AXI_WDATA[19] = \<const0> ;
  assign M_AXI_WDATA[18] = \<const0> ;
  assign M_AXI_WDATA[17] = \<const0> ;
  assign M_AXI_WDATA[16] = \<const0> ;
  assign M_AXI_WDATA[15] = \<const0> ;
  assign M_AXI_WDATA[14] = \<const0> ;
  assign M_AXI_WDATA[13] = \<const0> ;
  assign M_AXI_WDATA[12] = \<const0> ;
  assign M_AXI_WDATA[11] = \<const0> ;
  assign M_AXI_WDATA[10] = \<const0> ;
  assign M_AXI_WDATA[9] = \<const0> ;
  assign M_AXI_WDATA[8] = \<const0> ;
  assign M_AXI_WDATA[7] = \<const0> ;
  assign M_AXI_WDATA[6] = \<const0> ;
  assign M_AXI_WDATA[5] = \<const0> ;
  assign M_AXI_WDATA[4] = \<const0> ;
  assign M_AXI_WDATA[3] = \<const0> ;
  assign M_AXI_WDATA[2] = \<const0> ;
  assign M_AXI_WDATA[1] = \<const0> ;
  assign M_AXI_WDATA[0] = \<const0> ;
  assign M_AXI_WID[5] = \<const0> ;
  assign M_AXI_WID[4] = \<const0> ;
  assign M_AXI_WID[3] = \<const0> ;
  assign M_AXI_WID[2] = \<const0> ;
  assign M_AXI_WID[1] = \<const0> ;
  assign M_AXI_WID[0] = \<const0> ;
  assign M_AXI_WLAST = \<const0> ;
  assign M_AXI_WSTRB[7] = \<const0> ;
  assign M_AXI_WSTRB[6] = \<const0> ;
  assign M_AXI_WSTRB[5] = \<const0> ;
  assign M_AXI_WSTRB[4] = \<const0> ;
  assign M_AXI_WSTRB[3] = \<const0> ;
  assign M_AXI_WSTRB[2] = \<const0> ;
  assign M_AXI_WSTRB[1] = \<const0> ;
  assign M_AXI_WSTRB[0] = \<const0> ;
  assign M_AXI_WVALID = \<const0> ;
  assign VGA_B[3] = \<const0> ;
  assign VGA_B[2] = \<const0> ;
  assign VGA_B[1] = \<const0> ;
  assign VGA_B[0] = \<const0> ;
  assign VGA_G[3] = \<const0> ;
  assign VGA_G[2] = \<const0> ;
  assign VGA_G[1] = \<const0> ;
  assign VGA_G[0] = \<const0> ;
  assign VGA_HS = \<const1> ;
  assign VGA_R[3] = \<const0> ;
  assign VGA_R[2] = \<const0> ;
  assign VGA_R[1] = \<const0> ;
  assign VGA_R[0] = \<const0> ;
  assign VGA_VS = \<const1> ;
  GND GND
       (.G(\<const0> ));
  design_1_vga_controller_1_0_vga_controller U0
       (.M_AXI_ARADDR({\^M_AXI_ARADDR [31:6],\^M_AXI_ARADDR [0]}),
        .M_AXI_ARREADY(M_AXI_ARREADY),
        .M_AXI_ARVALID(M_AXI_ARVALID),
        .M_AXI_RREADY(M_AXI_RREADY),
        .M_AXI_RVALID(M_AXI_RVALID),
        .clk(clk),
        .fifo_rst(fifo_rst),
        .pixel_clk(pixel_clk),
        .rfifo_count(rfifo_count),
        .rstn(rstn),
        .switch_buffer(switch_buffer),
        .switch_buffer_ack_reg_reg_0(switch_buffer_ack));
  VCC VCC
       (.P(\<const1> ));
endmodule

(* CHECK_LICENSE_TYPE = "fifo_generator_0,fifo_generator_v13_2_5,{}" *) (* ORIG_REF_NAME = "fifo_generator_0" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "fifo_generator_v13_2_5,Vivado 2020.2" *) 
module design_1_vga_controller_1_0_fifo_generator_0
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    almost_full,
    overflow,
    empty,
    almost_empty,
    underflow,
    prog_full);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [63:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE ALMOST_FULL" *) output almost_full;
  output overflow;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ ALMOST_EMPTY" *) output almost_empty;
  output underflow;
  output prog_full;

  wire \<const0> ;
  wire prog_full;
  wire rd_clk;
  wire rst;
  wire wr_clk;
  wire wr_en;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_empty_UNCONNECTED;
  wire NLW_U0_full_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [11:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_dout_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [12:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [11:0]NLW_U0_wr_data_count_UNCONNECTED;

  assign almost_empty = \<const0> ;
  assign almost_full = \<const0> ;
  assign dout[31] = \<const0> ;
  assign dout[30] = \<const0> ;
  assign dout[29] = \<const0> ;
  assign dout[28] = \<const0> ;
  assign dout[27] = \<const0> ;
  assign dout[26] = \<const0> ;
  assign dout[25] = \<const0> ;
  assign dout[24] = \<const0> ;
  assign dout[23] = \<const0> ;
  assign dout[22] = \<const0> ;
  assign dout[21] = \<const0> ;
  assign dout[20] = \<const0> ;
  assign dout[19] = \<const0> ;
  assign dout[18] = \<const0> ;
  assign dout[17] = \<const0> ;
  assign dout[16] = \<const0> ;
  assign dout[15] = \<const0> ;
  assign dout[14] = \<const0> ;
  assign dout[13] = \<const0> ;
  assign dout[12] = \<const0> ;
  assign dout[11] = \<const0> ;
  assign dout[10] = \<const0> ;
  assign dout[9] = \<const0> ;
  assign dout[8] = \<const0> ;
  assign dout[7] = \<const0> ;
  assign dout[6] = \<const0> ;
  assign dout[5] = \<const0> ;
  assign dout[4] = \<const0> ;
  assign dout[3] = \<const0> ;
  assign dout[2] = \<const0> ;
  assign dout[1] = \<const0> ;
  assign dout[0] = \<const0> ;
  assign empty = \<const0> ;
  assign full = \<const0> ;
  assign overflow = \<const0> ;
  assign underflow = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "12" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "64" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "32" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "1" *) 
  (* C_HAS_ALMOST_FULL = "1" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "1" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "1" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "4kx9" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "3000" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "2000" *) 
  (* C_PROG_FULL_TYPE = "2" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "13" *) 
  (* C_RD_DEPTH = "8192" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "13" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "12" *) 
  (* C_WR_DEPTH = "4096" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "12" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  design_1_vga_controller_1_0_fifo_generator_v13_2_5 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[11:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dout(NLW_U0_dout_UNCONNECTED[31:0]),
        .empty(NLW_U0_empty_UNCONNECTED),
        .full(NLW_U0_full_UNCONNECTED),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(prog_full),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[12:0]),
        .rd_en(1'b0),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[11:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "vga_controller" *) 
module design_1_vga_controller_1_0_vga_controller
   (M_AXI_ARADDR,
    M_AXI_ARVALID,
    M_AXI_RREADY,
    switch_buffer_ack_reg_reg_0,
    M_AXI_ARREADY,
    fifo_rst,
    clk,
    pixel_clk,
    rstn,
    M_AXI_RVALID,
    rfifo_count,
    switch_buffer);
  output [26:0]M_AXI_ARADDR;
  output M_AXI_ARVALID;
  output M_AXI_RREADY;
  output switch_buffer_ack_reg_reg_0;
  input M_AXI_ARREADY;
  input fifo_rst;
  input clk;
  input pixel_clk;
  input rstn;
  input M_AXI_RVALID;
  input [7:0]rfifo_count;
  input switch_buffer;

  wire ARVALID_reg;
  wire ARVALID_reg_i_1_n_0;
  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_2_n_0 ;
  wire \FSM_sequential_state[2]_i_3_n_0 ;
  wire \FSM_sequential_state[2]_i_4_n_0 ;
  wire \FSM_sequential_state[2]_i_5_n_0 ;
  wire \FSM_sequential_state[2]_i_6_n_0 ;
  wire \FSM_sequential_state[2]_i_7_n_0 ;
  wire \FSM_sequential_state[2]_i_8_n_0 ;
  wire [26:0]M_AXI_ARADDR;
  wire M_AXI_ARREADY;
  wire M_AXI_ARVALID;
  wire M_AXI_RREADY;
  wire M_AXI_RVALID;
  wire clk;
  wire [24:0]current_base_addr;
  wire \current_base_addr[24]_i_1_n_0 ;
  wire [31:0]current_max_addr;
  wire [24:0]data;
  wire fifo_rst;
  wire flush_arvalid;
  wire flush_arvalid_i_1_n_0;
  wire flush_done;
  wire flush_done_i_1_n_0;
  wire flush_rready;
  wire flush_rready_i_1_n_0;
  wire [24:0]old_base_addr;
  wire old_base_addr_0;
  wire [31:0]old_max_addr;
  wire pixel_clk;
  wire prog_full;
  wire rd_addr_reg1_carry__0_i_1_n_0;
  wire rd_addr_reg1_carry__0_i_2_n_0;
  wire rd_addr_reg1_carry__0_i_3_n_0;
  wire rd_addr_reg1_carry__0_i_4_n_0;
  wire rd_addr_reg1_carry__0_i_5_n_0;
  wire rd_addr_reg1_carry__0_i_6_n_0;
  wire rd_addr_reg1_carry__0_i_7_n_0;
  wire rd_addr_reg1_carry__0_i_8_n_0;
  wire rd_addr_reg1_carry__0_n_0;
  wire rd_addr_reg1_carry__0_n_1;
  wire rd_addr_reg1_carry__0_n_2;
  wire rd_addr_reg1_carry__0_n_3;
  wire rd_addr_reg1_carry__1_i_1_n_0;
  wire rd_addr_reg1_carry__1_i_2_n_0;
  wire rd_addr_reg1_carry__1_i_3_n_0;
  wire rd_addr_reg1_carry__1_i_4_n_0;
  wire rd_addr_reg1_carry__1_i_5_n_0;
  wire rd_addr_reg1_carry__1_i_6_n_0;
  wire rd_addr_reg1_carry__1_i_7_n_0;
  wire rd_addr_reg1_carry__1_i_8_n_0;
  wire rd_addr_reg1_carry__1_n_0;
  wire rd_addr_reg1_carry__1_n_1;
  wire rd_addr_reg1_carry__1_n_2;
  wire rd_addr_reg1_carry__1_n_3;
  wire rd_addr_reg1_carry__2_i_1_n_0;
  wire rd_addr_reg1_carry__2_i_2_n_0;
  wire rd_addr_reg1_carry__2_i_3_n_0;
  wire rd_addr_reg1_carry__2_i_4_n_0;
  wire rd_addr_reg1_carry__2_i_5_n_0;
  wire rd_addr_reg1_carry__2_i_6_n_0;
  wire rd_addr_reg1_carry__2_i_7_n_0;
  wire rd_addr_reg1_carry__2_i_8_n_0;
  wire rd_addr_reg1_carry__2_n_0;
  wire rd_addr_reg1_carry__2_n_1;
  wire rd_addr_reg1_carry__2_n_2;
  wire rd_addr_reg1_carry__2_n_3;
  wire rd_addr_reg1_carry_i_1_n_0;
  wire rd_addr_reg1_carry_i_2_n_0;
  wire rd_addr_reg1_carry_i_3_n_0;
  wire rd_addr_reg1_carry_i_4_n_0;
  wire rd_addr_reg1_carry_n_0;
  wire rd_addr_reg1_carry_n_1;
  wire rd_addr_reg1_carry_n_2;
  wire rd_addr_reg1_carry_n_3;
  wire \rd_addr_reg[0]_i_1_n_0 ;
  wire \rd_addr_reg[13]_i_2_n_0 ;
  wire \rd_addr_reg[13]_i_3_n_0 ;
  wire \rd_addr_reg[13]_i_4_n_0 ;
  wire \rd_addr_reg[13]_i_5_n_0 ;
  wire \rd_addr_reg[17]_i_2_n_0 ;
  wire \rd_addr_reg[17]_i_3_n_0 ;
  wire \rd_addr_reg[17]_i_4_n_0 ;
  wire \rd_addr_reg[17]_i_5_n_0 ;
  wire \rd_addr_reg[21]_i_2_n_0 ;
  wire \rd_addr_reg[21]_i_3_n_0 ;
  wire \rd_addr_reg[21]_i_4_n_0 ;
  wire \rd_addr_reg[21]_i_5_n_0 ;
  wire \rd_addr_reg[25]_i_2_n_0 ;
  wire \rd_addr_reg[25]_i_3_n_0 ;
  wire \rd_addr_reg[25]_i_4_n_0 ;
  wire \rd_addr_reg[25]_i_5_n_0 ;
  wire \rd_addr_reg[29]_i_2_n_0 ;
  wire \rd_addr_reg[29]_i_3_n_0 ;
  wire \rd_addr_reg[29]_i_4_n_0 ;
  wire \rd_addr_reg[29]_i_5_n_0 ;
  wire \rd_addr_reg[31]_i_1_n_0 ;
  wire \rd_addr_reg[31]_i_3_n_0 ;
  wire \rd_addr_reg[31]_i_4_n_0 ;
  wire \rd_addr_reg[9]_i_2_n_0 ;
  wire \rd_addr_reg[9]_i_3_n_0 ;
  wire \rd_addr_reg[9]_i_4_n_0 ;
  wire \rd_addr_reg[9]_i_5_n_0 ;
  wire \rd_addr_reg_reg[13]_i_1_n_0 ;
  wire \rd_addr_reg_reg[13]_i_1_n_1 ;
  wire \rd_addr_reg_reg[13]_i_1_n_2 ;
  wire \rd_addr_reg_reg[13]_i_1_n_3 ;
  wire \rd_addr_reg_reg[13]_i_1_n_4 ;
  wire \rd_addr_reg_reg[13]_i_1_n_5 ;
  wire \rd_addr_reg_reg[13]_i_1_n_6 ;
  wire \rd_addr_reg_reg[13]_i_1_n_7 ;
  wire \rd_addr_reg_reg[17]_i_1_n_0 ;
  wire \rd_addr_reg_reg[17]_i_1_n_1 ;
  wire \rd_addr_reg_reg[17]_i_1_n_2 ;
  wire \rd_addr_reg_reg[17]_i_1_n_3 ;
  wire \rd_addr_reg_reg[17]_i_1_n_4 ;
  wire \rd_addr_reg_reg[17]_i_1_n_5 ;
  wire \rd_addr_reg_reg[17]_i_1_n_6 ;
  wire \rd_addr_reg_reg[17]_i_1_n_7 ;
  wire \rd_addr_reg_reg[21]_i_1_n_0 ;
  wire \rd_addr_reg_reg[21]_i_1_n_1 ;
  wire \rd_addr_reg_reg[21]_i_1_n_2 ;
  wire \rd_addr_reg_reg[21]_i_1_n_3 ;
  wire \rd_addr_reg_reg[21]_i_1_n_4 ;
  wire \rd_addr_reg_reg[21]_i_1_n_5 ;
  wire \rd_addr_reg_reg[21]_i_1_n_6 ;
  wire \rd_addr_reg_reg[21]_i_1_n_7 ;
  wire \rd_addr_reg_reg[25]_i_1_n_0 ;
  wire \rd_addr_reg_reg[25]_i_1_n_1 ;
  wire \rd_addr_reg_reg[25]_i_1_n_2 ;
  wire \rd_addr_reg_reg[25]_i_1_n_3 ;
  wire \rd_addr_reg_reg[25]_i_1_n_4 ;
  wire \rd_addr_reg_reg[25]_i_1_n_5 ;
  wire \rd_addr_reg_reg[25]_i_1_n_6 ;
  wire \rd_addr_reg_reg[25]_i_1_n_7 ;
  wire \rd_addr_reg_reg[29]_i_1_n_0 ;
  wire \rd_addr_reg_reg[29]_i_1_n_1 ;
  wire \rd_addr_reg_reg[29]_i_1_n_2 ;
  wire \rd_addr_reg_reg[29]_i_1_n_3 ;
  wire \rd_addr_reg_reg[29]_i_1_n_4 ;
  wire \rd_addr_reg_reg[29]_i_1_n_5 ;
  wire \rd_addr_reg_reg[29]_i_1_n_6 ;
  wire \rd_addr_reg_reg[29]_i_1_n_7 ;
  wire \rd_addr_reg_reg[31]_i_2_n_3 ;
  wire \rd_addr_reg_reg[31]_i_2_n_6 ;
  wire \rd_addr_reg_reg[31]_i_2_n_7 ;
  wire \rd_addr_reg_reg[9]_i_1_n_0 ;
  wire \rd_addr_reg_reg[9]_i_1_n_1 ;
  wire \rd_addr_reg_reg[9]_i_1_n_2 ;
  wire \rd_addr_reg_reg[9]_i_1_n_3 ;
  wire \rd_addr_reg_reg[9]_i_1_n_4 ;
  wire \rd_addr_reg_reg[9]_i_1_n_5 ;
  wire \rd_addr_reg_reg[9]_i_1_n_6 ;
  wire \rd_addr_reg_reg[9]_i_1_n_7 ;
  wire [7:0]rfifo_count;
  wire rready;
  wire rready_i_1_n_0;
  wire rstn;
  wire [2:0]state;
  wire switch_buffer;
  wire switch_buffer_ack_reg_i_1_n_0;
  wire switch_buffer_ack_reg_reg_0;
  wire switch_buffer_reg1;
  wire switch_buffer_reg1_i_1_n_0;
  wire switch_buffer_reg2;
  wire switch_buffer_reg2_i_1_n_0;
  wire switch_buffer_reg_out;
  wire switch_buffer_reg_out_i_1_n_0;
  wire wr_en;
  wire wr_en_reg_i_1_n_0;
  wire NLW_fifo_almost_empty_UNCONNECTED;
  wire NLW_fifo_almost_full_UNCONNECTED;
  wire NLW_fifo_empty_UNCONNECTED;
  wire NLW_fifo_full_UNCONNECTED;
  wire NLW_fifo_overflow_UNCONNECTED;
  wire NLW_fifo_underflow_UNCONNECTED;
  wire [31:0]NLW_fifo_dout_UNCONNECTED;
  wire [3:0]NLW_rd_addr_reg1_carry_O_UNCONNECTED;
  wire [3:0]NLW_rd_addr_reg1_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_rd_addr_reg1_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_rd_addr_reg1_carry__2_O_UNCONNECTED;
  wire [3:1]\NLW_rd_addr_reg_reg[31]_i_2_CO_UNCONNECTED ;
  wire [3:2]\NLW_rd_addr_reg_reg[31]_i_2_O_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    ARVALID_reg_i_1
       (.I0(flush_done),
        .I1(rstn),
        .O(ARVALID_reg_i_1_n_0));
  FDRE ARVALID_reg_reg
       (.C(clk),
        .CE(1'b1),
        .D(ARVALID_reg_i_1_n_0),
        .Q(ARVALID_reg),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h2600)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(state[0]),
        .I1(\FSM_sequential_state[2]_i_2_n_0 ),
        .I2(state[2]),
        .I3(rstn),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h262A0000)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(state[1]),
        .I1(\FSM_sequential_state[2]_i_2_n_0 ),
        .I2(state[2]),
        .I3(state[0]),
        .I4(rstn),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h622A0000)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(state[2]),
        .I1(\FSM_sequential_state[2]_i_2_n_0 ),
        .I2(state[1]),
        .I3(state[0]),
        .I4(rstn),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEABAA)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(\FSM_sequential_state[2]_i_3_n_0 ),
        .I1(\FSM_sequential_state[2]_i_4_n_0 ),
        .I2(\FSM_sequential_state[2]_i_5_n_0 ),
        .I3(\FSM_sequential_state[2]_i_6_n_0 ),
        .I4(\FSM_sequential_state[2]_i_7_n_0 ),
        .I5(\FSM_sequential_state[2]_i_8_n_0 ),
        .O(\FSM_sequential_state[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \FSM_sequential_state[2]_i_3 
       (.I0(state[1]),
        .I1(M_AXI_ARREADY),
        .I2(state[2]),
        .O(\FSM_sequential_state[2]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_state[2]_i_4 
       (.I0(rfifo_count[1]),
        .I1(rfifo_count[0]),
        .I2(rfifo_count[3]),
        .I3(rfifo_count[2]),
        .O(\FSM_sequential_state[2]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_state[2]_i_5 
       (.I0(rfifo_count[5]),
        .I1(rfifo_count[4]),
        .I2(rfifo_count[7]),
        .I3(rfifo_count[6]),
        .O(\FSM_sequential_state[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \FSM_sequential_state[2]_i_6 
       (.I0(M_AXI_RVALID),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[0]),
        .O(\FSM_sequential_state[2]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h07)) 
    \FSM_sequential_state[2]_i_7 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[2]),
        .O(\FSM_sequential_state[2]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \FSM_sequential_state[2]_i_8 
       (.I0(state[0]),
        .I1(state[1]),
        .O(\FSM_sequential_state[2]_i_8_n_0 ));
  (* FSM_ENCODED_STATES = "st1_rst:000,st2_sendreq:001,st3_obtain_datacount:010,st4_rvalid:011,st5_done:100," *) 
  FDRE \FSM_sequential_state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "st1_rst:000,st2_sendreq:001,st3_obtain_datacount:010,st4_rvalid:011,st5_done:100," *) 
  FDRE \FSM_sequential_state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state[1]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "st1_rst:000,st2_sendreq:001,st3_obtain_datacount:010,st4_rvalid:011,st5_done:100," *) 
  FDRE \FSM_sequential_state_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\FSM_sequential_state[2]_i_1_n_0 ),
        .Q(state[2]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    M_AXI_ARVALID_INST_0
       (.I0(ARVALID_reg),
        .I1(flush_done),
        .I2(flush_arvalid),
        .O(M_AXI_ARVALID));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    M_AXI_RREADY_INST_0
       (.I0(rready),
        .I1(flush_done),
        .I2(flush_rready),
        .O(M_AXI_RREADY));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \current_base_addr[0]_i_1 
       (.I0(current_base_addr[0]),
        .I1(switch_buffer_ack_reg_reg_0),
        .I2(switch_buffer_reg2),
        .I3(old_base_addr[0]),
        .O(data[0]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \current_base_addr[12]_i_1 
       (.I0(current_base_addr[12]),
        .I1(switch_buffer_ack_reg_reg_0),
        .I2(switch_buffer_reg2),
        .I3(old_base_addr[12]),
        .O(data[12]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \current_base_addr[15]_i_1 
       (.I0(current_base_addr[15]),
        .I1(switch_buffer_ack_reg_reg_0),
        .I2(switch_buffer_reg2),
        .I3(old_base_addr[15]),
        .O(data[15]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \current_base_addr[17]_i_1 
       (.I0(current_base_addr[17]),
        .I1(switch_buffer_ack_reg_reg_0),
        .I2(switch_buffer_reg2),
        .I3(old_base_addr[17]),
        .O(data[17]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \current_base_addr[18]_i_1 
       (.I0(current_base_addr[18]),
        .I1(switch_buffer_ack_reg_reg_0),
        .I2(switch_buffer_reg2),
        .I3(old_base_addr[18]),
        .O(data[18]));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \current_base_addr[19]_i_1 
       (.I0(current_base_addr[19]),
        .I1(switch_buffer_ack_reg_reg_0),
        .I2(switch_buffer_reg2),
        .I3(old_base_addr[19]),
        .O(data[19]));
  LUT2 #(
    .INIT(4'h2)) 
    \current_base_addr[24]_i_1 
       (.I0(M_AXI_ARREADY),
        .I1(rd_addr_reg1_carry__2_n_0),
        .O(\current_base_addr[24]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \current_base_addr[24]_i_2 
       (.I0(current_base_addr[24]),
        .I1(switch_buffer_ack_reg_reg_0),
        .I2(switch_buffer_reg2),
        .I3(old_base_addr[24]),
        .O(data[24]));
  FDRE #(
    .INIT(1'b0)) 
    \current_base_addr_reg[0] 
       (.C(clk),
        .CE(\current_base_addr[24]_i_1_n_0 ),
        .D(data[0]),
        .Q(current_base_addr[0]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \current_base_addr_reg[12] 
       (.C(clk),
        .CE(\current_base_addr[24]_i_1_n_0 ),
        .D(data[12]),
        .Q(current_base_addr[12]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \current_base_addr_reg[15] 
       (.C(clk),
        .CE(\current_base_addr[24]_i_1_n_0 ),
        .D(data[15]),
        .Q(current_base_addr[15]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \current_base_addr_reg[17] 
       (.C(clk),
        .CE(\current_base_addr[24]_i_1_n_0 ),
        .D(data[17]),
        .Q(current_base_addr[17]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \current_base_addr_reg[18] 
       (.C(clk),
        .CE(\current_base_addr[24]_i_1_n_0 ),
        .D(data[18]),
        .Q(current_base_addr[18]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \current_base_addr_reg[19] 
       (.C(clk),
        .CE(\current_base_addr[24]_i_1_n_0 ),
        .D(data[19]),
        .Q(current_base_addr[19]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \current_base_addr_reg[24] 
       (.C(clk),
        .CE(\current_base_addr[24]_i_1_n_0 ),
        .D(data[24]),
        .Q(current_base_addr[24]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \current_max_addr_reg[0] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(old_max_addr[0]),
        .Q(current_max_addr[0]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \current_max_addr_reg[12] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(old_max_addr[12]),
        .Q(current_max_addr[12]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \current_max_addr_reg[13] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(old_max_addr[13]),
        .Q(current_max_addr[13]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \current_max_addr_reg[14] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(old_max_addr[14]),
        .Q(current_max_addr[14]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \current_max_addr_reg[16] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(old_max_addr[16]),
        .Q(current_max_addr[16]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \current_max_addr_reg[20] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(old_max_addr[20]),
        .Q(current_max_addr[20]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \current_max_addr_reg[21] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(old_max_addr[21]),
        .Q(current_max_addr[21]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \current_max_addr_reg[22] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(old_max_addr[22]),
        .Q(current_max_addr[22]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \current_max_addr_reg[23] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(old_max_addr[23]),
        .Q(current_max_addr[23]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \current_max_addr_reg[25] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(old_max_addr[25]),
        .Q(current_max_addr[25]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \current_max_addr_reg[26] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(old_max_addr[26]),
        .Q(current_max_addr[26]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \current_max_addr_reg[27] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(old_max_addr[27]),
        .Q(current_max_addr[27]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \current_max_addr_reg[28] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(old_max_addr[28]),
        .Q(current_max_addr[28]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \current_max_addr_reg[29] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(old_max_addr[29]),
        .Q(current_max_addr[29]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \current_max_addr_reg[30] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(old_max_addr[30]),
        .Q(current_max_addr[30]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \current_max_addr_reg[31] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(old_max_addr[31]),
        .Q(current_max_addr[31]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  (* CHECK_LICENSE_TYPE = "fifo_generator_0,fifo_generator_v13_2_5,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "fifo_generator_v13_2_5,Vivado 2020.2" *) 
  design_1_vga_controller_1_0_fifo_generator_0 fifo
       (.almost_empty(NLW_fifo_almost_empty_UNCONNECTED),
        .almost_full(NLW_fifo_almost_full_UNCONNECTED),
        .din({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dout(NLW_fifo_dout_UNCONNECTED[31:0]),
        .empty(NLW_fifo_empty_UNCONNECTED),
        .full(NLW_fifo_full_UNCONNECTED),
        .overflow(NLW_fifo_overflow_UNCONNECTED),
        .prog_full(prog_full),
        .rd_clk(pixel_clk),
        .rd_en(1'b0),
        .rst(fifo_rst),
        .underflow(NLW_fifo_underflow_UNCONNECTED),
        .wr_clk(clk),
        .wr_en(wr_en));
  LUT5 #(
    .INIT(32'h10FF1000)) 
    flush_arvalid_i_1
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(rstn),
        .I4(flush_arvalid),
        .O(flush_arvalid_i_1_n_0));
  FDRE flush_arvalid_reg
       (.C(clk),
        .CE(1'b1),
        .D(flush_arvalid_i_1_n_0),
        .Q(flush_arvalid),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h04FF0400)) 
    flush_done_i_1
       (.I0(state[1]),
        .I1(state[2]),
        .I2(state[0]),
        .I3(rstn),
        .I4(flush_done),
        .O(flush_done_i_1_n_0));
  FDRE #(
    .INIT(1'b1)) 
    flush_done_reg
       (.C(clk),
        .CE(1'b1),
        .D(flush_done_i_1_n_0),
        .Q(flush_done),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h08FF0800)) 
    flush_rready_i_1
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[2]),
        .I3(rstn),
        .I4(flush_rready),
        .O(flush_rready_i_1_n_0));
  FDRE flush_rready_reg
       (.C(clk),
        .CE(1'b1),
        .D(flush_rready_i_1_n_0),
        .Q(flush_rready),
        .R(1'b0));
  FDSE #(
    .INIT(1'b1)) 
    \old_base_addr_reg[0] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_base_addr[0]),
        .Q(old_base_addr[0]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \old_base_addr_reg[12] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_base_addr[12]),
        .Q(old_base_addr[12]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \old_base_addr_reg[15] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_base_addr[15]),
        .Q(old_base_addr[15]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \old_base_addr_reg[17] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_base_addr[17]),
        .Q(old_base_addr[17]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \old_base_addr_reg[18] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_base_addr[18]),
        .Q(old_base_addr[18]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \old_base_addr_reg[19] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_base_addr[19]),
        .Q(old_base_addr[19]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \old_base_addr_reg[24] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_base_addr[24]),
        .Q(old_base_addr[24]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h1000)) 
    \old_max_addr[31]_i_1 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(switch_buffer_ack_reg_reg_0),
        .I2(switch_buffer_reg2),
        .I3(M_AXI_ARREADY),
        .O(old_base_addr_0));
  FDSE #(
    .INIT(1'b1)) 
    \old_max_addr_reg[0] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_max_addr[0]),
        .Q(old_max_addr[0]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \old_max_addr_reg[12] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_max_addr[12]),
        .Q(old_max_addr[12]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \old_max_addr_reg[13] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_max_addr[13]),
        .Q(old_max_addr[13]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \old_max_addr_reg[14] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_max_addr[14]),
        .Q(old_max_addr[14]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \old_max_addr_reg[16] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_max_addr[16]),
        .Q(old_max_addr[16]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \old_max_addr_reg[20] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_max_addr[20]),
        .Q(old_max_addr[20]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \old_max_addr_reg[21] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_max_addr[21]),
        .Q(old_max_addr[21]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \old_max_addr_reg[22] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_max_addr[22]),
        .Q(old_max_addr[22]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \old_max_addr_reg[23] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_max_addr[23]),
        .Q(old_max_addr[23]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \old_max_addr_reg[25] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_max_addr[25]),
        .Q(old_max_addr[25]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \old_max_addr_reg[26] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_max_addr[26]),
        .Q(old_max_addr[26]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \old_max_addr_reg[27] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_max_addr[27]),
        .Q(old_max_addr[27]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \old_max_addr_reg[28] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_max_addr[28]),
        .Q(old_max_addr[28]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \old_max_addr_reg[29] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_max_addr[29]),
        .Q(old_max_addr[29]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \old_max_addr_reg[30] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_max_addr[30]),
        .Q(old_max_addr[30]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \old_max_addr_reg[31] 
       (.C(clk),
        .CE(old_base_addr_0),
        .D(current_max_addr[31]),
        .Q(old_max_addr[31]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 rd_addr_reg1_carry
       (.CI(1'b0),
        .CO({rd_addr_reg1_carry_n_0,rd_addr_reg1_carry_n_1,rd_addr_reg1_carry_n_2,rd_addr_reg1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({rd_addr_reg1_carry_i_1_n_0,1'b0,1'b0,rd_addr_reg1_carry_i_2_n_0}),
        .O(NLW_rd_addr_reg1_carry_O_UNCONNECTED[3:0]),
        .S({rd_addr_reg1_carry_i_3_n_0,1'b1,1'b1,rd_addr_reg1_carry_i_4_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 rd_addr_reg1_carry__0
       (.CI(rd_addr_reg1_carry_n_0),
        .CO({rd_addr_reg1_carry__0_n_0,rd_addr_reg1_carry__0_n_1,rd_addr_reg1_carry__0_n_2,rd_addr_reg1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({rd_addr_reg1_carry__0_i_1_n_0,rd_addr_reg1_carry__0_i_2_n_0,rd_addr_reg1_carry__0_i_3_n_0,rd_addr_reg1_carry__0_i_4_n_0}),
        .O(NLW_rd_addr_reg1_carry__0_O_UNCONNECTED[3:0]),
        .S({rd_addr_reg1_carry__0_i_5_n_0,rd_addr_reg1_carry__0_i_6_n_0,rd_addr_reg1_carry__0_i_7_n_0,rd_addr_reg1_carry__0_i_8_n_0}));
  LUT3 #(
    .INIT(8'h75)) 
    rd_addr_reg1_carry__0_i_1
       (.I0(M_AXI_ARADDR[10]),
        .I1(M_AXI_ARADDR[9]),
        .I2(current_max_addr[14]),
        .O(rd_addr_reg1_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_addr_reg1_carry__0_i_2
       (.I0(current_max_addr[13]),
        .I1(M_AXI_ARADDR[8]),
        .I2(current_max_addr[12]),
        .I3(M_AXI_ARADDR[7]),
        .O(rd_addr_reg1_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    rd_addr_reg1_carry__0_i_3
       (.I0(M_AXI_ARADDR[6]),
        .I1(M_AXI_ARADDR[5]),
        .O(rd_addr_reg1_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    rd_addr_reg1_carry__0_i_4
       (.I0(M_AXI_ARADDR[4]),
        .I1(M_AXI_ARADDR[3]),
        .O(rd_addr_reg1_carry__0_i_4_n_0));
  LUT3 #(
    .INIT(8'h82)) 
    rd_addr_reg1_carry__0_i_5
       (.I0(M_AXI_ARADDR[10]),
        .I1(current_max_addr[14]),
        .I2(M_AXI_ARADDR[9]),
        .O(rd_addr_reg1_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_addr_reg1_carry__0_i_6
       (.I0(current_max_addr[13]),
        .I1(M_AXI_ARADDR[8]),
        .I2(current_max_addr[12]),
        .I3(M_AXI_ARADDR[7]),
        .O(rd_addr_reg1_carry__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    rd_addr_reg1_carry__0_i_7
       (.I0(M_AXI_ARADDR[5]),
        .I1(M_AXI_ARADDR[6]),
        .O(rd_addr_reg1_carry__0_i_7_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    rd_addr_reg1_carry__0_i_8
       (.I0(M_AXI_ARADDR[3]),
        .I1(M_AXI_ARADDR[4]),
        .O(rd_addr_reg1_carry__0_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 rd_addr_reg1_carry__1
       (.CI(rd_addr_reg1_carry__0_n_0),
        .CO({rd_addr_reg1_carry__1_n_0,rd_addr_reg1_carry__1_n_1,rd_addr_reg1_carry__1_n_2,rd_addr_reg1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({rd_addr_reg1_carry__1_i_1_n_0,rd_addr_reg1_carry__1_i_2_n_0,rd_addr_reg1_carry__1_i_3_n_0,rd_addr_reg1_carry__1_i_4_n_0}),
        .O(NLW_rd_addr_reg1_carry__1_O_UNCONNECTED[3:0]),
        .S({rd_addr_reg1_carry__1_i_5_n_0,rd_addr_reg1_carry__1_i_6_n_0,rd_addr_reg1_carry__1_i_7_n_0,rd_addr_reg1_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_addr_reg1_carry__1_i_1
       (.I0(current_max_addr[23]),
        .I1(M_AXI_ARADDR[18]),
        .I2(current_max_addr[22]),
        .I3(M_AXI_ARADDR[17]),
        .O(rd_addr_reg1_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_addr_reg1_carry__1_i_2
       (.I0(current_max_addr[21]),
        .I1(M_AXI_ARADDR[16]),
        .I2(current_max_addr[20]),
        .I3(M_AXI_ARADDR[15]),
        .O(rd_addr_reg1_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    rd_addr_reg1_carry__1_i_3
       (.I0(M_AXI_ARADDR[14]),
        .I1(M_AXI_ARADDR[13]),
        .O(rd_addr_reg1_carry__1_i_3_n_0));
  LUT3 #(
    .INIT(8'h75)) 
    rd_addr_reg1_carry__1_i_4
       (.I0(M_AXI_ARADDR[12]),
        .I1(M_AXI_ARADDR[11]),
        .I2(current_max_addr[16]),
        .O(rd_addr_reg1_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_addr_reg1_carry__1_i_5
       (.I0(current_max_addr[23]),
        .I1(M_AXI_ARADDR[18]),
        .I2(current_max_addr[22]),
        .I3(M_AXI_ARADDR[17]),
        .O(rd_addr_reg1_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_addr_reg1_carry__1_i_6
       (.I0(current_max_addr[21]),
        .I1(M_AXI_ARADDR[16]),
        .I2(current_max_addr[20]),
        .I3(M_AXI_ARADDR[15]),
        .O(rd_addr_reg1_carry__1_i_6_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    rd_addr_reg1_carry__1_i_7
       (.I0(M_AXI_ARADDR[13]),
        .I1(M_AXI_ARADDR[14]),
        .O(rd_addr_reg1_carry__1_i_7_n_0));
  LUT3 #(
    .INIT(8'h82)) 
    rd_addr_reg1_carry__1_i_8
       (.I0(M_AXI_ARADDR[12]),
        .I1(current_max_addr[16]),
        .I2(M_AXI_ARADDR[11]),
        .O(rd_addr_reg1_carry__1_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 rd_addr_reg1_carry__2
       (.CI(rd_addr_reg1_carry__1_n_0),
        .CO({rd_addr_reg1_carry__2_n_0,rd_addr_reg1_carry__2_n_1,rd_addr_reg1_carry__2_n_2,rd_addr_reg1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({rd_addr_reg1_carry__2_i_1_n_0,rd_addr_reg1_carry__2_i_2_n_0,rd_addr_reg1_carry__2_i_3_n_0,rd_addr_reg1_carry__2_i_4_n_0}),
        .O(NLW_rd_addr_reg1_carry__2_O_UNCONNECTED[3:0]),
        .S({rd_addr_reg1_carry__2_i_5_n_0,rd_addr_reg1_carry__2_i_6_n_0,rd_addr_reg1_carry__2_i_7_n_0,rd_addr_reg1_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_addr_reg1_carry__2_i_1
       (.I0(M_AXI_ARADDR[26]),
        .I1(current_max_addr[31]),
        .I2(current_max_addr[30]),
        .I3(M_AXI_ARADDR[25]),
        .O(rd_addr_reg1_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_addr_reg1_carry__2_i_2
       (.I0(current_max_addr[29]),
        .I1(M_AXI_ARADDR[24]),
        .I2(current_max_addr[28]),
        .I3(M_AXI_ARADDR[23]),
        .O(rd_addr_reg1_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    rd_addr_reg1_carry__2_i_3
       (.I0(current_max_addr[27]),
        .I1(M_AXI_ARADDR[22]),
        .I2(current_max_addr[26]),
        .I3(M_AXI_ARADDR[21]),
        .O(rd_addr_reg1_carry__2_i_3_n_0));
  LUT3 #(
    .INIT(8'h2B)) 
    rd_addr_reg1_carry__2_i_4
       (.I0(current_max_addr[25]),
        .I1(M_AXI_ARADDR[20]),
        .I2(M_AXI_ARADDR[19]),
        .O(rd_addr_reg1_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_addr_reg1_carry__2_i_5
       (.I0(current_max_addr[31]),
        .I1(M_AXI_ARADDR[26]),
        .I2(current_max_addr[30]),
        .I3(M_AXI_ARADDR[25]),
        .O(rd_addr_reg1_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_addr_reg1_carry__2_i_6
       (.I0(current_max_addr[29]),
        .I1(M_AXI_ARADDR[24]),
        .I2(current_max_addr[28]),
        .I3(M_AXI_ARADDR[23]),
        .O(rd_addr_reg1_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    rd_addr_reg1_carry__2_i_7
       (.I0(current_max_addr[27]),
        .I1(M_AXI_ARADDR[22]),
        .I2(current_max_addr[26]),
        .I3(M_AXI_ARADDR[21]),
        .O(rd_addr_reg1_carry__2_i_7_n_0));
  LUT3 #(
    .INIT(8'h82)) 
    rd_addr_reg1_carry__2_i_8
       (.I0(M_AXI_ARADDR[19]),
        .I1(M_AXI_ARADDR[20]),
        .I2(current_max_addr[25]),
        .O(rd_addr_reg1_carry__2_i_8_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    rd_addr_reg1_carry_i_1
       (.I0(M_AXI_ARADDR[2]),
        .O(rd_addr_reg1_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    rd_addr_reg1_carry_i_2
       (.I0(current_max_addr[0]),
        .I1(M_AXI_ARADDR[0]),
        .O(rd_addr_reg1_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h4)) 
    rd_addr_reg1_carry_i_3
       (.I0(M_AXI_ARADDR[1]),
        .I1(M_AXI_ARADDR[2]),
        .O(rd_addr_reg1_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    rd_addr_reg1_carry_i_4
       (.I0(M_AXI_ARADDR[0]),
        .I1(current_max_addr[0]),
        .O(rd_addr_reg1_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFF0000F4B0F4B0)) 
    \rd_addr_reg[0]_i_1 
       (.I0(switch_buffer_ack_reg_reg_0),
        .I1(switch_buffer_reg2),
        .I2(current_base_addr[0]),
        .I3(old_base_addr[0]),
        .I4(M_AXI_ARADDR[0]),
        .I5(rd_addr_reg1_carry__2_n_0),
        .O(\rd_addr_reg[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_addr_reg[13]_i_2 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(M_AXI_ARADDR[8]),
        .O(\rd_addr_reg[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000F4B0F4B0)) 
    \rd_addr_reg[13]_i_3 
       (.I0(switch_buffer_ack_reg_reg_0),
        .I1(switch_buffer_reg2),
        .I2(current_base_addr[12]),
        .I3(old_base_addr[12]),
        .I4(M_AXI_ARADDR[7]),
        .I5(rd_addr_reg1_carry__2_n_0),
        .O(\rd_addr_reg[13]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_addr_reg[13]_i_4 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(M_AXI_ARADDR[6]),
        .O(\rd_addr_reg[13]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_addr_reg[13]_i_5 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(M_AXI_ARADDR[5]),
        .O(\rd_addr_reg[13]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000F4B0F4B0)) 
    \rd_addr_reg[17]_i_2 
       (.I0(switch_buffer_ack_reg_reg_0),
        .I1(switch_buffer_reg2),
        .I2(current_base_addr[17]),
        .I3(old_base_addr[17]),
        .I4(M_AXI_ARADDR[12]),
        .I5(rd_addr_reg1_carry__2_n_0),
        .O(\rd_addr_reg[17]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_addr_reg[17]_i_3 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(M_AXI_ARADDR[11]),
        .O(\rd_addr_reg[17]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000F4B0F4B0)) 
    \rd_addr_reg[17]_i_4 
       (.I0(switch_buffer_ack_reg_reg_0),
        .I1(switch_buffer_reg2),
        .I2(current_base_addr[15]),
        .I3(old_base_addr[15]),
        .I4(M_AXI_ARADDR[10]),
        .I5(rd_addr_reg1_carry__2_n_0),
        .O(\rd_addr_reg[17]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_addr_reg[17]_i_5 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(M_AXI_ARADDR[9]),
        .O(\rd_addr_reg[17]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_addr_reg[21]_i_2 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(M_AXI_ARADDR[16]),
        .O(\rd_addr_reg[21]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_addr_reg[21]_i_3 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(M_AXI_ARADDR[15]),
        .O(\rd_addr_reg[21]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000F4B0F4B0)) 
    \rd_addr_reg[21]_i_4 
       (.I0(switch_buffer_ack_reg_reg_0),
        .I1(switch_buffer_reg2),
        .I2(current_base_addr[19]),
        .I3(old_base_addr[19]),
        .I4(M_AXI_ARADDR[14]),
        .I5(rd_addr_reg1_carry__2_n_0),
        .O(\rd_addr_reg[21]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000F4B0F4B0)) 
    \rd_addr_reg[21]_i_5 
       (.I0(switch_buffer_ack_reg_reg_0),
        .I1(switch_buffer_reg2),
        .I2(current_base_addr[18]),
        .I3(old_base_addr[18]),
        .I4(M_AXI_ARADDR[13]),
        .I5(rd_addr_reg1_carry__2_n_0),
        .O(\rd_addr_reg[21]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_addr_reg[25]_i_2 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(M_AXI_ARADDR[20]),
        .O(\rd_addr_reg[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000F4B0F4B0)) 
    \rd_addr_reg[25]_i_3 
       (.I0(switch_buffer_ack_reg_reg_0),
        .I1(switch_buffer_reg2),
        .I2(current_base_addr[24]),
        .I3(old_base_addr[24]),
        .I4(M_AXI_ARADDR[19]),
        .I5(rd_addr_reg1_carry__2_n_0),
        .O(\rd_addr_reg[25]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_addr_reg[25]_i_4 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(M_AXI_ARADDR[18]),
        .O(\rd_addr_reg[25]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_addr_reg[25]_i_5 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(M_AXI_ARADDR[17]),
        .O(\rd_addr_reg[25]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_addr_reg[29]_i_2 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(M_AXI_ARADDR[24]),
        .O(\rd_addr_reg[29]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_addr_reg[29]_i_3 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(M_AXI_ARADDR[23]),
        .O(\rd_addr_reg[29]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_addr_reg[29]_i_4 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(M_AXI_ARADDR[22]),
        .O(\rd_addr_reg[29]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_addr_reg[29]_i_5 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(M_AXI_ARADDR[21]),
        .O(\rd_addr_reg[29]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \rd_addr_reg[31]_i_1 
       (.I0(rstn),
        .I1(flush_done),
        .O(\rd_addr_reg[31]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_addr_reg[31]_i_3 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(M_AXI_ARADDR[26]),
        .O(\rd_addr_reg[31]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_addr_reg[31]_i_4 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(M_AXI_ARADDR[25]),
        .O(\rd_addr_reg[31]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_addr_reg[9]_i_2 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(M_AXI_ARADDR[4]),
        .O(\rd_addr_reg[9]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_addr_reg[9]_i_3 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(M_AXI_ARADDR[3]),
        .O(\rd_addr_reg[9]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h4)) 
    \rd_addr_reg[9]_i_4 
       (.I0(M_AXI_ARADDR[2]),
        .I1(rd_addr_reg1_carry__2_n_0),
        .O(\rd_addr_reg[9]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rd_addr_reg[9]_i_5 
       (.I0(rd_addr_reg1_carry__2_n_0),
        .I1(M_AXI_ARADDR[1]),
        .O(\rd_addr_reg[9]_i_5_n_0 ));
  FDRE \rd_addr_reg_reg[0] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg[0]_i_1_n_0 ),
        .Q(M_AXI_ARADDR[0]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[10] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[13]_i_1_n_7 ),
        .Q(M_AXI_ARADDR[5]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[11] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[13]_i_1_n_6 ),
        .Q(M_AXI_ARADDR[6]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[12] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[13]_i_1_n_5 ),
        .Q(M_AXI_ARADDR[7]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[13] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[13]_i_1_n_4 ),
        .Q(M_AXI_ARADDR[8]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rd_addr_reg_reg[13]_i_1 
       (.CI(\rd_addr_reg_reg[9]_i_1_n_0 ),
        .CO({\rd_addr_reg_reg[13]_i_1_n_0 ,\rd_addr_reg_reg[13]_i_1_n_1 ,\rd_addr_reg_reg[13]_i_1_n_2 ,\rd_addr_reg_reg[13]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rd_addr_reg_reg[13]_i_1_n_4 ,\rd_addr_reg_reg[13]_i_1_n_5 ,\rd_addr_reg_reg[13]_i_1_n_6 ,\rd_addr_reg_reg[13]_i_1_n_7 }),
        .S({\rd_addr_reg[13]_i_2_n_0 ,\rd_addr_reg[13]_i_3_n_0 ,\rd_addr_reg[13]_i_4_n_0 ,\rd_addr_reg[13]_i_5_n_0 }));
  FDSE \rd_addr_reg_reg[14] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[17]_i_1_n_7 ),
        .Q(M_AXI_ARADDR[9]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[15] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[17]_i_1_n_6 ),
        .Q(M_AXI_ARADDR[10]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[16] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[17]_i_1_n_5 ),
        .Q(M_AXI_ARADDR[11]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[17] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[17]_i_1_n_4 ),
        .Q(M_AXI_ARADDR[12]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rd_addr_reg_reg[17]_i_1 
       (.CI(\rd_addr_reg_reg[13]_i_1_n_0 ),
        .CO({\rd_addr_reg_reg[17]_i_1_n_0 ,\rd_addr_reg_reg[17]_i_1_n_1 ,\rd_addr_reg_reg[17]_i_1_n_2 ,\rd_addr_reg_reg[17]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rd_addr_reg_reg[17]_i_1_n_4 ,\rd_addr_reg_reg[17]_i_1_n_5 ,\rd_addr_reg_reg[17]_i_1_n_6 ,\rd_addr_reg_reg[17]_i_1_n_7 }),
        .S({\rd_addr_reg[17]_i_2_n_0 ,\rd_addr_reg[17]_i_3_n_0 ,\rd_addr_reg[17]_i_4_n_0 ,\rd_addr_reg[17]_i_5_n_0 }));
  FDSE \rd_addr_reg_reg[18] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[21]_i_1_n_7 ),
        .Q(M_AXI_ARADDR[13]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[19] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[21]_i_1_n_6 ),
        .Q(M_AXI_ARADDR[14]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[20] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[21]_i_1_n_5 ),
        .Q(M_AXI_ARADDR[15]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[21] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[21]_i_1_n_4 ),
        .Q(M_AXI_ARADDR[16]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rd_addr_reg_reg[21]_i_1 
       (.CI(\rd_addr_reg_reg[17]_i_1_n_0 ),
        .CO({\rd_addr_reg_reg[21]_i_1_n_0 ,\rd_addr_reg_reg[21]_i_1_n_1 ,\rd_addr_reg_reg[21]_i_1_n_2 ,\rd_addr_reg_reg[21]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rd_addr_reg_reg[21]_i_1_n_4 ,\rd_addr_reg_reg[21]_i_1_n_5 ,\rd_addr_reg_reg[21]_i_1_n_6 ,\rd_addr_reg_reg[21]_i_1_n_7 }),
        .S({\rd_addr_reg[21]_i_2_n_0 ,\rd_addr_reg[21]_i_3_n_0 ,\rd_addr_reg[21]_i_4_n_0 ,\rd_addr_reg[21]_i_5_n_0 }));
  FDSE \rd_addr_reg_reg[22] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[25]_i_1_n_7 ),
        .Q(M_AXI_ARADDR[17]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[23] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[25]_i_1_n_6 ),
        .Q(M_AXI_ARADDR[18]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[24] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[25]_i_1_n_5 ),
        .Q(M_AXI_ARADDR[19]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[25] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[25]_i_1_n_4 ),
        .Q(M_AXI_ARADDR[20]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rd_addr_reg_reg[25]_i_1 
       (.CI(\rd_addr_reg_reg[21]_i_1_n_0 ),
        .CO({\rd_addr_reg_reg[25]_i_1_n_0 ,\rd_addr_reg_reg[25]_i_1_n_1 ,\rd_addr_reg_reg[25]_i_1_n_2 ,\rd_addr_reg_reg[25]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rd_addr_reg_reg[25]_i_1_n_4 ,\rd_addr_reg_reg[25]_i_1_n_5 ,\rd_addr_reg_reg[25]_i_1_n_6 ,\rd_addr_reg_reg[25]_i_1_n_7 }),
        .S({\rd_addr_reg[25]_i_2_n_0 ,\rd_addr_reg[25]_i_3_n_0 ,\rd_addr_reg[25]_i_4_n_0 ,\rd_addr_reg[25]_i_5_n_0 }));
  FDSE \rd_addr_reg_reg[26] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[29]_i_1_n_7 ),
        .Q(M_AXI_ARADDR[21]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[27] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[29]_i_1_n_6 ),
        .Q(M_AXI_ARADDR[22]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[28] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[29]_i_1_n_5 ),
        .Q(M_AXI_ARADDR[23]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[29] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[29]_i_1_n_4 ),
        .Q(M_AXI_ARADDR[24]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rd_addr_reg_reg[29]_i_1 
       (.CI(\rd_addr_reg_reg[25]_i_1_n_0 ),
        .CO({\rd_addr_reg_reg[29]_i_1_n_0 ,\rd_addr_reg_reg[29]_i_1_n_1 ,\rd_addr_reg_reg[29]_i_1_n_2 ,\rd_addr_reg_reg[29]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rd_addr_reg_reg[29]_i_1_n_4 ,\rd_addr_reg_reg[29]_i_1_n_5 ,\rd_addr_reg_reg[29]_i_1_n_6 ,\rd_addr_reg_reg[29]_i_1_n_7 }),
        .S({\rd_addr_reg[29]_i_2_n_0 ,\rd_addr_reg[29]_i_3_n_0 ,\rd_addr_reg[29]_i_4_n_0 ,\rd_addr_reg[29]_i_5_n_0 }));
  FDSE \rd_addr_reg_reg[30] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[31]_i_2_n_7 ),
        .Q(M_AXI_ARADDR[25]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[31] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[31]_i_2_n_6 ),
        .Q(M_AXI_ARADDR[26]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rd_addr_reg_reg[31]_i_2 
       (.CI(\rd_addr_reg_reg[29]_i_1_n_0 ),
        .CO({\NLW_rd_addr_reg_reg[31]_i_2_CO_UNCONNECTED [3:1],\rd_addr_reg_reg[31]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_rd_addr_reg_reg[31]_i_2_O_UNCONNECTED [3:2],\rd_addr_reg_reg[31]_i_2_n_6 ,\rd_addr_reg_reg[31]_i_2_n_7 }),
        .S({1'b0,1'b0,\rd_addr_reg[31]_i_3_n_0 ,\rd_addr_reg[31]_i_4_n_0 }));
  FDRE \rd_addr_reg_reg[6] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[9]_i_1_n_7 ),
        .Q(M_AXI_ARADDR[1]),
        .R(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[7] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[9]_i_1_n_6 ),
        .Q(M_AXI_ARADDR[2]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[8] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[9]_i_1_n_5 ),
        .Q(M_AXI_ARADDR[3]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  FDSE \rd_addr_reg_reg[9] 
       (.C(clk),
        .CE(M_AXI_ARREADY),
        .D(\rd_addr_reg_reg[9]_i_1_n_4 ),
        .Q(M_AXI_ARADDR[4]),
        .S(\rd_addr_reg[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rd_addr_reg_reg[9]_i_1 
       (.CI(1'b0),
        .CO({\rd_addr_reg_reg[9]_i_1_n_0 ,\rd_addr_reg_reg[9]_i_1_n_1 ,\rd_addr_reg_reg[9]_i_1_n_2 ,\rd_addr_reg_reg[9]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,rd_addr_reg1_carry__2_n_0,1'b0}),
        .O({\rd_addr_reg_reg[9]_i_1_n_4 ,\rd_addr_reg_reg[9]_i_1_n_5 ,\rd_addr_reg_reg[9]_i_1_n_6 ,\rd_addr_reg_reg[9]_i_1_n_7 }),
        .S({\rd_addr_reg[9]_i_2_n_0 ,\rd_addr_reg[9]_i_3_n_0 ,\rd_addr_reg[9]_i_4_n_0 ,\rd_addr_reg[9]_i_5_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h08)) 
    rready_i_1
       (.I0(flush_done),
        .I1(rstn),
        .I2(prog_full),
        .O(rready_i_1_n_0));
  FDRE rready_reg
       (.C(clk),
        .CE(1'b1),
        .D(rready_i_1_n_0),
        .Q(rready),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8080808000800000)) 
    switch_buffer_ack_reg_i_1
       (.I0(switch_buffer_reg_out),
        .I1(rstn),
        .I2(flush_done),
        .I3(rd_addr_reg1_carry__2_n_0),
        .I4(M_AXI_ARREADY),
        .I5(switch_buffer_ack_reg_reg_0),
        .O(switch_buffer_ack_reg_i_1_n_0));
  FDRE switch_buffer_ack_reg_reg
       (.C(clk),
        .CE(1'b1),
        .D(switch_buffer_ack_reg_i_1_n_0),
        .Q(switch_buffer_ack_reg_reg_0),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    switch_buffer_reg1_i_1
       (.I0(switch_buffer),
        .I1(rstn),
        .O(switch_buffer_reg1_i_1_n_0));
  FDRE switch_buffer_reg1_reg
       (.C(clk),
        .CE(1'b1),
        .D(switch_buffer_reg1_i_1_n_0),
        .Q(switch_buffer_reg1),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    switch_buffer_reg2_i_1
       (.I0(switch_buffer_reg1),
        .I1(rstn),
        .O(switch_buffer_reg2_i_1_n_0));
  FDRE switch_buffer_reg2_reg
       (.C(clk),
        .CE(1'b1),
        .D(switch_buffer_reg2_i_1_n_0),
        .Q(switch_buffer_reg2),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    switch_buffer_reg_out_i_1
       (.I0(switch_buffer_reg2),
        .I1(rstn),
        .O(switch_buffer_reg_out_i_1_n_0));
  FDRE switch_buffer_reg_out_reg
       (.C(clk),
        .CE(1'b1),
        .D(switch_buffer_reg_out_i_1_n_0),
        .Q(switch_buffer_reg_out),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    wr_en_reg_i_1
       (.I0(rready),
        .I1(M_AXI_RVALID),
        .I2(flush_done),
        .I3(rstn),
        .O(wr_en_reg_i_1_n_0));
  FDRE wr_en_reg_reg
       (.C(clk),
        .CE(1'b1),
        .D(wr_en_reg_i_1_n_0),
        .Q(wr_en),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) 
(* INV_DEF_VAL = "1'b1" *) (* ORIG_REF_NAME = "xpm_cdc_async_rst" *) (* RST_ACTIVE_HIGH = "1" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "ASYNC_RST" *) 
module design_1_vga_controller_1_0_xpm_cdc_async_rst
   (src_arst,
    dest_clk,
    dest_arst);
  input src_arst;
  input dest_clk;
  output dest_arst;

  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ASYNC_RST" *) wire [1:0]arststages_ff;
  wire dest_clk;
  wire src_arst;

  assign dest_arst = arststages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(src_arst),
        .Q(arststages_ff[0]));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(arststages_ff[0]),
        .PRE(src_arst),
        .Q(arststages_ff[1]));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) 
(* INV_DEF_VAL = "1'b1" *) (* ORIG_REF_NAME = "xpm_cdc_async_rst" *) (* RST_ACTIVE_HIGH = "1" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "ASYNC_RST" *) 
module design_1_vga_controller_1_0_xpm_cdc_async_rst__1
   (src_arst,
    dest_clk,
    dest_arst);
  input src_arst;
  input dest_clk;
  output dest_arst;

  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ASYNC_RST" *) wire [1:0]arststages_ff;
  wire dest_clk;
  wire src_arst;

  assign dest_arst = arststages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(src_arst),
        .Q(arststages_ff[0]));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(arststages_ff[0]),
        .PRE(src_arst),
        .Q(arststages_ff[1]));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "12" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module design_1_vga_controller_1_0_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [11:0]src_in_bin;
  input dest_clk;
  output [11:0]dest_out_bin;

  wire [11:0]async_path;
  wire [10:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[1] ;
  wire [11:0]dest_out_bin;
  wire [10:0]gray_enc;
  wire src_clk;
  wire [11:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[10]),
        .Q(\dest_graysync_ff[0] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[11]),
        .Q(\dest_graysync_ff[0] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [10]),
        .Q(\dest_graysync_ff[1] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [11]),
        .Q(\dest_graysync_ff[1] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(binval[1]),
        .O(binval[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[10]_i_1 
       (.I0(\dest_graysync_ff[1] [10]),
        .I1(\dest_graysync_ff[1] [11]),
        .O(binval[10]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(binval[6]),
        .I4(\dest_graysync_ff[1] [4]),
        .I5(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(binval[6]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(binval[6]),
        .I3(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(binval[6]),
        .I2(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(binval[6]),
        .O(binval[5]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [10]),
        .I3(\dest_graysync_ff[1] [11]),
        .I4(\dest_graysync_ff[1] [9]),
        .I5(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [10]),
        .I4(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [10]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[9]_i_1 
       (.I0(\dest_graysync_ff[1] [9]),
        .I1(\dest_graysync_ff[1] [11]),
        .I2(\dest_graysync_ff[1] [10]),
        .O(binval[9]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[10]),
        .Q(dest_out_bin[10]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [11]),
        .Q(dest_out_bin[11]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[9]),
        .Q(dest_out_bin[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[10]_i_1 
       (.I0(src_in_bin[11]),
        .I1(src_in_bin[10]),
        .O(gray_enc[10]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[9]_i_1 
       (.I0(src_in_bin[10]),
        .I1(src_in_bin[9]),
        .O(gray_enc[9]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[10] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[10]),
        .Q(async_path[10]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[11] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[11]),
        .Q(async_path[11]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "13" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module design_1_vga_controller_1_0_xpm_cdc_gray__parameterized1
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [12:0]src_in_bin;
  input dest_clk;
  output [12:0]dest_out_bin;

  wire [12:0]async_path;
  wire [11:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [12:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [12:0]\dest_graysync_ff[1] ;
  wire [12:0]dest_out_bin;
  wire [11:0]gray_enc;
  wire src_clk;
  wire [12:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[10]),
        .Q(\dest_graysync_ff[0] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[11]),
        .Q(\dest_graysync_ff[0] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][12] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[12]),
        .Q(\dest_graysync_ff[0] [12]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [10]),
        .Q(\dest_graysync_ff[1] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [11]),
        .Q(\dest_graysync_ff[1] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][12] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [12]),
        .Q(\dest_graysync_ff[1] [12]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(binval[2]),
        .I2(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[10]_i_1 
       (.I0(\dest_graysync_ff[1] [10]),
        .I1(\dest_graysync_ff[1] [12]),
        .I2(\dest_graysync_ff[1] [11]),
        .O(binval[10]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[11]_i_1 
       (.I0(\dest_graysync_ff[1] [11]),
        .I1(\dest_graysync_ff[1] [12]),
        .O(binval[11]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(binval[2]),
        .O(binval[1]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(binval[7]),
        .I4(\dest_graysync_ff[1] [5]),
        .I5(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(binval[7]),
        .I3(\dest_graysync_ff[1] [6]),
        .I4(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(binval[7]),
        .I3(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(binval[7]),
        .I2(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(binval[7]),
        .O(binval[6]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [12]),
        .I4(\dest_graysync_ff[1] [10]),
        .I5(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [10]),
        .I2(\dest_graysync_ff[1] [12]),
        .I3(\dest_graysync_ff[1] [11]),
        .I4(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[9]_i_1 
       (.I0(\dest_graysync_ff[1] [9]),
        .I1(\dest_graysync_ff[1] [11]),
        .I2(\dest_graysync_ff[1] [12]),
        .I3(\dest_graysync_ff[1] [10]),
        .O(binval[9]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[10]),
        .Q(dest_out_bin[10]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[11]),
        .Q(dest_out_bin[11]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[12] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [12]),
        .Q(dest_out_bin[12]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[9]),
        .Q(dest_out_bin[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[10]_i_1 
       (.I0(src_in_bin[11]),
        .I1(src_in_bin[10]),
        .O(gray_enc[10]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[11]_i_1 
       (.I0(src_in_bin[12]),
        .I1(src_in_bin[11]),
        .O(gray_enc[11]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[9]_i_1 
       (.I0(src_in_bin[10]),
        .I1(src_in_bin[9]),
        .O(gray_enc[9]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[10] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[10]),
        .Q(async_path[10]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[11] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[11]),
        .Q(async_path[11]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[12] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[12]),
        .Q(async_path[12]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "4" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module design_1_vga_controller_1_0_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [3:0]syncstages_ff;

  assign dest_out = syncstages_ff[3];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "4" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module design_1_vga_controller_1_0_xpm_cdc_single__2
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [3:0]syncstages_ff;

  assign dest_out = syncstages_ff[3];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
SFoQ2tXDMrL2nCJbfpmHXuteJlKaWDWl3o9OY1miFvmYb8EDywmDpLUHQktJ/VoW+17fK5WHgFVI
FZV1B91GDQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
mxGWDRjEAsKmBqldxevT1RKZvqK7vn0KlTODVXNGlRcGf9zOAmj0Z7Ppu79POBDb8oNQyCY+2q1q
BddzhQfh5WLIVX9BNUMIF6M6IF0elM4GMSLHGeYEwqSaMPC+thuR8FGj1J7z6rH+43gDYhtIeyY+
ZuZUz/Pqg8Lu63Xwe+0=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HLwPjQzkuqv5FEDBriEJS2DikBeIHB/bWuVWooHY5ChdoHatcmqCHpSvnGxVzLwObZWHFys2nR9y
P3zxywjtgtOWq/n3cYVa5li6eyiUmGXv2OE8nw1nLnAY1kzBvGd6VwQ45t6l4Hx5+oqpIfuU2KI2
7/Qpj2atiTN3Y+q5He/BMXLIxF9vWuU6XL/+HsxriGAumcZDuESdidlxOztbW1bFhYr1/qWwou2q
wynnRVKYHL41aWycgFdkDoDEFFxv8ft8+F5Ux+J5Hg5XdgRULJc6uUQE/lDG3zOqzPftlODB52zU
d0cm8gFOvSZ2nO8ZB8THnxoAGe33iIZJfMcefA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jlR0iZ4fp9QXiFgaT07DMAK1YFLyBpsOGOOR9j2PWImFEh8oTBt4cvmGo+2z1Umbt9OMQwOhyepO
QIsKLFzUXYUba+SFFLBoCiaww24KICecbUfd3VV5sg2bEJjAdtYTT6mJqyc3vQRvBlONeBFdIGy2
AXqdK7QtXGLsLAIF/z4FG8cfG6nSD6e16gccBC6+kl5MoShdnmebKLyoo6UKFdMbDK88sHvTcD9S
LNCau6RK7FkTZg23FV0tf6cTP9Rray9YEcowm2AAh51Wldo2lGJ2W5iiDatRKH/W1bu7FGWZG+OT
+VZE+Ckiuf4T6cuu+G5IbrtMv6a4U93R0gtxXQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
p/kq+JjPPJbOTWT2SRiPJ99/iH6kkVGEiluRRXpuRN+j+cVPgJD1v4QVjw3zMWLlvTGB7OOqC+JG
Lc62Wiizd/BFfGj2JYkTZMatcOWok7A87HK+vRTjr4nZMApD2jKaneJdU1279KsIEeRfImCQ2uRl
QRNMH3PPdNGYCnOGgNk=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kyyI/O29YYc5VBwhz19i7AV7MC75r43hHVKAOTBiGBhRu8zZxCwGGcNFqc2HgHcWC6nq4jCIbIXf
S3FDzPdasegnERlWvoob9/SXM88zKsyeTbUf+DRu5lB8SPROBMaIhnj375C5XLowL17MXZdmB6fV
X5ukCg7cNhCjssKt/bIJibWkfna7hvj4ye+CLWmi3LdEiix8KTwRoBS3ZJrjM4/N6FfZkXerVxs+
txkhdsmG9ga1g/xErhTRilhqrV2WetlpX86qH/64sRGVxrWeEfNoHhMZsqEK0jWDx4WavKt8XY7W
NDzMXLZ2m5Dv5HMiJWgFG+ntPwgiYYtBuwu7Eg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tv6UL1ZWqo3dAIlhN5UTNGzJyqzdHpCqh217JPvIvHiWJgcFh2tw1n7HWnOPcK3VhCt31AGnCEFe
HpTiinXvHna65L2X2HhtNUrsgvZlUuh/oQR273wp5JPFDPD97NQ4ELkGI+w26HTYLgZ70K5rQo87
D4AkQNRuzTRS5G12yb4RU7ZYgmkYLuq1UyqjlxyN62Del4XoqZyivOGw5H+7wlfkNRu98iQwqq12
jthZbH/ue5wxZJUcb7NmEwL+3abpyDNmWs1qORHOFoE3t97/9XMmeSCpM2+KnSKJvsV5VbuoTCOT
964fsEh7ey4IVb4aum095gQjLCqTmDm8DWFmaw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Oxo3AgNmVWgrXtMKDIThYfXr0YJfyFr7Bsjn2ge/G72mb25MA8Dbkd9ZZPtwqU1poazNnTng5Cx5
s8C1zMNEoo38jNY8zEUBjCCuasJgeMo5xsiha+3ZIBiuHS0KLrjLaPFIQZdsYevb44fg6J5YQLn5
jd1M6YdNMd1VwSezDxtbk9sN8ExPrmtwum/6L1ia9j9UlIzPTEaJ60Xz7tloPsgsbkborO2JLiIk
kIAY2q1b8tuhHzJ5DoXlvIo49wSDj75ncLrkwbAd26huob7aOmX1bS34pJLF17JzqYH0MoPJbHxb
RPdD+qUawXFsMSs2fOLnZrNxeG8L+TyAT0N8tQ==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
CIR/vwxo0IBrPr5+bMp2YuBCQTNBRIIbqgEB18Oewkc8CuHzGCAgPyQUBUKaUG3bBy+KDOPVxBP5
cE/d3QYZAT11fyB1OMMTrjmEIZcr0Vk3nVTAnivoxxxkmdzPjkj0OcGcU9fMArPi3dfTgIsKdtCq
94+mV/70WeprgijzuZFWD7uH+gVioY/+rq/Wc1O6x1n949w8YGgSCTurUvhsobx2bonoC317J0Wm
IX17XRkSBIFgzqA8iC+GV5oCfxIGkihKmXxjIJbMamlOdCOycEkjkh3JYmm7TLNxmI65iffsabR0
t5+iI0l8eJxFhElzWeREqE43cnJYLaKZBUA+DA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 109408)
`pragma protect data_block
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
vkwu9KkP7iadlmof6c5WEBrHJAYFZFG2+Q==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
