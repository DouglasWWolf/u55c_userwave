//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
//Date        : Wed Nov 11 16:04:28 2026
//Host        : wolf-super-server running 64-bit Ubuntu 20.04.6 LTS
//Command     : generate_target top_level.bd
//Design      : top_level
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module pcie_imp_P7FEFP
   (M_AXI_B_araddr,
    M_AXI_B_arburst,
    M_AXI_B_arcache,
    M_AXI_B_arid,
    M_AXI_B_arlen,
    M_AXI_B_arlock,
    M_AXI_B_arprot,
    M_AXI_B_arready,
    M_AXI_B_arsize,
    M_AXI_B_arvalid,
    M_AXI_B_awaddr,
    M_AXI_B_awburst,
    M_AXI_B_awcache,
    M_AXI_B_awid,
    M_AXI_B_awlen,
    M_AXI_B_awlock,
    M_AXI_B_awprot,
    M_AXI_B_awready,
    M_AXI_B_awsize,
    M_AXI_B_awvalid,
    M_AXI_B_bid,
    M_AXI_B_bready,
    M_AXI_B_bresp,
    M_AXI_B_bvalid,
    M_AXI_B_rdata,
    M_AXI_B_rid,
    M_AXI_B_rlast,
    M_AXI_B_rready,
    M_AXI_B_rresp,
    M_AXI_B_rvalid,
    M_AXI_B_wdata,
    M_AXI_B_wlast,
    M_AXI_B_wready,
    M_AXI_B_wstrb,
    M_AXI_B_wvalid,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid,
    S01_AXI_araddr,
    S01_AXI_arburst,
    S01_AXI_arcache,
    S01_AXI_arid,
    S01_AXI_arlen,
    S01_AXI_arlock,
    S01_AXI_arprot,
    S01_AXI_arqos,
    S01_AXI_arready,
    S01_AXI_arsize,
    S01_AXI_arvalid,
    S01_AXI_awaddr,
    S01_AXI_awburst,
    S01_AXI_awcache,
    S01_AXI_awid,
    S01_AXI_awlen,
    S01_AXI_awlock,
    S01_AXI_awprot,
    S01_AXI_awqos,
    S01_AXI_awready,
    S01_AXI_awsize,
    S01_AXI_awvalid,
    S01_AXI_bid,
    S01_AXI_bready,
    S01_AXI_bresp,
    S01_AXI_bvalid,
    S01_AXI_rdata,
    S01_AXI_rid,
    S01_AXI_rlast,
    S01_AXI_rready,
    S01_AXI_rresp,
    S01_AXI_rvalid,
    S01_AXI_wdata,
    S01_AXI_wlast,
    S01_AXI_wready,
    S01_AXI_wstrb,
    S01_AXI_wvalid,
    S02_AXI_araddr,
    S02_AXI_arburst,
    S02_AXI_arcache,
    S02_AXI_arid,
    S02_AXI_arlen,
    S02_AXI_arlock,
    S02_AXI_arprot,
    S02_AXI_arqos,
    S02_AXI_arready,
    S02_AXI_arsize,
    S02_AXI_arvalid,
    S02_AXI_awaddr,
    S02_AXI_awburst,
    S02_AXI_awcache,
    S02_AXI_awid,
    S02_AXI_awlen,
    S02_AXI_awlock,
    S02_AXI_awprot,
    S02_AXI_awqos,
    S02_AXI_awready,
    S02_AXI_awsize,
    S02_AXI_awvalid,
    S02_AXI_bid,
    S02_AXI_bready,
    S02_AXI_bresp,
    S02_AXI_bvalid,
    S02_AXI_rdata,
    S02_AXI_rid,
    S02_AXI_rlast,
    S02_AXI_rready,
    S02_AXI_rresp,
    S02_AXI_rvalid,
    S02_AXI_wdata,
    S02_AXI_wlast,
    S02_AXI_wready,
    S02_AXI_wstrb,
    S02_AXI_wvalid,
    axi_aclk,
    axi_aresetn,
    pcie_mgt_rxn,
    pcie_mgt_rxp,
    pcie_mgt_txn,
    pcie_mgt_txp,
    pcie_perst_l,
    pcie_refclk_clk_n,
    pcie_refclk_clk_p);
  output [63:0]M_AXI_B_araddr;
  output [1:0]M_AXI_B_arburst;
  output [3:0]M_AXI_B_arcache;
  output [3:0]M_AXI_B_arid;
  output [7:0]M_AXI_B_arlen;
  output [0:0]M_AXI_B_arlock;
  output [2:0]M_AXI_B_arprot;
  input M_AXI_B_arready;
  output [2:0]M_AXI_B_arsize;
  output M_AXI_B_arvalid;
  output [63:0]M_AXI_B_awaddr;
  output [1:0]M_AXI_B_awburst;
  output [3:0]M_AXI_B_awcache;
  output [3:0]M_AXI_B_awid;
  output [7:0]M_AXI_B_awlen;
  output [0:0]M_AXI_B_awlock;
  output [2:0]M_AXI_B_awprot;
  input M_AXI_B_awready;
  output [2:0]M_AXI_B_awsize;
  output M_AXI_B_awvalid;
  input [3:0]M_AXI_B_bid;
  output M_AXI_B_bready;
  input [1:0]M_AXI_B_bresp;
  input M_AXI_B_bvalid;
  input [511:0]M_AXI_B_rdata;
  input [3:0]M_AXI_B_rid;
  input M_AXI_B_rlast;
  output M_AXI_B_rready;
  input [1:0]M_AXI_B_rresp;
  input M_AXI_B_rvalid;
  output [511:0]M_AXI_B_wdata;
  output M_AXI_B_wlast;
  input M_AXI_B_wready;
  output [63:0]M_AXI_B_wstrb;
  output M_AXI_B_wvalid;
  input [63:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [1:0]S00_AXI_arid;
  input [7:0]S00_AXI_arlen;
  input S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [63:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [1:0]S00_AXI_awid;
  input [7:0]S00_AXI_awlen;
  input S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [1:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [511:0]S00_AXI_rdata;
  output [1:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [511:0]S00_AXI_wdata;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [63:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;
  input [63:0]S01_AXI_araddr;
  input [1:0]S01_AXI_arburst;
  input [3:0]S01_AXI_arcache;
  input [3:0]S01_AXI_arid;
  input [7:0]S01_AXI_arlen;
  input S01_AXI_arlock;
  input [2:0]S01_AXI_arprot;
  input [3:0]S01_AXI_arqos;
  output S01_AXI_arready;
  input [2:0]S01_AXI_arsize;
  input S01_AXI_arvalid;
  input [63:0]S01_AXI_awaddr;
  input [1:0]S01_AXI_awburst;
  input [3:0]S01_AXI_awcache;
  input [3:0]S01_AXI_awid;
  input [7:0]S01_AXI_awlen;
  input S01_AXI_awlock;
  input [2:0]S01_AXI_awprot;
  input [3:0]S01_AXI_awqos;
  output S01_AXI_awready;
  input [2:0]S01_AXI_awsize;
  input S01_AXI_awvalid;
  output [3:0]S01_AXI_bid;
  input S01_AXI_bready;
  output [1:0]S01_AXI_bresp;
  output S01_AXI_bvalid;
  output [511:0]S01_AXI_rdata;
  output [3:0]S01_AXI_rid;
  output S01_AXI_rlast;
  input S01_AXI_rready;
  output [1:0]S01_AXI_rresp;
  output S01_AXI_rvalid;
  input [511:0]S01_AXI_wdata;
  input S01_AXI_wlast;
  output S01_AXI_wready;
  input [63:0]S01_AXI_wstrb;
  input S01_AXI_wvalid;
  input [63:0]S02_AXI_araddr;
  input [1:0]S02_AXI_arburst;
  input [3:0]S02_AXI_arcache;
  input [1:0]S02_AXI_arid;
  input [7:0]S02_AXI_arlen;
  input S02_AXI_arlock;
  input [2:0]S02_AXI_arprot;
  input [3:0]S02_AXI_arqos;
  output S02_AXI_arready;
  input [2:0]S02_AXI_arsize;
  input S02_AXI_arvalid;
  input [63:0]S02_AXI_awaddr;
  input [1:0]S02_AXI_awburst;
  input [3:0]S02_AXI_awcache;
  input [1:0]S02_AXI_awid;
  input [7:0]S02_AXI_awlen;
  input S02_AXI_awlock;
  input [2:0]S02_AXI_awprot;
  input [3:0]S02_AXI_awqos;
  output S02_AXI_awready;
  input [2:0]S02_AXI_awsize;
  input S02_AXI_awvalid;
  output [1:0]S02_AXI_bid;
  input S02_AXI_bready;
  output [1:0]S02_AXI_bresp;
  output S02_AXI_bvalid;
  output [511:0]S02_AXI_rdata;
  output [1:0]S02_AXI_rid;
  output S02_AXI_rlast;
  input S02_AXI_rready;
  output [1:0]S02_AXI_rresp;
  output S02_AXI_rvalid;
  input [511:0]S02_AXI_wdata;
  input S02_AXI_wlast;
  output S02_AXI_wready;
  input [63:0]S02_AXI_wstrb;
  input S02_AXI_wvalid;
  output axi_aclk;
  output [0:0]axi_aresetn;
  input [7:0]pcie_mgt_rxn;
  input [7:0]pcie_mgt_rxp;
  output [7:0]pcie_mgt_txn;
  output [7:0]pcie_mgt_txp;
  input pcie_perst_l;
  input [0:0]pcie_refclk_clk_n;
  input [0:0]pcie_refclk_clk_p;

  wire [63:0]M_AXI_B_araddr;
  wire [1:0]M_AXI_B_arburst;
  wire [3:0]M_AXI_B_arcache;
  wire [3:0]M_AXI_B_arid;
  wire [7:0]M_AXI_B_arlen;
  wire \^M_AXI_B_arlock ;
  wire [2:0]M_AXI_B_arprot;
  wire M_AXI_B_arready;
  wire [2:0]M_AXI_B_arsize;
  wire M_AXI_B_arvalid;
  wire [63:0]M_AXI_B_awaddr;
  wire [1:0]M_AXI_B_awburst;
  wire [3:0]M_AXI_B_awcache;
  wire [3:0]M_AXI_B_awid;
  wire [7:0]M_AXI_B_awlen;
  wire \^M_AXI_B_awlock ;
  wire [2:0]M_AXI_B_awprot;
  wire M_AXI_B_awready;
  wire [2:0]M_AXI_B_awsize;
  wire M_AXI_B_awvalid;
  wire [3:0]M_AXI_B_bid;
  wire M_AXI_B_bready;
  wire [1:0]M_AXI_B_bresp;
  wire M_AXI_B_bvalid;
  wire [511:0]M_AXI_B_rdata;
  wire [3:0]M_AXI_B_rid;
  wire M_AXI_B_rlast;
  wire M_AXI_B_rready;
  wire [1:0]M_AXI_B_rresp;
  wire M_AXI_B_rvalid;
  wire [511:0]M_AXI_B_wdata;
  wire M_AXI_B_wlast;
  wire M_AXI_B_wready;
  wire [63:0]M_AXI_B_wstrb;
  wire M_AXI_B_wvalid;
  wire [63:0]S00_AXI_araddr;
  wire [1:0]S00_AXI_arburst;
  wire [3:0]S00_AXI_arcache;
  wire [1:0]S00_AXI_arid;
  wire [7:0]S00_AXI_arlen;
  wire S00_AXI_arlock;
  wire [2:0]S00_AXI_arprot;
  wire [3:0]S00_AXI_arqos;
  wire S00_AXI_arready;
  wire [2:0]S00_AXI_arsize;
  wire S00_AXI_arvalid;
  wire [63:0]S00_AXI_awaddr;
  wire [1:0]S00_AXI_awburst;
  wire [3:0]S00_AXI_awcache;
  wire [1:0]S00_AXI_awid;
  wire [7:0]S00_AXI_awlen;
  wire S00_AXI_awlock;
  wire [2:0]S00_AXI_awprot;
  wire [3:0]S00_AXI_awqos;
  wire S00_AXI_awready;
  wire [2:0]S00_AXI_awsize;
  wire S00_AXI_awvalid;
  wire [1:0]S00_AXI_bid;
  wire S00_AXI_bready;
  wire [1:0]S00_AXI_bresp;
  wire S00_AXI_bvalid;
  wire [511:0]S00_AXI_rdata;
  wire [1:0]S00_AXI_rid;
  wire S00_AXI_rlast;
  wire S00_AXI_rready;
  wire [1:0]S00_AXI_rresp;
  wire S00_AXI_rvalid;
  wire [511:0]S00_AXI_wdata;
  wire S00_AXI_wlast;
  wire S00_AXI_wready;
  wire [63:0]S00_AXI_wstrb;
  wire S00_AXI_wvalid;
  wire [63:0]S01_AXI_araddr;
  wire [1:0]S01_AXI_arburst;
  wire [3:0]S01_AXI_arcache;
  wire [3:0]S01_AXI_arid;
  wire [7:0]S01_AXI_arlen;
  wire S01_AXI_arlock;
  wire [2:0]S01_AXI_arprot;
  wire [3:0]S01_AXI_arqos;
  wire S01_AXI_arready;
  wire [2:0]S01_AXI_arsize;
  wire S01_AXI_arvalid;
  wire [63:0]S01_AXI_awaddr;
  wire [1:0]S01_AXI_awburst;
  wire [3:0]S01_AXI_awcache;
  wire [3:0]S01_AXI_awid;
  wire [7:0]S01_AXI_awlen;
  wire S01_AXI_awlock;
  wire [2:0]S01_AXI_awprot;
  wire [3:0]S01_AXI_awqos;
  wire S01_AXI_awready;
  wire [2:0]S01_AXI_awsize;
  wire S01_AXI_awvalid;
  wire [3:0]S01_AXI_bid;
  wire S01_AXI_bready;
  wire [1:0]S01_AXI_bresp;
  wire S01_AXI_bvalid;
  wire [511:0]S01_AXI_rdata;
  wire [3:0]S01_AXI_rid;
  wire S01_AXI_rlast;
  wire S01_AXI_rready;
  wire [1:0]S01_AXI_rresp;
  wire S01_AXI_rvalid;
  wire [511:0]S01_AXI_wdata;
  wire S01_AXI_wlast;
  wire S01_AXI_wready;
  wire [63:0]S01_AXI_wstrb;
  wire S01_AXI_wvalid;
  wire [63:0]S02_AXI_araddr;
  wire [1:0]S02_AXI_arburst;
  wire [3:0]S02_AXI_arcache;
  wire [1:0]S02_AXI_arid;
  wire [7:0]S02_AXI_arlen;
  wire S02_AXI_arlock;
  wire [2:0]S02_AXI_arprot;
  wire [3:0]S02_AXI_arqos;
  wire S02_AXI_arready;
  wire [2:0]S02_AXI_arsize;
  wire S02_AXI_arvalid;
  wire [63:0]S02_AXI_awaddr;
  wire [1:0]S02_AXI_awburst;
  wire [3:0]S02_AXI_awcache;
  wire [1:0]S02_AXI_awid;
  wire [7:0]S02_AXI_awlen;
  wire S02_AXI_awlock;
  wire [2:0]S02_AXI_awprot;
  wire [3:0]S02_AXI_awqos;
  wire S02_AXI_awready;
  wire [2:0]S02_AXI_awsize;
  wire S02_AXI_awvalid;
  wire [1:0]S02_AXI_bid;
  wire S02_AXI_bready;
  wire [1:0]S02_AXI_bresp;
  wire S02_AXI_bvalid;
  wire [511:0]S02_AXI_rdata;
  wire [1:0]S02_AXI_rid;
  wire S02_AXI_rlast;
  wire S02_AXI_rready;
  wire [1:0]S02_AXI_rresp;
  wire S02_AXI_rvalid;
  wire [511:0]S02_AXI_wdata;
  wire S02_AXI_wlast;
  wire S02_AXI_wready;
  wire [63:0]S02_AXI_wstrb;
  wire S02_AXI_wvalid;
  wire [31:0]axi4_lite_plug_0_M_AXI_ARADDR;
  wire axi4_lite_plug_0_M_AXI_ARREADY;
  wire axi4_lite_plug_0_M_AXI_ARVALID;
  wire [31:0]axi4_lite_plug_0_M_AXI_AWADDR;
  wire axi4_lite_plug_0_M_AXI_AWREADY;
  wire axi4_lite_plug_0_M_AXI_AWVALID;
  wire axi4_lite_plug_0_M_AXI_BREADY;
  wire [1:0]axi4_lite_plug_0_M_AXI_BRESP;
  wire axi4_lite_plug_0_M_AXI_BVALID;
  wire [31:0]axi4_lite_plug_0_M_AXI_RDATA;
  wire axi4_lite_plug_0_M_AXI_RREADY;
  wire [1:0]axi4_lite_plug_0_M_AXI_RRESP;
  wire axi4_lite_plug_0_M_AXI_RVALID;
  wire [31:0]axi4_lite_plug_0_M_AXI_WDATA;
  wire axi4_lite_plug_0_M_AXI_WREADY;
  wire [3:0]axi4_lite_plug_0_M_AXI_WSTRB;
  wire axi4_lite_plug_0_M_AXI_WVALID;
  wire axi_aclk;
  wire [0:0]axi_aresetn;
  wire [0:0]bridge_input_clock_IBUF_DS_ODIV2;
  wire [0:0]bridge_input_clock_IBUF_OUT;
  wire pcie_bridge_axi_aresetn;
  wire [7:0]pcie_mgt_rxn;
  wire [7:0]pcie_mgt_rxp;
  wire [7:0]pcie_mgt_txn;
  wire [7:0]pcie_mgt_txp;
  wire pcie_perst_l;
  wire [0:0]pcie_refclk_clk_n;
  wire [0:0]pcie_refclk_clk_p;
  wire [63:0]smartconnect_0_M00_AXI_ARADDR;
  wire [1:0]smartconnect_0_M00_AXI_ARBURST;
  wire [7:0]smartconnect_0_M00_AXI_ARLEN;
  wire smartconnect_0_M00_AXI_ARREADY;
  wire [2:0]smartconnect_0_M00_AXI_ARSIZE;
  wire smartconnect_0_M00_AXI_ARVALID;
  wire [63:0]smartconnect_0_M00_AXI_AWADDR;
  wire [1:0]smartconnect_0_M00_AXI_AWBURST;
  wire [7:0]smartconnect_0_M00_AXI_AWLEN;
  wire smartconnect_0_M00_AXI_AWREADY;
  wire [2:0]smartconnect_0_M00_AXI_AWSIZE;
  wire smartconnect_0_M00_AXI_AWVALID;
  wire smartconnect_0_M00_AXI_BREADY;
  wire [1:0]smartconnect_0_M00_AXI_BRESP;
  wire smartconnect_0_M00_AXI_BVALID;
  wire [511:0]smartconnect_0_M00_AXI_RDATA;
  wire smartconnect_0_M00_AXI_RLAST;
  wire smartconnect_0_M00_AXI_RREADY;
  wire [1:0]smartconnect_0_M00_AXI_RRESP;
  wire smartconnect_0_M00_AXI_RVALID;
  wire [511:0]smartconnect_0_M00_AXI_WDATA;
  wire smartconnect_0_M00_AXI_WLAST;
  wire smartconnect_0_M00_AXI_WREADY;
  wire [63:0]smartconnect_0_M00_AXI_WSTRB;
  wire smartconnect_0_M00_AXI_WVALID;

  assign M_AXI_B_arlock[0] = \^M_AXI_B_arlock ;
  assign M_AXI_B_awlock[0] = \^M_AXI_B_awlock ;
  top_level_axi4_lite_plug_0_0 axi4_lite_plug
       (.M_AXI_ARADDR(axi4_lite_plug_0_M_AXI_ARADDR),
        .M_AXI_ARREADY(axi4_lite_plug_0_M_AXI_ARREADY),
        .M_AXI_ARVALID(axi4_lite_plug_0_M_AXI_ARVALID),
        .M_AXI_AWADDR(axi4_lite_plug_0_M_AXI_AWADDR),
        .M_AXI_AWREADY(axi4_lite_plug_0_M_AXI_AWREADY),
        .M_AXI_AWVALID(axi4_lite_plug_0_M_AXI_AWVALID),
        .M_AXI_BREADY(axi4_lite_plug_0_M_AXI_BREADY),
        .M_AXI_BRESP(axi4_lite_plug_0_M_AXI_BRESP),
        .M_AXI_BVALID(axi4_lite_plug_0_M_AXI_BVALID),
        .M_AXI_RDATA(axi4_lite_plug_0_M_AXI_RDATA),
        .M_AXI_RREADY(axi4_lite_plug_0_M_AXI_RREADY),
        .M_AXI_RRESP(axi4_lite_plug_0_M_AXI_RRESP),
        .M_AXI_RVALID(axi4_lite_plug_0_M_AXI_RVALID),
        .M_AXI_WDATA(axi4_lite_plug_0_M_AXI_WDATA),
        .M_AXI_WREADY(axi4_lite_plug_0_M_AXI_WREADY),
        .M_AXI_WSTRB(axi4_lite_plug_0_M_AXI_WSTRB),
        .M_AXI_WVALID(axi4_lite_plug_0_M_AXI_WVALID),
        .clk(axi_aclk));
  top_level_util_ds_buf_0_0 bridge_input_clock
       (.IBUF_DS_N(pcie_refclk_clk_n),
        .IBUF_DS_ODIV2(bridge_input_clock_IBUF_DS_ODIV2),
        .IBUF_DS_P(pcie_refclk_clk_p),
        .IBUF_OUT(bridge_input_clock_IBUF_OUT));
  top_level_xdma_0_0 pcie_bridge
       (.axi_aclk(axi_aclk),
        .axi_aresetn(pcie_bridge_axi_aresetn),
        .m_axib_araddr(M_AXI_B_araddr),
        .m_axib_arburst(M_AXI_B_arburst),
        .m_axib_arcache(M_AXI_B_arcache),
        .m_axib_arid(M_AXI_B_arid),
        .m_axib_arlen(M_AXI_B_arlen),
        .m_axib_arlock(\^M_AXI_B_arlock ),
        .m_axib_arprot(M_AXI_B_arprot),
        .m_axib_arready(M_AXI_B_arready),
        .m_axib_arsize(M_AXI_B_arsize),
        .m_axib_arvalid(M_AXI_B_arvalid),
        .m_axib_awaddr(M_AXI_B_awaddr),
        .m_axib_awburst(M_AXI_B_awburst),
        .m_axib_awcache(M_AXI_B_awcache),
        .m_axib_awid(M_AXI_B_awid),
        .m_axib_awlen(M_AXI_B_awlen),
        .m_axib_awlock(\^M_AXI_B_awlock ),
        .m_axib_awprot(M_AXI_B_awprot),
        .m_axib_awready(M_AXI_B_awready),
        .m_axib_awsize(M_AXI_B_awsize),
        .m_axib_awvalid(M_AXI_B_awvalid),
        .m_axib_bid(M_AXI_B_bid),
        .m_axib_bready(M_AXI_B_bready),
        .m_axib_bresp(M_AXI_B_bresp),
        .m_axib_bvalid(M_AXI_B_bvalid),
        .m_axib_rdata(M_AXI_B_rdata),
        .m_axib_rid(M_AXI_B_rid),
        .m_axib_rlast(M_AXI_B_rlast),
        .m_axib_rready(M_AXI_B_rready),
        .m_axib_rresp(M_AXI_B_rresp),
        .m_axib_rvalid(M_AXI_B_rvalid),
        .m_axib_wdata(M_AXI_B_wdata),
        .m_axib_wlast(M_AXI_B_wlast),
        .m_axib_wready(M_AXI_B_wready),
        .m_axib_wstrb(M_AXI_B_wstrb),
        .m_axib_wvalid(M_AXI_B_wvalid),
        .pci_exp_rxn(pcie_mgt_rxn),
        .pci_exp_rxp(pcie_mgt_rxp),
        .pci_exp_txn(pcie_mgt_txn),
        .pci_exp_txp(pcie_mgt_txp),
        .s_axib_araddr(smartconnect_0_M00_AXI_ARADDR),
        .s_axib_arburst(smartconnect_0_M00_AXI_ARBURST),
        .s_axib_arid({1'b0,1'b0}),
        .s_axib_arlen(smartconnect_0_M00_AXI_ARLEN),
        .s_axib_arready(smartconnect_0_M00_AXI_ARREADY),
        .s_axib_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axib_arsize(smartconnect_0_M00_AXI_ARSIZE),
        .s_axib_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .s_axib_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .s_axib_awburst(smartconnect_0_M00_AXI_AWBURST),
        .s_axib_awid({1'b0,1'b0}),
        .s_axib_awlen(smartconnect_0_M00_AXI_AWLEN),
        .s_axib_awready(smartconnect_0_M00_AXI_AWREADY),
        .s_axib_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axib_awsize(smartconnect_0_M00_AXI_AWSIZE),
        .s_axib_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .s_axib_bready(smartconnect_0_M00_AXI_BREADY),
        .s_axib_bresp(smartconnect_0_M00_AXI_BRESP),
        .s_axib_bvalid(smartconnect_0_M00_AXI_BVALID),
        .s_axib_rdata(smartconnect_0_M00_AXI_RDATA),
        .s_axib_rlast(smartconnect_0_M00_AXI_RLAST),
        .s_axib_rready(smartconnect_0_M00_AXI_RREADY),
        .s_axib_rresp(smartconnect_0_M00_AXI_RRESP),
        .s_axib_rvalid(smartconnect_0_M00_AXI_RVALID),
        .s_axib_wdata(smartconnect_0_M00_AXI_WDATA),
        .s_axib_wlast(smartconnect_0_M00_AXI_WLAST),
        .s_axib_wready(smartconnect_0_M00_AXI_WREADY),
        .s_axib_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .s_axib_wvalid(smartconnect_0_M00_AXI_WVALID),
        .s_axil_araddr(axi4_lite_plug_0_M_AXI_ARADDR),
        .s_axil_arprot({1'b0,1'b0,1'b0}),
        .s_axil_arready(axi4_lite_plug_0_M_AXI_ARREADY),
        .s_axil_arvalid(axi4_lite_plug_0_M_AXI_ARVALID),
        .s_axil_awaddr(axi4_lite_plug_0_M_AXI_AWADDR),
        .s_axil_awprot({1'b0,1'b0,1'b0}),
        .s_axil_awready(axi4_lite_plug_0_M_AXI_AWREADY),
        .s_axil_awvalid(axi4_lite_plug_0_M_AXI_AWVALID),
        .s_axil_bready(axi4_lite_plug_0_M_AXI_BREADY),
        .s_axil_bresp(axi4_lite_plug_0_M_AXI_BRESP),
        .s_axil_bvalid(axi4_lite_plug_0_M_AXI_BVALID),
        .s_axil_rdata(axi4_lite_plug_0_M_AXI_RDATA),
        .s_axil_rready(axi4_lite_plug_0_M_AXI_RREADY),
        .s_axil_rresp(axi4_lite_plug_0_M_AXI_RRESP),
        .s_axil_rvalid(axi4_lite_plug_0_M_AXI_RVALID),
        .s_axil_wdata(axi4_lite_plug_0_M_AXI_WDATA),
        .s_axil_wready(axi4_lite_plug_0_M_AXI_WREADY),
        .s_axil_wstrb(axi4_lite_plug_0_M_AXI_WSTRB),
        .s_axil_wvalid(axi4_lite_plug_0_M_AXI_WVALID),
        .sys_clk(bridge_input_clock_IBUF_DS_ODIV2),
        .sys_clk_gt(bridge_input_clock_IBUF_OUT),
        .sys_rst_n(pcie_perst_l),
        .usr_irq_req(1'b0));
  top_level_proc_sys_reset_0_1 reset_extender
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(pcie_bridge_axi_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(axi_aresetn),
        .slowest_sync_clk(axi_aclk));
  top_level_smartconnect_0_1 smartconnect
       (.M00_AXI_araddr(smartconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arburst(smartconnect_0_M00_AXI_ARBURST),
        .M00_AXI_arlen(smartconnect_0_M00_AXI_ARLEN),
        .M00_AXI_arready(smartconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arsize(smartconnect_0_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awburst(smartconnect_0_M00_AXI_AWBURST),
        .M00_AXI_awlen(smartconnect_0_M00_AXI_AWLEN),
        .M00_AXI_awready(smartconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awsize(smartconnect_0_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(smartconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_0_M00_AXI_RDATA),
        .M00_AXI_rlast(smartconnect_0_M00_AXI_RLAST),
        .M00_AXI_rready(smartconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_0_M00_AXI_WDATA),
        .M00_AXI_wlast(smartconnect_0_M00_AXI_WLAST),
        .M00_AXI_wready(smartconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_0_M00_AXI_WVALID),
        .S00_AXI_araddr(S00_AXI_araddr),
        .S00_AXI_arburst(S00_AXI_arburst),
        .S00_AXI_arcache(S00_AXI_arcache),
        .S00_AXI_arid(S00_AXI_arid),
        .S00_AXI_arlen(S00_AXI_arlen),
        .S00_AXI_arlock(S00_AXI_arlock),
        .S00_AXI_arprot(S00_AXI_arprot),
        .S00_AXI_arqos(S00_AXI_arqos),
        .S00_AXI_arready(S00_AXI_arready),
        .S00_AXI_arsize(S00_AXI_arsize),
        .S00_AXI_arvalid(S00_AXI_arvalid),
        .S00_AXI_awaddr(S00_AXI_awaddr),
        .S00_AXI_awburst(S00_AXI_awburst),
        .S00_AXI_awcache(S00_AXI_awcache),
        .S00_AXI_awid(S00_AXI_awid),
        .S00_AXI_awlen(S00_AXI_awlen),
        .S00_AXI_awlock(S00_AXI_awlock),
        .S00_AXI_awprot(S00_AXI_awprot),
        .S00_AXI_awqos(S00_AXI_awqos),
        .S00_AXI_awready(S00_AXI_awready),
        .S00_AXI_awsize(S00_AXI_awsize),
        .S00_AXI_awvalid(S00_AXI_awvalid),
        .S00_AXI_bid(S00_AXI_bid),
        .S00_AXI_bready(S00_AXI_bready),
        .S00_AXI_bresp(S00_AXI_bresp),
        .S00_AXI_bvalid(S00_AXI_bvalid),
        .S00_AXI_rdata(S00_AXI_rdata),
        .S00_AXI_rid(S00_AXI_rid),
        .S00_AXI_rlast(S00_AXI_rlast),
        .S00_AXI_rready(S00_AXI_rready),
        .S00_AXI_rresp(S00_AXI_rresp),
        .S00_AXI_rvalid(S00_AXI_rvalid),
        .S00_AXI_wdata(S00_AXI_wdata),
        .S00_AXI_wlast(S00_AXI_wlast),
        .S00_AXI_wready(S00_AXI_wready),
        .S00_AXI_wstrb(S00_AXI_wstrb),
        .S00_AXI_wvalid(S00_AXI_wvalid),
        .S01_AXI_araddr(S01_AXI_araddr),
        .S01_AXI_arburst(S01_AXI_arburst),
        .S01_AXI_arcache(S01_AXI_arcache),
        .S01_AXI_arid(S01_AXI_arid),
        .S01_AXI_arlen(S01_AXI_arlen),
        .S01_AXI_arlock(S01_AXI_arlock),
        .S01_AXI_arprot(S01_AXI_arprot),
        .S01_AXI_arqos(S01_AXI_arqos),
        .S01_AXI_arready(S01_AXI_arready),
        .S01_AXI_arsize(S01_AXI_arsize),
        .S01_AXI_arvalid(S01_AXI_arvalid),
        .S01_AXI_awaddr(S01_AXI_awaddr),
        .S01_AXI_awburst(S01_AXI_awburst),
        .S01_AXI_awcache(S01_AXI_awcache),
        .S01_AXI_awid(S01_AXI_awid),
        .S01_AXI_awlen(S01_AXI_awlen),
        .S01_AXI_awlock(S01_AXI_awlock),
        .S01_AXI_awprot(S01_AXI_awprot),
        .S01_AXI_awqos(S01_AXI_awqos),
        .S01_AXI_awready(S01_AXI_awready),
        .S01_AXI_awsize(S01_AXI_awsize),
        .S01_AXI_awvalid(S01_AXI_awvalid),
        .S01_AXI_bid(S01_AXI_bid),
        .S01_AXI_bready(S01_AXI_bready),
        .S01_AXI_bresp(S01_AXI_bresp),
        .S01_AXI_bvalid(S01_AXI_bvalid),
        .S01_AXI_rdata(S01_AXI_rdata),
        .S01_AXI_rid(S01_AXI_rid),
        .S01_AXI_rlast(S01_AXI_rlast),
        .S01_AXI_rready(S01_AXI_rready),
        .S01_AXI_rresp(S01_AXI_rresp),
        .S01_AXI_rvalid(S01_AXI_rvalid),
        .S01_AXI_wdata(S01_AXI_wdata),
        .S01_AXI_wlast(S01_AXI_wlast),
        .S01_AXI_wready(S01_AXI_wready),
        .S01_AXI_wstrb(S01_AXI_wstrb),
        .S01_AXI_wvalid(S01_AXI_wvalid),
        .S02_AXI_araddr(S02_AXI_araddr),
        .S02_AXI_arburst(S02_AXI_arburst),
        .S02_AXI_arcache(S02_AXI_arcache),
        .S02_AXI_arid(S02_AXI_arid),
        .S02_AXI_arlen(S02_AXI_arlen),
        .S02_AXI_arlock(S02_AXI_arlock),
        .S02_AXI_arprot(S02_AXI_arprot),
        .S02_AXI_arqos(S02_AXI_arqos),
        .S02_AXI_arready(S02_AXI_arready),
        .S02_AXI_arsize(S02_AXI_arsize),
        .S02_AXI_arvalid(S02_AXI_arvalid),
        .S02_AXI_awaddr(S02_AXI_awaddr),
        .S02_AXI_awburst(S02_AXI_awburst),
        .S02_AXI_awcache(S02_AXI_awcache),
        .S02_AXI_awid(S02_AXI_awid),
        .S02_AXI_awlen(S02_AXI_awlen),
        .S02_AXI_awlock(S02_AXI_awlock),
        .S02_AXI_awprot(S02_AXI_awprot),
        .S02_AXI_awqos(S02_AXI_awqos),
        .S02_AXI_awready(S02_AXI_awready),
        .S02_AXI_awsize(S02_AXI_awsize),
        .S02_AXI_awvalid(S02_AXI_awvalid),
        .S02_AXI_bid(S02_AXI_bid),
        .S02_AXI_bready(S02_AXI_bready),
        .S02_AXI_bresp(S02_AXI_bresp),
        .S02_AXI_bvalid(S02_AXI_bvalid),
        .S02_AXI_rdata(S02_AXI_rdata),
        .S02_AXI_rid(S02_AXI_rid),
        .S02_AXI_rlast(S02_AXI_rlast),
        .S02_AXI_rready(S02_AXI_rready),
        .S02_AXI_rresp(S02_AXI_rresp),
        .S02_AXI_rvalid(S02_AXI_rvalid),
        .S02_AXI_wdata(S02_AXI_wdata),
        .S02_AXI_wlast(S02_AXI_wlast),
        .S02_AXI_wready(S02_AXI_wready),
        .S02_AXI_wstrb(S02_AXI_wstrb),
        .S02_AXI_wvalid(S02_AXI_wvalid),
        .aclk(axi_aclk),
        .aresetn(axi_aresetn));
endmodule

(* CORE_GENERATION_INFO = "top_level,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=top_level,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=23,numReposBlks=20,numNonXlnxBlks=0,numHierBlks=3,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=13,numPkgbdBlks=1,bdsource=USER,\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"da_axi4_cnt\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"=4,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "top_level.hwdef" *) 
module top_level
   (hbm_cattrip,
    pcie0_refclk_clk_n,
    pcie0_refclk_clk_p,
    pcie_mgt_rxn,
    pcie_mgt_rxp,
    pcie_mgt_txn,
    pcie_mgt_txp,
    pcie_perst_l);
  output [0:0]hbm_cattrip;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 pcie0_refclk CLK_N" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pcie0_refclk, CAN_DEBUG false, FREQ_HZ 100000000" *) input [0:0]pcie0_refclk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 pcie0_refclk CLK_P" *) input [0:0]pcie0_refclk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_mgt rxn" *) (* X_INTERFACE_MODE = "Master" *) input [7:0]pcie_mgt_rxn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_mgt rxp" *) input [7:0]pcie_mgt_rxp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_mgt txn" *) output [7:0]pcie_mgt_txn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_mgt txp" *) output [7:0]pcie_mgt_txp;
  input pcie_perst_l;

  wire glb_pre_sw_1;
  wire [0:0]hbm_cattrip;
  wire [63:0]hier_0_M_AXI_ARADDR;
  wire [1:0]hier_0_M_AXI_ARBURST;
  wire [3:0]hier_0_M_AXI_ARCACHE;
  wire [3:0]hier_0_M_AXI_ARID;
  wire [7:0]hier_0_M_AXI_ARLEN;
  wire hier_0_M_AXI_ARLOCK;
  wire [2:0]hier_0_M_AXI_ARPROT;
  wire [3:0]hier_0_M_AXI_ARQOS;
  wire hier_0_M_AXI_ARREADY;
  wire [2:0]hier_0_M_AXI_ARSIZE;
  wire hier_0_M_AXI_ARVALID;
  wire [63:0]hier_0_M_AXI_AWADDR;
  wire [1:0]hier_0_M_AXI_AWBURST;
  wire [3:0]hier_0_M_AXI_AWCACHE;
  wire [3:0]hier_0_M_AXI_AWID;
  wire [7:0]hier_0_M_AXI_AWLEN;
  wire hier_0_M_AXI_AWLOCK;
  wire [2:0]hier_0_M_AXI_AWPROT;
  wire [3:0]hier_0_M_AXI_AWQOS;
  wire hier_0_M_AXI_AWREADY;
  wire [2:0]hier_0_M_AXI_AWSIZE;
  wire hier_0_M_AXI_AWVALID;
  wire [3:0]hier_0_M_AXI_BID;
  wire hier_0_M_AXI_BREADY;
  wire [1:0]hier_0_M_AXI_BRESP;
  wire hier_0_M_AXI_BVALID;
  wire [511:0]hier_0_M_AXI_RDATA;
  wire [3:0]hier_0_M_AXI_RID;
  wire hier_0_M_AXI_RLAST;
  wire hier_0_M_AXI_RREADY;
  wire [1:0]hier_0_M_AXI_RRESP;
  wire hier_0_M_AXI_RVALID;
  wire [511:0]hier_0_M_AXI_WDATA;
  wire hier_0_M_AXI_WLAST;
  wire hier_0_M_AXI_WREADY;
  wire [63:0]hier_0_M_AXI_WSTRB;
  wire hier_0_M_AXI_WVALID;
  wire liq_sw_1;
  wire [0:0]pcie0_refclk_clk_n;
  wire [0:0]pcie0_refclk_clk_p;
  wire [7:0]pcie_mgt_rxn;
  wire [7:0]pcie_mgt_rxp;
  wire [7:0]pcie_mgt_txn;
  wire [7:0]pcie_mgt_txp;
  wire pcie_perst_l;
  wire refn_sw_1;
  wire refp_sw_1;
  wire [7:0]smartconnect_M00_AXI_ARADDR;
  wire [2:0]smartconnect_M00_AXI_ARPROT;
  wire smartconnect_M00_AXI_ARREADY;
  wire smartconnect_M00_AXI_ARVALID;
  wire [7:0]smartconnect_M00_AXI_AWADDR;
  wire [2:0]smartconnect_M00_AXI_AWPROT;
  wire smartconnect_M00_AXI_AWREADY;
  wire smartconnect_M00_AXI_AWVALID;
  wire smartconnect_M00_AXI_BREADY;
  wire [1:0]smartconnect_M00_AXI_BRESP;
  wire smartconnect_M00_AXI_BVALID;
  wire [31:0]smartconnect_M00_AXI_RDATA;
  wire smartconnect_M00_AXI_RREADY;
  wire [1:0]smartconnect_M00_AXI_RRESP;
  wire smartconnect_M00_AXI_RVALID;
  wire [31:0]smartconnect_M00_AXI_WDATA;
  wire smartconnect_M00_AXI_WREADY;
  wire [3:0]smartconnect_M00_AXI_WSTRB;
  wire smartconnect_M00_AXI_WVALID;
  wire [7:0]smartconnect_M01_AXI_ARADDR;
  wire [2:0]smartconnect_M01_AXI_ARPROT;
  wire smartconnect_M01_AXI_ARREADY;
  wire smartconnect_M01_AXI_ARVALID;
  wire [7:0]smartconnect_M01_AXI_AWADDR;
  wire [2:0]smartconnect_M01_AXI_AWPROT;
  wire smartconnect_M01_AXI_AWREADY;
  wire smartconnect_M01_AXI_AWVALID;
  wire smartconnect_M01_AXI_BREADY;
  wire [1:0]smartconnect_M01_AXI_BRESP;
  wire smartconnect_M01_AXI_BVALID;
  wire [31:0]smartconnect_M01_AXI_RDATA;
  wire smartconnect_M01_AXI_RREADY;
  wire [1:0]smartconnect_M01_AXI_RRESP;
  wire smartconnect_M01_AXI_RVALID;
  wire [31:0]smartconnect_M01_AXI_WDATA;
  wire smartconnect_M01_AXI_WREADY;
  wire [3:0]smartconnect_M01_AXI_WSTRB;
  wire smartconnect_M01_AXI_WVALID;
  wire source_200Mhz_clk;
  wire [0:0]source_200Mhz_resetn;
  wire [15:0]tick_count_1;
  wire tick_src_tick;
  wire tick_stb_1;
  wire [63:0]uw_engine_PCI_1_ARADDR;
  wire [1:0]uw_engine_PCI_1_ARBURST;
  wire [3:0]uw_engine_PCI_1_ARCACHE;
  wire [1:0]uw_engine_PCI_1_ARID;
  wire [7:0]uw_engine_PCI_1_ARLEN;
  wire uw_engine_PCI_1_ARLOCK;
  wire [2:0]uw_engine_PCI_1_ARPROT;
  wire [3:0]uw_engine_PCI_1_ARQOS;
  wire uw_engine_PCI_1_ARREADY;
  wire [2:0]uw_engine_PCI_1_ARSIZE;
  wire uw_engine_PCI_1_ARVALID;
  wire [63:0]uw_engine_PCI_1_AWADDR;
  wire [1:0]uw_engine_PCI_1_AWBURST;
  wire [3:0]uw_engine_PCI_1_AWCACHE;
  wire [1:0]uw_engine_PCI_1_AWID;
  wire [7:0]uw_engine_PCI_1_AWLEN;
  wire uw_engine_PCI_1_AWLOCK;
  wire [2:0]uw_engine_PCI_1_AWPROT;
  wire [3:0]uw_engine_PCI_1_AWQOS;
  wire uw_engine_PCI_1_AWREADY;
  wire [2:0]uw_engine_PCI_1_AWSIZE;
  wire uw_engine_PCI_1_AWVALID;
  wire [1:0]uw_engine_PCI_1_BID;
  wire uw_engine_PCI_1_BREADY;
  wire [1:0]uw_engine_PCI_1_BRESP;
  wire uw_engine_PCI_1_BVALID;
  wire [511:0]uw_engine_PCI_1_RDATA;
  wire [1:0]uw_engine_PCI_1_RID;
  wire uw_engine_PCI_1_RLAST;
  wire uw_engine_PCI_1_RREADY;
  wire [1:0]uw_engine_PCI_1_RRESP;
  wire uw_engine_PCI_1_RVALID;
  wire [511:0]uw_engine_PCI_1_WDATA;
  wire uw_engine_PCI_1_WLAST;
  wire uw_engine_PCI_1_WREADY;
  wire [63:0]uw_engine_PCI_1_WSTRB;
  wire uw_engine_PCI_1_WVALID;
  wire [511:0]uw_engine_md_out_TDATA;
  wire uw_engine_md_out_TREADY;
  wire uw_engine_md_out_TVALID;
  wire uw_engine_pre0;
  wire uw_engine_pre256;
  wire uw_engine_rs0;
  wire uw_engine_rs256;
  wire uw_engine_spi_csld;
  wire uw_engine_spi_mosi0;
  wire uw_engine_spi_mosi1;
  wire uw_engine_spi_sck;
  wire [63:0]uwfetcher_0_M_AXI_ARADDR;
  wire [1:0]uwfetcher_0_M_AXI_ARBURST;
  wire [3:0]uwfetcher_0_M_AXI_ARCACHE;
  wire [1:0]uwfetcher_0_M_AXI_ARID;
  wire [7:0]uwfetcher_0_M_AXI_ARLEN;
  wire uwfetcher_0_M_AXI_ARLOCK;
  wire [2:0]uwfetcher_0_M_AXI_ARPROT;
  wire [3:0]uwfetcher_0_M_AXI_ARQOS;
  wire uwfetcher_0_M_AXI_ARREADY;
  wire [2:0]uwfetcher_0_M_AXI_ARSIZE;
  wire uwfetcher_0_M_AXI_ARVALID;
  wire [63:0]uwfetcher_0_M_AXI_AWADDR;
  wire [1:0]uwfetcher_0_M_AXI_AWBURST;
  wire [3:0]uwfetcher_0_M_AXI_AWCACHE;
  wire [1:0]uwfetcher_0_M_AXI_AWID;
  wire [7:0]uwfetcher_0_M_AXI_AWLEN;
  wire uwfetcher_0_M_AXI_AWLOCK;
  wire [2:0]uwfetcher_0_M_AXI_AWPROT;
  wire [3:0]uwfetcher_0_M_AXI_AWQOS;
  wire uwfetcher_0_M_AXI_AWREADY;
  wire [2:0]uwfetcher_0_M_AXI_AWSIZE;
  wire uwfetcher_0_M_AXI_AWVALID;
  wire [1:0]uwfetcher_0_M_AXI_BID;
  wire uwfetcher_0_M_AXI_BREADY;
  wire [1:0]uwfetcher_0_M_AXI_BRESP;
  wire uwfetcher_0_M_AXI_BVALID;
  wire [511:0]uwfetcher_0_M_AXI_RDATA;
  wire [1:0]uwfetcher_0_M_AXI_RID;
  wire uwfetcher_0_M_AXI_RLAST;
  wire uwfetcher_0_M_AXI_RREADY;
  wire [1:0]uwfetcher_0_M_AXI_RRESP;
  wire uwfetcher_0_M_AXI_RVALID;
  wire [511:0]uwfetcher_0_M_AXI_WDATA;
  wire uwfetcher_0_M_AXI_WLAST;
  wire uwfetcher_0_M_AXI_WREADY;
  wire [63:0]uwfetcher_0_M_AXI_WSTRB;
  wire uwfetcher_0_M_AXI_WVALID;
  wire vprebot_sw_1;
  wire vpretop_sw_1;
  wire [63:0]xdma_0_M_AXI_B_ARADDR;
  wire [1:0]xdma_0_M_AXI_B_ARBURST;
  wire [3:0]xdma_0_M_AXI_B_ARCACHE;
  wire [3:0]xdma_0_M_AXI_B_ARID;
  wire [7:0]xdma_0_M_AXI_B_ARLEN;
  wire [0:0]xdma_0_M_AXI_B_ARLOCK;
  wire [2:0]xdma_0_M_AXI_B_ARPROT;
  wire xdma_0_M_AXI_B_ARREADY;
  wire [2:0]xdma_0_M_AXI_B_ARSIZE;
  wire xdma_0_M_AXI_B_ARVALID;
  wire [63:0]xdma_0_M_AXI_B_AWADDR;
  wire [1:0]xdma_0_M_AXI_B_AWBURST;
  wire [3:0]xdma_0_M_AXI_B_AWCACHE;
  wire [3:0]xdma_0_M_AXI_B_AWID;
  wire [7:0]xdma_0_M_AXI_B_AWLEN;
  wire [0:0]xdma_0_M_AXI_B_AWLOCK;
  wire [2:0]xdma_0_M_AXI_B_AWPROT;
  wire xdma_0_M_AXI_B_AWREADY;
  wire [2:0]xdma_0_M_AXI_B_AWSIZE;
  wire xdma_0_M_AXI_B_AWVALID;
  wire [3:0]xdma_0_M_AXI_B_BID;
  wire xdma_0_M_AXI_B_BREADY;
  wire [1:0]xdma_0_M_AXI_B_BRESP;
  wire xdma_0_M_AXI_B_BVALID;
  wire [511:0]xdma_0_M_AXI_B_RDATA;
  wire [3:0]xdma_0_M_AXI_B_RID;
  wire xdma_0_M_AXI_B_RLAST;
  wire xdma_0_M_AXI_B_RREADY;
  wire [1:0]xdma_0_M_AXI_B_RRESP;
  wire xdma_0_M_AXI_B_RVALID;
  wire [511:0]xdma_0_M_AXI_B_WDATA;
  wire xdma_0_M_AXI_B_WLAST;
  wire xdma_0_M_AXI_B_WREADY;
  wire [63:0]xdma_0_M_AXI_B_WSTRB;
  wire xdma_0_M_AXI_B_WVALID;

  pcie_imp_P7FEFP pcie
       (.M_AXI_B_araddr(xdma_0_M_AXI_B_ARADDR),
        .M_AXI_B_arburst(xdma_0_M_AXI_B_ARBURST),
        .M_AXI_B_arcache(xdma_0_M_AXI_B_ARCACHE),
        .M_AXI_B_arid(xdma_0_M_AXI_B_ARID),
        .M_AXI_B_arlen(xdma_0_M_AXI_B_ARLEN),
        .M_AXI_B_arlock(xdma_0_M_AXI_B_ARLOCK),
        .M_AXI_B_arprot(xdma_0_M_AXI_B_ARPROT),
        .M_AXI_B_arready(xdma_0_M_AXI_B_ARREADY),
        .M_AXI_B_arsize(xdma_0_M_AXI_B_ARSIZE),
        .M_AXI_B_arvalid(xdma_0_M_AXI_B_ARVALID),
        .M_AXI_B_awaddr(xdma_0_M_AXI_B_AWADDR),
        .M_AXI_B_awburst(xdma_0_M_AXI_B_AWBURST),
        .M_AXI_B_awcache(xdma_0_M_AXI_B_AWCACHE),
        .M_AXI_B_awid(xdma_0_M_AXI_B_AWID),
        .M_AXI_B_awlen(xdma_0_M_AXI_B_AWLEN),
        .M_AXI_B_awlock(xdma_0_M_AXI_B_AWLOCK),
        .M_AXI_B_awprot(xdma_0_M_AXI_B_AWPROT),
        .M_AXI_B_awready(xdma_0_M_AXI_B_AWREADY),
        .M_AXI_B_awsize(xdma_0_M_AXI_B_AWSIZE),
        .M_AXI_B_awvalid(xdma_0_M_AXI_B_AWVALID),
        .M_AXI_B_bid(xdma_0_M_AXI_B_BID),
        .M_AXI_B_bready(xdma_0_M_AXI_B_BREADY),
        .M_AXI_B_bresp(xdma_0_M_AXI_B_BRESP),
        .M_AXI_B_bvalid(xdma_0_M_AXI_B_BVALID),
        .M_AXI_B_rdata(xdma_0_M_AXI_B_RDATA),
        .M_AXI_B_rid(xdma_0_M_AXI_B_RID),
        .M_AXI_B_rlast(xdma_0_M_AXI_B_RLAST),
        .M_AXI_B_rready(xdma_0_M_AXI_B_RREADY),
        .M_AXI_B_rresp(xdma_0_M_AXI_B_RRESP),
        .M_AXI_B_rvalid(xdma_0_M_AXI_B_RVALID),
        .M_AXI_B_wdata(xdma_0_M_AXI_B_WDATA),
        .M_AXI_B_wlast(xdma_0_M_AXI_B_WLAST),
        .M_AXI_B_wready(xdma_0_M_AXI_B_WREADY),
        .M_AXI_B_wstrb(xdma_0_M_AXI_B_WSTRB),
        .M_AXI_B_wvalid(xdma_0_M_AXI_B_WVALID),
        .S00_AXI_araddr(uwfetcher_0_M_AXI_ARADDR),
        .S00_AXI_arburst(uwfetcher_0_M_AXI_ARBURST),
        .S00_AXI_arcache(uwfetcher_0_M_AXI_ARCACHE),
        .S00_AXI_arid(uwfetcher_0_M_AXI_ARID),
        .S00_AXI_arlen(uwfetcher_0_M_AXI_ARLEN),
        .S00_AXI_arlock(uwfetcher_0_M_AXI_ARLOCK),
        .S00_AXI_arprot(uwfetcher_0_M_AXI_ARPROT),
        .S00_AXI_arqos(uwfetcher_0_M_AXI_ARQOS),
        .S00_AXI_arready(uwfetcher_0_M_AXI_ARREADY),
        .S00_AXI_arsize(uwfetcher_0_M_AXI_ARSIZE),
        .S00_AXI_arvalid(uwfetcher_0_M_AXI_ARVALID),
        .S00_AXI_awaddr(uwfetcher_0_M_AXI_AWADDR),
        .S00_AXI_awburst(uwfetcher_0_M_AXI_AWBURST),
        .S00_AXI_awcache(uwfetcher_0_M_AXI_AWCACHE),
        .S00_AXI_awid(uwfetcher_0_M_AXI_AWID),
        .S00_AXI_awlen(uwfetcher_0_M_AXI_AWLEN),
        .S00_AXI_awlock(uwfetcher_0_M_AXI_AWLOCK),
        .S00_AXI_awprot(uwfetcher_0_M_AXI_AWPROT),
        .S00_AXI_awqos(uwfetcher_0_M_AXI_AWQOS),
        .S00_AXI_awready(uwfetcher_0_M_AXI_AWREADY),
        .S00_AXI_awsize(uwfetcher_0_M_AXI_AWSIZE),
        .S00_AXI_awvalid(uwfetcher_0_M_AXI_AWVALID),
        .S00_AXI_bid(uwfetcher_0_M_AXI_BID),
        .S00_AXI_bready(uwfetcher_0_M_AXI_BREADY),
        .S00_AXI_bresp(uwfetcher_0_M_AXI_BRESP),
        .S00_AXI_bvalid(uwfetcher_0_M_AXI_BVALID),
        .S00_AXI_rdata(uwfetcher_0_M_AXI_RDATA),
        .S00_AXI_rid(uwfetcher_0_M_AXI_RID),
        .S00_AXI_rlast(uwfetcher_0_M_AXI_RLAST),
        .S00_AXI_rready(uwfetcher_0_M_AXI_RREADY),
        .S00_AXI_rresp(uwfetcher_0_M_AXI_RRESP),
        .S00_AXI_rvalid(uwfetcher_0_M_AXI_RVALID),
        .S00_AXI_wdata(uwfetcher_0_M_AXI_WDATA),
        .S00_AXI_wlast(uwfetcher_0_M_AXI_WLAST),
        .S00_AXI_wready(uwfetcher_0_M_AXI_WREADY),
        .S00_AXI_wstrb(uwfetcher_0_M_AXI_WSTRB),
        .S00_AXI_wvalid(uwfetcher_0_M_AXI_WVALID),
        .S01_AXI_araddr(hier_0_M_AXI_ARADDR),
        .S01_AXI_arburst(hier_0_M_AXI_ARBURST),
        .S01_AXI_arcache(hier_0_M_AXI_ARCACHE),
        .S01_AXI_arid(hier_0_M_AXI_ARID),
        .S01_AXI_arlen(hier_0_M_AXI_ARLEN),
        .S01_AXI_arlock(hier_0_M_AXI_ARLOCK),
        .S01_AXI_arprot(hier_0_M_AXI_ARPROT),
        .S01_AXI_arqos(hier_0_M_AXI_ARQOS),
        .S01_AXI_arready(hier_0_M_AXI_ARREADY),
        .S01_AXI_arsize(hier_0_M_AXI_ARSIZE),
        .S01_AXI_arvalid(hier_0_M_AXI_ARVALID),
        .S01_AXI_awaddr(hier_0_M_AXI_AWADDR),
        .S01_AXI_awburst(hier_0_M_AXI_AWBURST),
        .S01_AXI_awcache(hier_0_M_AXI_AWCACHE),
        .S01_AXI_awid(hier_0_M_AXI_AWID),
        .S01_AXI_awlen(hier_0_M_AXI_AWLEN),
        .S01_AXI_awlock(hier_0_M_AXI_AWLOCK),
        .S01_AXI_awprot(hier_0_M_AXI_AWPROT),
        .S01_AXI_awqos(hier_0_M_AXI_AWQOS),
        .S01_AXI_awready(hier_0_M_AXI_AWREADY),
        .S01_AXI_awsize(hier_0_M_AXI_AWSIZE),
        .S01_AXI_awvalid(hier_0_M_AXI_AWVALID),
        .S01_AXI_bid(hier_0_M_AXI_BID),
        .S01_AXI_bready(hier_0_M_AXI_BREADY),
        .S01_AXI_bresp(hier_0_M_AXI_BRESP),
        .S01_AXI_bvalid(hier_0_M_AXI_BVALID),
        .S01_AXI_rdata(hier_0_M_AXI_RDATA),
        .S01_AXI_rid(hier_0_M_AXI_RID),
        .S01_AXI_rlast(hier_0_M_AXI_RLAST),
        .S01_AXI_rready(hier_0_M_AXI_RREADY),
        .S01_AXI_rresp(hier_0_M_AXI_RRESP),
        .S01_AXI_rvalid(hier_0_M_AXI_RVALID),
        .S01_AXI_wdata(hier_0_M_AXI_WDATA),
        .S01_AXI_wlast(hier_0_M_AXI_WLAST),
        .S01_AXI_wready(hier_0_M_AXI_WREADY),
        .S01_AXI_wstrb(hier_0_M_AXI_WSTRB),
        .S01_AXI_wvalid(hier_0_M_AXI_WVALID),
        .S02_AXI_araddr(uw_engine_PCI_1_ARADDR),
        .S02_AXI_arburst(uw_engine_PCI_1_ARBURST),
        .S02_AXI_arcache(uw_engine_PCI_1_ARCACHE),
        .S02_AXI_arid(uw_engine_PCI_1_ARID),
        .S02_AXI_arlen(uw_engine_PCI_1_ARLEN),
        .S02_AXI_arlock(uw_engine_PCI_1_ARLOCK),
        .S02_AXI_arprot(uw_engine_PCI_1_ARPROT),
        .S02_AXI_arqos(uw_engine_PCI_1_ARQOS),
        .S02_AXI_arready(uw_engine_PCI_1_ARREADY),
        .S02_AXI_arsize(uw_engine_PCI_1_ARSIZE),
        .S02_AXI_arvalid(uw_engine_PCI_1_ARVALID),
        .S02_AXI_awaddr(uw_engine_PCI_1_AWADDR),
        .S02_AXI_awburst(uw_engine_PCI_1_AWBURST),
        .S02_AXI_awcache(uw_engine_PCI_1_AWCACHE),
        .S02_AXI_awid(uw_engine_PCI_1_AWID),
        .S02_AXI_awlen(uw_engine_PCI_1_AWLEN),
        .S02_AXI_awlock(uw_engine_PCI_1_AWLOCK),
        .S02_AXI_awprot(uw_engine_PCI_1_AWPROT),
        .S02_AXI_awqos(uw_engine_PCI_1_AWQOS),
        .S02_AXI_awready(uw_engine_PCI_1_AWREADY),
        .S02_AXI_awsize(uw_engine_PCI_1_AWSIZE),
        .S02_AXI_awvalid(uw_engine_PCI_1_AWVALID),
        .S02_AXI_bid(uw_engine_PCI_1_BID),
        .S02_AXI_bready(uw_engine_PCI_1_BREADY),
        .S02_AXI_bresp(uw_engine_PCI_1_BRESP),
        .S02_AXI_bvalid(uw_engine_PCI_1_BVALID),
        .S02_AXI_rdata(uw_engine_PCI_1_RDATA),
        .S02_AXI_rid(uw_engine_PCI_1_RID),
        .S02_AXI_rlast(uw_engine_PCI_1_RLAST),
        .S02_AXI_rready(uw_engine_PCI_1_RREADY),
        .S02_AXI_rresp(uw_engine_PCI_1_RRESP),
        .S02_AXI_rvalid(uw_engine_PCI_1_RVALID),
        .S02_AXI_wdata(uw_engine_PCI_1_WDATA),
        .S02_AXI_wlast(uw_engine_PCI_1_WLAST),
        .S02_AXI_wready(uw_engine_PCI_1_WREADY),
        .S02_AXI_wstrb(uw_engine_PCI_1_WSTRB),
        .S02_AXI_wvalid(uw_engine_PCI_1_WVALID),
        .axi_aclk(source_200Mhz_clk),
        .axi_aresetn(source_200Mhz_resetn),
        .pcie_mgt_rxn(pcie_mgt_rxn),
        .pcie_mgt_rxp(pcie_mgt_rxp),
        .pcie_mgt_txn(pcie_mgt_txn),
        .pcie_mgt_txp(pcie_mgt_txp),
        .pcie_perst_l(pcie_perst_l),
        .pcie_refclk_clk_n(pcie0_refclk_clk_n),
        .pcie_refclk_clk_p(pcie0_refclk_clk_p));
  top_level_smartconnect_0_0 smartconnect
       (.M00_AXI_araddr(smartconnect_M00_AXI_ARADDR),
        .M00_AXI_arprot(smartconnect_M00_AXI_ARPROT),
        .M00_AXI_arready(smartconnect_M00_AXI_ARREADY),
        .M00_AXI_arvalid(smartconnect_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_M00_AXI_AWADDR),
        .M00_AXI_awprot(smartconnect_M00_AXI_AWPROT),
        .M00_AXI_awready(smartconnect_M00_AXI_AWREADY),
        .M00_AXI_awvalid(smartconnect_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_M00_AXI_BRESP),
        .M00_AXI_bvalid(smartconnect_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_M00_AXI_RDATA),
        .M00_AXI_rready(smartconnect_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_M00_AXI_WDATA),
        .M00_AXI_wready(smartconnect_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_M00_AXI_WVALID),
        .M01_AXI_araddr(smartconnect_M01_AXI_ARADDR),
        .M01_AXI_arprot(smartconnect_M01_AXI_ARPROT),
        .M01_AXI_arready(smartconnect_M01_AXI_ARREADY),
        .M01_AXI_arvalid(smartconnect_M01_AXI_ARVALID),
        .M01_AXI_awaddr(smartconnect_M01_AXI_AWADDR),
        .M01_AXI_awprot(smartconnect_M01_AXI_AWPROT),
        .M01_AXI_awready(smartconnect_M01_AXI_AWREADY),
        .M01_AXI_awvalid(smartconnect_M01_AXI_AWVALID),
        .M01_AXI_bready(smartconnect_M01_AXI_BREADY),
        .M01_AXI_bresp(smartconnect_M01_AXI_BRESP),
        .M01_AXI_bvalid(smartconnect_M01_AXI_BVALID),
        .M01_AXI_rdata(smartconnect_M01_AXI_RDATA),
        .M01_AXI_rready(smartconnect_M01_AXI_RREADY),
        .M01_AXI_rresp(smartconnect_M01_AXI_RRESP),
        .M01_AXI_rvalid(smartconnect_M01_AXI_RVALID),
        .M01_AXI_wdata(smartconnect_M01_AXI_WDATA),
        .M01_AXI_wready(smartconnect_M01_AXI_WREADY),
        .M01_AXI_wstrb(smartconnect_M01_AXI_WSTRB),
        .M01_AXI_wvalid(smartconnect_M01_AXI_WVALID),
        .S00_AXI_araddr(xdma_0_M_AXI_B_ARADDR),
        .S00_AXI_arburst(xdma_0_M_AXI_B_ARBURST),
        .S00_AXI_arcache(xdma_0_M_AXI_B_ARCACHE),
        .S00_AXI_arid(xdma_0_M_AXI_B_ARID),
        .S00_AXI_arlen(xdma_0_M_AXI_B_ARLEN),
        .S00_AXI_arlock(xdma_0_M_AXI_B_ARLOCK),
        .S00_AXI_arprot(xdma_0_M_AXI_B_ARPROT),
        .S00_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_arready(xdma_0_M_AXI_B_ARREADY),
        .S00_AXI_arsize(xdma_0_M_AXI_B_ARSIZE),
        .S00_AXI_arvalid(xdma_0_M_AXI_B_ARVALID),
        .S00_AXI_awaddr(xdma_0_M_AXI_B_AWADDR),
        .S00_AXI_awburst(xdma_0_M_AXI_B_AWBURST),
        .S00_AXI_awcache(xdma_0_M_AXI_B_AWCACHE),
        .S00_AXI_awid(xdma_0_M_AXI_B_AWID),
        .S00_AXI_awlen(xdma_0_M_AXI_B_AWLEN),
        .S00_AXI_awlock(xdma_0_M_AXI_B_AWLOCK),
        .S00_AXI_awprot(xdma_0_M_AXI_B_AWPROT),
        .S00_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_awready(xdma_0_M_AXI_B_AWREADY),
        .S00_AXI_awsize(xdma_0_M_AXI_B_AWSIZE),
        .S00_AXI_awvalid(xdma_0_M_AXI_B_AWVALID),
        .S00_AXI_bid(xdma_0_M_AXI_B_BID),
        .S00_AXI_bready(xdma_0_M_AXI_B_BREADY),
        .S00_AXI_bresp(xdma_0_M_AXI_B_BRESP),
        .S00_AXI_bvalid(xdma_0_M_AXI_B_BVALID),
        .S00_AXI_rdata(xdma_0_M_AXI_B_RDATA),
        .S00_AXI_rid(xdma_0_M_AXI_B_RID),
        .S00_AXI_rlast(xdma_0_M_AXI_B_RLAST),
        .S00_AXI_rready(xdma_0_M_AXI_B_RREADY),
        .S00_AXI_rresp(xdma_0_M_AXI_B_RRESP),
        .S00_AXI_rvalid(xdma_0_M_AXI_B_RVALID),
        .S00_AXI_wdata(xdma_0_M_AXI_B_WDATA),
        .S00_AXI_wlast(xdma_0_M_AXI_B_WLAST),
        .S00_AXI_wready(xdma_0_M_AXI_B_WREADY),
        .S00_AXI_wstrb(xdma_0_M_AXI_B_WSTRB),
        .S00_AXI_wvalid(xdma_0_M_AXI_B_WVALID),
        .aclk(source_200Mhz_clk),
        .aresetn(source_200Mhz_resetn));
  top_level_tick_src_0_0 tick_src
       (.clk(source_200Mhz_clk),
        .tick(tick_src_tick));
  userwave_inst_0 uw_engine
       (.Q0_PCI_araddr(uwfetcher_0_M_AXI_ARADDR),
        .Q0_PCI_arburst(uwfetcher_0_M_AXI_ARBURST),
        .Q0_PCI_arcache(uwfetcher_0_M_AXI_ARCACHE),
        .Q0_PCI_arid(uwfetcher_0_M_AXI_ARID),
        .Q0_PCI_arlen(uwfetcher_0_M_AXI_ARLEN),
        .Q0_PCI_arlock(uwfetcher_0_M_AXI_ARLOCK),
        .Q0_PCI_arprot(uwfetcher_0_M_AXI_ARPROT),
        .Q0_PCI_arqos(uwfetcher_0_M_AXI_ARQOS),
        .Q0_PCI_arready(uwfetcher_0_M_AXI_ARREADY),
        .Q0_PCI_arsize(uwfetcher_0_M_AXI_ARSIZE),
        .Q0_PCI_arvalid(uwfetcher_0_M_AXI_ARVALID),
        .Q0_PCI_awaddr(uwfetcher_0_M_AXI_AWADDR),
        .Q0_PCI_awburst(uwfetcher_0_M_AXI_AWBURST),
        .Q0_PCI_awcache(uwfetcher_0_M_AXI_AWCACHE),
        .Q0_PCI_awid(uwfetcher_0_M_AXI_AWID),
        .Q0_PCI_awlen(uwfetcher_0_M_AXI_AWLEN),
        .Q0_PCI_awlock(uwfetcher_0_M_AXI_AWLOCK),
        .Q0_PCI_awprot(uwfetcher_0_M_AXI_AWPROT),
        .Q0_PCI_awqos(uwfetcher_0_M_AXI_AWQOS),
        .Q0_PCI_awready(uwfetcher_0_M_AXI_AWREADY),
        .Q0_PCI_awsize(uwfetcher_0_M_AXI_AWSIZE),
        .Q0_PCI_awvalid(uwfetcher_0_M_AXI_AWVALID),
        .Q0_PCI_bid(uwfetcher_0_M_AXI_BID),
        .Q0_PCI_bready(uwfetcher_0_M_AXI_BREADY),
        .Q0_PCI_bresp(uwfetcher_0_M_AXI_BRESP),
        .Q0_PCI_bvalid(uwfetcher_0_M_AXI_BVALID),
        .Q0_PCI_rdata(uwfetcher_0_M_AXI_RDATA),
        .Q0_PCI_rid(uwfetcher_0_M_AXI_RID),
        .Q0_PCI_rlast(uwfetcher_0_M_AXI_RLAST),
        .Q0_PCI_rready(uwfetcher_0_M_AXI_RREADY),
        .Q0_PCI_rresp(uwfetcher_0_M_AXI_RRESP),
        .Q0_PCI_rvalid(uwfetcher_0_M_AXI_RVALID),
        .Q0_PCI_wdata(uwfetcher_0_M_AXI_WDATA),
        .Q0_PCI_wlast(uwfetcher_0_M_AXI_WLAST),
        .Q0_PCI_wready(uwfetcher_0_M_AXI_WREADY),
        .Q0_PCI_wstrb(uwfetcher_0_M_AXI_WSTRB),
        .Q0_PCI_wvalid(uwfetcher_0_M_AXI_WVALID),
        .Q1_PCI_araddr(uw_engine_PCI_1_ARADDR),
        .Q1_PCI_arburst(uw_engine_PCI_1_ARBURST),
        .Q1_PCI_arcache(uw_engine_PCI_1_ARCACHE),
        .Q1_PCI_arid(uw_engine_PCI_1_ARID),
        .Q1_PCI_arlen(uw_engine_PCI_1_ARLEN),
        .Q1_PCI_arlock(uw_engine_PCI_1_ARLOCK),
        .Q1_PCI_arprot(uw_engine_PCI_1_ARPROT),
        .Q1_PCI_arqos(uw_engine_PCI_1_ARQOS),
        .Q1_PCI_arready(uw_engine_PCI_1_ARREADY),
        .Q1_PCI_arsize(uw_engine_PCI_1_ARSIZE),
        .Q1_PCI_arvalid(uw_engine_PCI_1_ARVALID),
        .Q1_PCI_awaddr(uw_engine_PCI_1_AWADDR),
        .Q1_PCI_awburst(uw_engine_PCI_1_AWBURST),
        .Q1_PCI_awcache(uw_engine_PCI_1_AWCACHE),
        .Q1_PCI_awid(uw_engine_PCI_1_AWID),
        .Q1_PCI_awlen(uw_engine_PCI_1_AWLEN),
        .Q1_PCI_awlock(uw_engine_PCI_1_AWLOCK),
        .Q1_PCI_awprot(uw_engine_PCI_1_AWPROT),
        .Q1_PCI_awqos(uw_engine_PCI_1_AWQOS),
        .Q1_PCI_awready(uw_engine_PCI_1_AWREADY),
        .Q1_PCI_awsize(uw_engine_PCI_1_AWSIZE),
        .Q1_PCI_awvalid(uw_engine_PCI_1_AWVALID),
        .Q1_PCI_bid(uw_engine_PCI_1_BID),
        .Q1_PCI_bready(uw_engine_PCI_1_BREADY),
        .Q1_PCI_bresp(uw_engine_PCI_1_BRESP),
        .Q1_PCI_bvalid(uw_engine_PCI_1_BVALID),
        .Q1_PCI_rdata(uw_engine_PCI_1_RDATA),
        .Q1_PCI_rid(uw_engine_PCI_1_RID),
        .Q1_PCI_rlast(uw_engine_PCI_1_RLAST),
        .Q1_PCI_rready(uw_engine_PCI_1_RREADY),
        .Q1_PCI_rresp(uw_engine_PCI_1_RRESP),
        .Q1_PCI_rvalid(uw_engine_PCI_1_RVALID),
        .Q1_PCI_wdata(uw_engine_PCI_1_WDATA),
        .Q1_PCI_wlast(uw_engine_PCI_1_WLAST),
        .Q1_PCI_wready(uw_engine_PCI_1_WREADY),
        .Q1_PCI_wstrb(uw_engine_PCI_1_WSTRB),
        .Q1_PCI_wvalid(uw_engine_PCI_1_WVALID),
        .S_AXI_araddr(smartconnect_M00_AXI_ARADDR),
        .S_AXI_arprot(smartconnect_M00_AXI_ARPROT),
        .S_AXI_arready(smartconnect_M00_AXI_ARREADY),
        .S_AXI_arvalid(smartconnect_M00_AXI_ARVALID),
        .S_AXI_awaddr(smartconnect_M00_AXI_AWADDR),
        .S_AXI_awprot(smartconnect_M00_AXI_AWPROT),
        .S_AXI_awready(smartconnect_M00_AXI_AWREADY),
        .S_AXI_awvalid(smartconnect_M00_AXI_AWVALID),
        .S_AXI_bready(smartconnect_M00_AXI_BREADY),
        .S_AXI_bresp(smartconnect_M00_AXI_BRESP),
        .S_AXI_bvalid(smartconnect_M00_AXI_BVALID),
        .S_AXI_rdata(smartconnect_M00_AXI_RDATA),
        .S_AXI_rready(smartconnect_M00_AXI_RREADY),
        .S_AXI_rresp(smartconnect_M00_AXI_RRESP),
        .S_AXI_rvalid(smartconnect_M00_AXI_RVALID),
        .S_AXI_wdata(smartconnect_M00_AXI_WDATA),
        .S_AXI_wready(smartconnect_M00_AXI_WREADY),
        .S_AXI_wstrb(smartconnect_M00_AXI_WSTRB),
        .S_AXI_wvalid(smartconnect_M00_AXI_WVALID),
        .clk(source_200Mhz_clk),
        .glb_pre_sw(glb_pre_sw_1),
        .liq_sw(liq_sw_1),
        .md_out_tdata(uw_engine_md_out_TDATA),
        .md_out_tready(uw_engine_md_out_TREADY),
        .md_out_tvalid(uw_engine_md_out_TVALID),
        .pa_sync(tick_src_tick),
        .pre0(uw_engine_pre0),
        .pre256(uw_engine_pre256),
        .refn_sw(refn_sw_1),
        .refp_sw(refp_sw_1),
        .resetn(source_200Mhz_resetn),
        .row_tick_stb(tick_stb_1),
        .rs0(uw_engine_rs0),
        .rs256(uw_engine_rs256),
        .spi_csld(uw_engine_spi_csld),
        .spi_mosi0(uw_engine_spi_mosi0),
        .spi_mosi1(uw_engine_spi_mosi1),
        .spi_sck(uw_engine_spi_sck),
        .tick_count(tick_count_1),
        .vprebot_sw(vprebot_sw_1),
        .vpretop_sw(vpretop_sw_1));
  uw_recorder_imp_18A1Y49 uw_recorder
       (.M_PCI_araddr(hier_0_M_AXI_ARADDR),
        .M_PCI_arburst(hier_0_M_AXI_ARBURST),
        .M_PCI_arcache(hier_0_M_AXI_ARCACHE),
        .M_PCI_arid(hier_0_M_AXI_ARID),
        .M_PCI_arlen(hier_0_M_AXI_ARLEN),
        .M_PCI_arlock(hier_0_M_AXI_ARLOCK),
        .M_PCI_arprot(hier_0_M_AXI_ARPROT),
        .M_PCI_arqos(hier_0_M_AXI_ARQOS),
        .M_PCI_arready(hier_0_M_AXI_ARREADY),
        .M_PCI_arsize(hier_0_M_AXI_ARSIZE),
        .M_PCI_arvalid(hier_0_M_AXI_ARVALID),
        .M_PCI_awaddr(hier_0_M_AXI_AWADDR),
        .M_PCI_awburst(hier_0_M_AXI_AWBURST),
        .M_PCI_awcache(hier_0_M_AXI_AWCACHE),
        .M_PCI_awid(hier_0_M_AXI_AWID),
        .M_PCI_awlen(hier_0_M_AXI_AWLEN),
        .M_PCI_awlock(hier_0_M_AXI_AWLOCK),
        .M_PCI_awprot(hier_0_M_AXI_AWPROT),
        .M_PCI_awqos(hier_0_M_AXI_AWQOS),
        .M_PCI_awready(hier_0_M_AXI_AWREADY),
        .M_PCI_awsize(hier_0_M_AXI_AWSIZE),
        .M_PCI_awvalid(hier_0_M_AXI_AWVALID),
        .M_PCI_bid(hier_0_M_AXI_BID),
        .M_PCI_bready(hier_0_M_AXI_BREADY),
        .M_PCI_bresp(hier_0_M_AXI_BRESP),
        .M_PCI_bvalid(hier_0_M_AXI_BVALID),
        .M_PCI_rdata(hier_0_M_AXI_RDATA),
        .M_PCI_rid(hier_0_M_AXI_RID),
        .M_PCI_rlast(hier_0_M_AXI_RLAST),
        .M_PCI_rready(hier_0_M_AXI_RREADY),
        .M_PCI_rresp(hier_0_M_AXI_RRESP),
        .M_PCI_rvalid(hier_0_M_AXI_RVALID),
        .M_PCI_wdata(hier_0_M_AXI_WDATA),
        .M_PCI_wlast(hier_0_M_AXI_WLAST),
        .M_PCI_wready(hier_0_M_AXI_WREADY),
        .M_PCI_wstrb(hier_0_M_AXI_WSTRB),
        .M_PCI_wvalid(hier_0_M_AXI_WVALID),
        .S_AXI_araddr(smartconnect_M01_AXI_ARADDR),
        .S_AXI_arprot(smartconnect_M01_AXI_ARPROT),
        .S_AXI_arready(smartconnect_M01_AXI_ARREADY),
        .S_AXI_arvalid(smartconnect_M01_AXI_ARVALID),
        .S_AXI_awaddr(smartconnect_M01_AXI_AWADDR),
        .S_AXI_awprot(smartconnect_M01_AXI_AWPROT),
        .S_AXI_awready(smartconnect_M01_AXI_AWREADY),
        .S_AXI_awvalid(smartconnect_M01_AXI_AWVALID),
        .S_AXI_bready(smartconnect_M01_AXI_BREADY),
        .S_AXI_bresp(smartconnect_M01_AXI_BRESP),
        .S_AXI_bvalid(smartconnect_M01_AXI_BVALID),
        .S_AXI_rdata(smartconnect_M01_AXI_RDATA),
        .S_AXI_rready(smartconnect_M01_AXI_RREADY),
        .S_AXI_rresp(smartconnect_M01_AXI_RRESP),
        .S_AXI_rvalid(smartconnect_M01_AXI_RVALID),
        .S_AXI_wdata(smartconnect_M01_AXI_WDATA),
        .S_AXI_wready(smartconnect_M01_AXI_WREADY),
        .S_AXI_wstrb(smartconnect_M01_AXI_WSTRB),
        .S_AXI_wvalid(smartconnect_M01_AXI_WVALID),
        .clk(source_200Mhz_clk),
        .glb_pre_sw(glb_pre_sw_1),
        .liq_sw(liq_sw_1),
        .md_in_tdata(uw_engine_md_out_TDATA),
        .md_in_tready(uw_engine_md_out_TREADY),
        .md_in_tvalid(uw_engine_md_out_TVALID),
        .pre0(uw_engine_pre0),
        .pre256(uw_engine_pre256),
        .refn_sw(refn_sw_1),
        .refp_sw(refp_sw_1),
        .resetn(source_200Mhz_resetn),
        .row_tick_stb(tick_stb_1),
        .rs0(uw_engine_rs0),
        .rs256(uw_engine_rs256),
        .spi_csld(uw_engine_spi_csld),
        .spi_mosi0(uw_engine_spi_mosi0),
        .spi_mosi1(uw_engine_spi_mosi1),
        .spi_sck(uw_engine_spi_sck),
        .tick_count(tick_count_1),
        .vprebot_sw(vprebot_sw_1),
        .vpretop_sw(vpretop_sw_1));
  assign hbm_cattrip = 1'h1;
endmodule

module uw_recorder_imp_18A1Y49
   (M_PCI_araddr,
    M_PCI_arburst,
    M_PCI_arcache,
    M_PCI_arid,
    M_PCI_arlen,
    M_PCI_arlock,
    M_PCI_arprot,
    M_PCI_arqos,
    M_PCI_arready,
    M_PCI_arsize,
    M_PCI_arvalid,
    M_PCI_awaddr,
    M_PCI_awburst,
    M_PCI_awcache,
    M_PCI_awid,
    M_PCI_awlen,
    M_PCI_awlock,
    M_PCI_awprot,
    M_PCI_awqos,
    M_PCI_awready,
    M_PCI_awsize,
    M_PCI_awvalid,
    M_PCI_bid,
    M_PCI_bready,
    M_PCI_bresp,
    M_PCI_bvalid,
    M_PCI_rdata,
    M_PCI_rid,
    M_PCI_rlast,
    M_PCI_rready,
    M_PCI_rresp,
    M_PCI_rvalid,
    M_PCI_wdata,
    M_PCI_wlast,
    M_PCI_wready,
    M_PCI_wstrb,
    M_PCI_wvalid,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid,
    clk,
    glb_pre_sw,
    liq_sw,
    md_in_tdata,
    md_in_tready,
    md_in_tvalid,
    pre0,
    pre256,
    refn_sw,
    refp_sw,
    resetn,
    row_tick_stb,
    rs0,
    rs256,
    spi_csld,
    spi_mosi0,
    spi_mosi1,
    spi_sck,
    tick_count,
    vprebot_sw,
    vpretop_sw);
  output [63:0]M_PCI_araddr;
  output [1:0]M_PCI_arburst;
  output [3:0]M_PCI_arcache;
  output [3:0]M_PCI_arid;
  output [7:0]M_PCI_arlen;
  output M_PCI_arlock;
  output [2:0]M_PCI_arprot;
  output [3:0]M_PCI_arqos;
  input M_PCI_arready;
  output [2:0]M_PCI_arsize;
  output M_PCI_arvalid;
  output [63:0]M_PCI_awaddr;
  output [1:0]M_PCI_awburst;
  output [3:0]M_PCI_awcache;
  output [3:0]M_PCI_awid;
  output [7:0]M_PCI_awlen;
  output M_PCI_awlock;
  output [2:0]M_PCI_awprot;
  output [3:0]M_PCI_awqos;
  input M_PCI_awready;
  output [2:0]M_PCI_awsize;
  output M_PCI_awvalid;
  input [3:0]M_PCI_bid;
  output M_PCI_bready;
  input [1:0]M_PCI_bresp;
  input M_PCI_bvalid;
  input [511:0]M_PCI_rdata;
  input [3:0]M_PCI_rid;
  input M_PCI_rlast;
  output M_PCI_rready;
  input [1:0]M_PCI_rresp;
  input M_PCI_rvalid;
  output [511:0]M_PCI_wdata;
  output M_PCI_wlast;
  input M_PCI_wready;
  output [63:0]M_PCI_wstrb;
  output M_PCI_wvalid;
  input [7:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [7:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;
  input clk;
  input glb_pre_sw;
  input liq_sw;
  input [511:0]md_in_tdata;
  output md_in_tready;
  input md_in_tvalid;
  input pre0;
  input pre256;
  input refn_sw;
  input refp_sw;
  input resetn;
  input row_tick_stb;
  input rs0;
  input rs256;
  input spi_csld;
  input spi_mosi0;
  input spi_mosi1;
  input spi_sck;
  input [15:0]tick_count;
  input vprebot_sw;
  input vpretop_sw;

  wire [63:0]M_PCI_araddr;
  wire [1:0]M_PCI_arburst;
  wire [3:0]M_PCI_arcache;
  wire [3:0]M_PCI_arid;
  wire [7:0]M_PCI_arlen;
  wire M_PCI_arlock;
  wire [2:0]M_PCI_arprot;
  wire [3:0]M_PCI_arqos;
  wire M_PCI_arready;
  wire [2:0]M_PCI_arsize;
  wire M_PCI_arvalid;
  wire [63:0]M_PCI_awaddr;
  wire [1:0]M_PCI_awburst;
  wire [3:0]M_PCI_awcache;
  wire [3:0]M_PCI_awid;
  wire [7:0]M_PCI_awlen;
  wire M_PCI_awlock;
  wire [2:0]M_PCI_awprot;
  wire [3:0]M_PCI_awqos;
  wire M_PCI_awready;
  wire [2:0]M_PCI_awsize;
  wire M_PCI_awvalid;
  wire [3:0]M_PCI_bid;
  wire M_PCI_bready;
  wire [1:0]M_PCI_bresp;
  wire M_PCI_bvalid;
  wire [511:0]M_PCI_rdata;
  wire [3:0]M_PCI_rid;
  wire M_PCI_rlast;
  wire M_PCI_rready;
  wire [1:0]M_PCI_rresp;
  wire M_PCI_rvalid;
  wire [511:0]M_PCI_wdata;
  wire M_PCI_wlast;
  wire M_PCI_wready;
  wire [63:0]M_PCI_wstrb;
  wire M_PCI_wvalid;
  wire [7:0]S_AXI_araddr;
  wire [2:0]S_AXI_arprot;
  wire S_AXI_arready;
  wire S_AXI_arvalid;
  wire [7:0]S_AXI_awaddr;
  wire [2:0]S_AXI_awprot;
  wire S_AXI_awready;
  wire S_AXI_awvalid;
  wire S_AXI_bready;
  wire [1:0]S_AXI_bresp;
  wire S_AXI_bvalid;
  wire [31:0]S_AXI_rdata;
  wire S_AXI_rready;
  wire [1:0]S_AXI_rresp;
  wire S_AXI_rvalid;
  wire [31:0]S_AXI_wdata;
  wire S_AXI_wready;
  wire [3:0]S_AXI_wstrb;
  wire S_AXI_wvalid;
  wire clk_1;
  wire glb_pre_sw;
  wire liq_sw;
  wire [511:0]md_in_tdata;
  wire md_in_tready;
  wire md_in_tvalid;
  wire pre0;
  wire pre256;
  wire refn_sw;
  wire refp_sw;
  wire resetn;
  wire row_tick_stb;
  wire rs0;
  wire rs256;
  wire spi_csld_1;
  wire spi_mosi0_1;
  wire spi_mosi1_1;
  wire spi_sck_1;
  wire [15:0]tick_count;
  wire [63:0]uw_recorder_ctl_host_buff_addr;
  wire [63:0]uw_recorder_ctl_host_buff_size;
  wire [511:0]uw_recorder_s1_0_axis_out_TDATA;
  wire uw_recorder_s1_0_axis_out_TREADY;
  wire uw_recorder_s1_0_axis_out_TVALID;
  wire [15:0]uw_recorder_s1_0_fifo_entries;
  wire uw_recorder_s1_0_recording;
  wire [127:0]uw_sim_ltc2656_0_dac_output;
  wire [127:0]uw_sim_ltc2656_1_dac_output;
  wire vprebot_sw;
  wire vpretop_sw;

  assign clk_1 = clk;
  assign spi_csld_1 = spi_csld;
  assign spi_mosi0_1 = spi_mosi0;
  assign spi_mosi1_1 = spi_mosi1;
  assign spi_sck_1 = spi_sck;
  top_level_system_ila_0_0 system_ila_0
       (.clk(clk_1),
        .probe0(uw_sim_ltc2656_0_dac_output),
        .probe1(uw_sim_ltc2656_1_dac_output),
        .probe2(spi_csld_1),
        .probe3(spi_sck_1),
        .probe4(spi_mosi0_1),
        .probe5(spi_mosi1_1));
  top_level_uw_recorder_ctl_0_1 uw_recorder_ctl
       (.S_AXI_ARADDR(S_AXI_araddr),
        .S_AXI_ARPROT(S_AXI_arprot),
        .S_AXI_ARREADY(S_AXI_arready),
        .S_AXI_ARVALID(S_AXI_arvalid),
        .S_AXI_AWADDR(S_AXI_awaddr),
        .S_AXI_AWPROT(S_AXI_awprot),
        .S_AXI_AWREADY(S_AXI_awready),
        .S_AXI_AWVALID(S_AXI_awvalid),
        .S_AXI_BREADY(S_AXI_bready),
        .S_AXI_BRESP(S_AXI_bresp),
        .S_AXI_BVALID(S_AXI_bvalid),
        .S_AXI_RDATA(S_AXI_rdata),
        .S_AXI_RREADY(S_AXI_rready),
        .S_AXI_RRESP(S_AXI_rresp),
        .S_AXI_RVALID(S_AXI_rvalid),
        .S_AXI_WDATA(S_AXI_wdata),
        .S_AXI_WREADY(S_AXI_wready),
        .S_AXI_WSTRB(S_AXI_wstrb),
        .S_AXI_WVALID(S_AXI_wvalid),
        .clk(clk_1),
        .host_buff_addr(uw_recorder_ctl_host_buff_addr),
        .host_buff_size(uw_recorder_ctl_host_buff_size),
        .md_in_tdata(md_in_tdata),
        .md_in_tready(md_in_tready),
        .md_in_tvalid(md_in_tvalid),
        .resetn(resetn));
  top_level_uw_recorder_s1_0_0 uw_recorder_in
       (.axis_out_tdata(uw_recorder_s1_0_axis_out_TDATA),
        .axis_out_tready(uw_recorder_s1_0_axis_out_TREADY),
        .axis_out_tvalid(uw_recorder_s1_0_axis_out_TVALID),
        .clk(clk_1),
        .fifo_entries(uw_recorder_s1_0_fifo_entries),
        .glb_pre_sw(glb_pre_sw),
        .host_buff_size(uw_recorder_ctl_host_buff_size),
        .liq_sw(liq_sw),
        .pre0(pre0),
        .pre256(pre256),
        .raw_tick_stb(row_tick_stb),
        .recording(uw_recorder_s1_0_recording),
        .refn_sw(refn_sw),
        .refp_sw(refp_sw),
        .resetn(resetn),
        .rs0(rs0),
        .rs256(rs256),
        .sim_dac_values_0(uw_sim_ltc2656_0_dac_output),
        .sim_dac_values_1(uw_sim_ltc2656_1_dac_output),
        .tick_count(tick_count),
        .vprebot_sw(vprebot_sw),
        .vpretop_sw(vpretop_sw));
  top_level_uw_recorder_s2_0_0 uw_recorder_out
       (.M_AXI_ARADDR(M_PCI_araddr),
        .M_AXI_ARBURST(M_PCI_arburst),
        .M_AXI_ARCACHE(M_PCI_arcache),
        .M_AXI_ARID(M_PCI_arid),
        .M_AXI_ARLEN(M_PCI_arlen),
        .M_AXI_ARLOCK(M_PCI_arlock),
        .M_AXI_ARPROT(M_PCI_arprot),
        .M_AXI_ARQOS(M_PCI_arqos),
        .M_AXI_ARREADY(M_PCI_arready),
        .M_AXI_ARSIZE(M_PCI_arsize),
        .M_AXI_ARVALID(M_PCI_arvalid),
        .M_AXI_AWADDR(M_PCI_awaddr),
        .M_AXI_AWBURST(M_PCI_awburst),
        .M_AXI_AWCACHE(M_PCI_awcache),
        .M_AXI_AWID(M_PCI_awid),
        .M_AXI_AWLEN(M_PCI_awlen),
        .M_AXI_AWLOCK(M_PCI_awlock),
        .M_AXI_AWPROT(M_PCI_awprot),
        .M_AXI_AWQOS(M_PCI_awqos),
        .M_AXI_AWREADY(M_PCI_awready),
        .M_AXI_AWSIZE(M_PCI_awsize),
        .M_AXI_AWVALID(M_PCI_awvalid),
        .M_AXI_BID(M_PCI_bid),
        .M_AXI_BREADY(M_PCI_bready),
        .M_AXI_BRESP(M_PCI_bresp),
        .M_AXI_BVALID(M_PCI_bvalid),
        .M_AXI_RDATA(M_PCI_rdata),
        .M_AXI_RID(M_PCI_rid),
        .M_AXI_RLAST(M_PCI_rlast),
        .M_AXI_RREADY(M_PCI_rready),
        .M_AXI_RRESP(M_PCI_rresp),
        .M_AXI_RVALID(M_PCI_rvalid),
        .M_AXI_WDATA(M_PCI_wdata),
        .M_AXI_WLAST(M_PCI_wlast),
        .M_AXI_WREADY(M_PCI_wready),
        .M_AXI_WSTRB(M_PCI_wstrb),
        .M_AXI_WVALID(M_PCI_wvalid),
        .axis_in_tdata(uw_recorder_s1_0_axis_out_TDATA),
        .axis_in_tready(uw_recorder_s1_0_axis_out_TREADY),
        .axis_in_tvalid(uw_recorder_s1_0_axis_out_TVALID),
        .clk(clk_1),
        .fifo_entries(uw_recorder_s1_0_fifo_entries),
        .host_buff_addr(uw_recorder_ctl_host_buff_addr),
        .recording(uw_recorder_s1_0_recording),
        .resetn(resetn));
  top_level_uw_sim_ltc2656_0_0 uw_sim_ltc2656_0
       (.clk(clk_1),
        .dac_output(uw_sim_ltc2656_0_dac_output),
        .resetn(resetn),
        .spi_csld(spi_csld_1),
        .spi_mosi(spi_mosi0_1),
        .spi_sck(spi_sck_1));
  top_level_uw_sim_ltc2656_0_1 uw_sim_ltc2656_1
       (.clk(clk_1),
        .dac_output(uw_sim_ltc2656_1_dac_output),
        .resetn(resetn),
        .spi_csld(spi_csld_1),
        .spi_mosi(spi_mosi1_1),
        .spi_sck(spi_sck_1));
endmodule
