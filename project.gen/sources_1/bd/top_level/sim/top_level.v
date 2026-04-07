//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
//Date        : Mon Apr  6 21:45:43 2026
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
  output M_AXI_B_araddr;
  output [1:0]M_AXI_B_arburst;
  output [3:0]M_AXI_B_arcache;
  output M_AXI_B_arid;
  output M_AXI_B_arlen;
  output M_AXI_B_arlock;
  output [2:0]M_AXI_B_arprot;
  input [0:0]M_AXI_B_arready;
  output [2:0]M_AXI_B_arsize;
  output [0:0]M_AXI_B_arvalid;
  output M_AXI_B_awaddr;
  output [1:0]M_AXI_B_awburst;
  output [3:0]M_AXI_B_awcache;
  output M_AXI_B_awid;
  output M_AXI_B_awlen;
  output M_AXI_B_awlock;
  output [2:0]M_AXI_B_awprot;
  input [0:0]M_AXI_B_awready;
  output [2:0]M_AXI_B_awsize;
  output [0:0]M_AXI_B_awvalid;
  input M_AXI_B_bid;
  output [0:0]M_AXI_B_bready;
  input [1:0]M_AXI_B_bresp;
  input [0:0]M_AXI_B_bvalid;
  input M_AXI_B_rdata;
  input M_AXI_B_rid;
  input [0:0]M_AXI_B_rlast;
  output [0:0]M_AXI_B_rready;
  input [1:0]M_AXI_B_rresp;
  input [0:0]M_AXI_B_rvalid;
  output M_AXI_B_wdata;
  output [0:0]M_AXI_B_wlast;
  input [0:0]M_AXI_B_wready;
  output M_AXI_B_wstrb;
  output [0:0]M_AXI_B_wvalid;
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
  output [0:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [0:0]S00_AXI_rdata;
  output [0:0]S00_AXI_rid;
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
  output [0:0]S01_AXI_bid;
  input S01_AXI_bready;
  output [1:0]S01_AXI_bresp;
  output S01_AXI_bvalid;
  output [0:0]S01_AXI_rdata;
  output [0:0]S01_AXI_rid;
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
  output [0:0]S02_AXI_bid;
  input S02_AXI_bready;
  output [1:0]S02_AXI_bresp;
  output S02_AXI_bvalid;
  output [0:0]S02_AXI_rdata;
  output [0:0]S02_AXI_rid;
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

  wire [63:0]\^M_AXI_B_araddr ;
  wire [1:0]M_AXI_B_arburst;
  wire [3:0]M_AXI_B_arcache;
  wire [3:0]\^M_AXI_B_arid ;
  wire [7:0]\^M_AXI_B_arlen ;
  wire M_AXI_B_arlock;
  wire [2:0]M_AXI_B_arprot;
  wire [0:0]M_AXI_B_arready;
  wire [2:0]M_AXI_B_arsize;
  wire \^M_AXI_B_arvalid ;
  wire [63:0]\^M_AXI_B_awaddr ;
  wire [1:0]M_AXI_B_awburst;
  wire [3:0]M_AXI_B_awcache;
  wire [3:0]\^M_AXI_B_awid ;
  wire [7:0]\^M_AXI_B_awlen ;
  wire M_AXI_B_awlock;
  wire [2:0]M_AXI_B_awprot;
  wire [0:0]M_AXI_B_awready;
  wire [2:0]M_AXI_B_awsize;
  wire \^M_AXI_B_awvalid ;
  wire M_AXI_B_bid;
  wire \^M_AXI_B_bready ;
  wire [1:0]M_AXI_B_bresp;
  wire [0:0]M_AXI_B_bvalid;
  wire M_AXI_B_rdata;
  wire M_AXI_B_rid;
  wire [0:0]M_AXI_B_rlast;
  wire \^M_AXI_B_rready ;
  wire [1:0]M_AXI_B_rresp;
  wire [0:0]M_AXI_B_rvalid;
  wire [511:0]\^M_AXI_B_wdata ;
  wire \^M_AXI_B_wlast ;
  wire [0:0]M_AXI_B_wready;
  wire [63:0]\^M_AXI_B_wstrb ;
  wire \^M_AXI_B_wvalid ;
  wire [63:0]S00_AXI_araddr;
  wire [1:0]S00_AXI_arburst;
  wire [3:0]S00_AXI_arcache;
  wire [1:0]S00_AXI_arid;
  wire [7:0]S00_AXI_arlen;
  wire S00_AXI_arlock;
  wire [2:0]S00_AXI_arprot;
  wire [3:0]S00_AXI_arqos;
  wire [0:0]\^S00_AXI_arready ;
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
  wire [0:0]\^S00_AXI_awready ;
  wire [2:0]S00_AXI_awsize;
  wire S00_AXI_awvalid;
  wire \^S00_AXI_bid ;
  wire S00_AXI_bready;
  wire [1:0]S00_AXI_bresp;
  wire [0:0]\^S00_AXI_bvalid ;
  wire \^S00_AXI_rdata ;
  wire \^S00_AXI_rid ;
  wire [0:0]\^S00_AXI_rlast ;
  wire S00_AXI_rready;
  wire [1:0]S00_AXI_rresp;
  wire [0:0]\^S00_AXI_rvalid ;
  wire [511:0]S00_AXI_wdata;
  wire S00_AXI_wlast;
  wire [0:0]\^S00_AXI_wready ;
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
  wire [0:0]\^S01_AXI_arready ;
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
  wire [0:0]\^S01_AXI_awready ;
  wire [2:0]S01_AXI_awsize;
  wire S01_AXI_awvalid;
  wire \^S01_AXI_bid ;
  wire S01_AXI_bready;
  wire [1:0]S01_AXI_bresp;
  wire [0:0]\^S01_AXI_bvalid ;
  wire \^S01_AXI_rdata ;
  wire \^S01_AXI_rid ;
  wire [0:0]\^S01_AXI_rlast ;
  wire S01_AXI_rready;
  wire [1:0]S01_AXI_rresp;
  wire [0:0]\^S01_AXI_rvalid ;
  wire [511:0]S01_AXI_wdata;
  wire S01_AXI_wlast;
  wire [0:0]\^S01_AXI_wready ;
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
  wire [0:0]\^S02_AXI_arready ;
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
  wire [0:0]\^S02_AXI_awready ;
  wire [2:0]S02_AXI_awsize;
  wire S02_AXI_awvalid;
  wire \^S02_AXI_bid ;
  wire S02_AXI_bready;
  wire [1:0]S02_AXI_bresp;
  wire [0:0]\^S02_AXI_bvalid ;
  wire \^S02_AXI_rdata ;
  wire \^S02_AXI_rid ;
  wire [0:0]\^S02_AXI_rlast ;
  wire S02_AXI_rready;
  wire [1:0]S02_AXI_rresp;
  wire [0:0]\^S02_AXI_rvalid ;
  wire [511:0]S02_AXI_wdata;
  wire S02_AXI_wlast;
  wire [0:0]\^S02_AXI_wready ;
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
  wire smartconnect_0_M00_AXI_ARADDR;
  wire [1:0]smartconnect_0_M00_AXI_ARBURST;
  wire smartconnect_0_M00_AXI_ARID;
  wire smartconnect_0_M00_AXI_ARLEN;
  wire smartconnect_0_M00_AXI_ARREADY;
  wire [3:0]smartconnect_0_M00_AXI_ARREGION;
  wire [2:0]smartconnect_0_M00_AXI_ARSIZE;
  wire [0:0]smartconnect_0_M00_AXI_ARVALID;
  wire smartconnect_0_M00_AXI_AWADDR;
  wire [1:0]smartconnect_0_M00_AXI_AWBURST;
  wire smartconnect_0_M00_AXI_AWID;
  wire smartconnect_0_M00_AXI_AWLEN;
  wire smartconnect_0_M00_AXI_AWREADY;
  wire [3:0]smartconnect_0_M00_AXI_AWREGION;
  wire [2:0]smartconnect_0_M00_AXI_AWSIZE;
  wire [0:0]smartconnect_0_M00_AXI_AWVALID;
  wire [1:0]smartconnect_0_M00_AXI_BID;
  wire [0:0]smartconnect_0_M00_AXI_BREADY;
  wire [1:0]smartconnect_0_M00_AXI_BRESP;
  wire smartconnect_0_M00_AXI_BVALID;
  wire [511:0]smartconnect_0_M00_AXI_RDATA;
  wire [1:0]smartconnect_0_M00_AXI_RID;
  wire smartconnect_0_M00_AXI_RLAST;
  wire [0:0]smartconnect_0_M00_AXI_RREADY;
  wire [1:0]smartconnect_0_M00_AXI_RRESP;
  wire smartconnect_0_M00_AXI_RVALID;
  wire smartconnect_0_M00_AXI_WDATA;
  wire [0:0]smartconnect_0_M00_AXI_WLAST;
  wire smartconnect_0_M00_AXI_WREADY;
  wire smartconnect_0_M00_AXI_WSTRB;
  wire [0:0]smartconnect_0_M00_AXI_WVALID;

  assign M_AXI_B_araddr = \^M_AXI_B_araddr [0];
  assign M_AXI_B_arid = \^M_AXI_B_arid [0];
  assign M_AXI_B_arlen = \^M_AXI_B_arlen [0];
  assign M_AXI_B_arvalid[0] = \^M_AXI_B_arvalid ;
  assign M_AXI_B_awaddr = \^M_AXI_B_awaddr [0];
  assign M_AXI_B_awid = \^M_AXI_B_awid [0];
  assign M_AXI_B_awlen = \^M_AXI_B_awlen [0];
  assign M_AXI_B_awvalid[0] = \^M_AXI_B_awvalid ;
  assign M_AXI_B_bready[0] = \^M_AXI_B_bready ;
  assign M_AXI_B_rready[0] = \^M_AXI_B_rready ;
  assign M_AXI_B_wdata = \^M_AXI_B_wdata [0];
  assign M_AXI_B_wlast[0] = \^M_AXI_B_wlast ;
  assign M_AXI_B_wstrb = \^M_AXI_B_wstrb [0];
  assign M_AXI_B_wvalid[0] = \^M_AXI_B_wvalid ;
  assign S00_AXI_arready = \^S00_AXI_arready [0];
  assign S00_AXI_awready = \^S00_AXI_awready [0];
  assign S00_AXI_bid[0] = \^S00_AXI_bid ;
  assign S00_AXI_bvalid = \^S00_AXI_bvalid [0];
  assign S00_AXI_rdata[0] = \^S00_AXI_rdata ;
  assign S00_AXI_rid[0] = \^S00_AXI_rid ;
  assign S00_AXI_rlast = \^S00_AXI_rlast [0];
  assign S00_AXI_rvalid = \^S00_AXI_rvalid [0];
  assign S00_AXI_wready = \^S00_AXI_wready [0];
  assign S01_AXI_arready = \^S01_AXI_arready [0];
  assign S01_AXI_awready = \^S01_AXI_awready [0];
  assign S01_AXI_bid[0] = \^S01_AXI_bid ;
  assign S01_AXI_bvalid = \^S01_AXI_bvalid [0];
  assign S01_AXI_rdata[0] = \^S01_AXI_rdata ;
  assign S01_AXI_rid[0] = \^S01_AXI_rid ;
  assign S01_AXI_rlast = \^S01_AXI_rlast [0];
  assign S01_AXI_rvalid = \^S01_AXI_rvalid [0];
  assign S01_AXI_wready = \^S01_AXI_wready [0];
  assign S02_AXI_arready = \^S02_AXI_arready [0];
  assign S02_AXI_awready = \^S02_AXI_awready [0];
  assign S02_AXI_bid[0] = \^S02_AXI_bid ;
  assign S02_AXI_bvalid = \^S02_AXI_bvalid [0];
  assign S02_AXI_rdata[0] = \^S02_AXI_rdata ;
  assign S02_AXI_rid[0] = \^S02_AXI_rid ;
  assign S02_AXI_rlast = \^S02_AXI_rlast [0];
  assign S02_AXI_rvalid = \^S02_AXI_rvalid [0];
  assign S02_AXI_wready = \^S02_AXI_wready [0];
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
        .m_axib_araddr(\^M_AXI_B_araddr ),
        .m_axib_arburst(M_AXI_B_arburst),
        .m_axib_arcache(M_AXI_B_arcache),
        .m_axib_arid(\^M_AXI_B_arid ),
        .m_axib_arlen(\^M_AXI_B_arlen ),
        .m_axib_arlock(M_AXI_B_arlock),
        .m_axib_arprot(M_AXI_B_arprot),
        .m_axib_arready(M_AXI_B_arready),
        .m_axib_arsize(M_AXI_B_arsize),
        .m_axib_arvalid(\^M_AXI_B_arvalid ),
        .m_axib_awaddr(\^M_AXI_B_awaddr ),
        .m_axib_awburst(M_AXI_B_awburst),
        .m_axib_awcache(M_AXI_B_awcache),
        .m_axib_awid(\^M_AXI_B_awid ),
        .m_axib_awlen(\^M_AXI_B_awlen ),
        .m_axib_awlock(M_AXI_B_awlock),
        .m_axib_awprot(M_AXI_B_awprot),
        .m_axib_awready(M_AXI_B_awready),
        .m_axib_awsize(M_AXI_B_awsize),
        .m_axib_awvalid(\^M_AXI_B_awvalid ),
        .m_axib_bid({M_AXI_B_bid,M_AXI_B_bid,M_AXI_B_bid,M_AXI_B_bid}),
        .m_axib_bready(\^M_AXI_B_bready ),
        .m_axib_bresp(M_AXI_B_bresp),
        .m_axib_bvalid(M_AXI_B_bvalid),
        .m_axib_rdata({M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata,M_AXI_B_rdata}),
        .m_axib_rid({M_AXI_B_rid,M_AXI_B_rid,M_AXI_B_rid,M_AXI_B_rid}),
        .m_axib_rlast(M_AXI_B_rlast),
        .m_axib_rready(\^M_AXI_B_rready ),
        .m_axib_rresp(M_AXI_B_rresp),
        .m_axib_rvalid(M_AXI_B_rvalid),
        .m_axib_wdata(\^M_AXI_B_wdata ),
        .m_axib_wlast(\^M_AXI_B_wlast ),
        .m_axib_wready(M_AXI_B_wready),
        .m_axib_wstrb(\^M_AXI_B_wstrb ),
        .m_axib_wvalid(\^M_AXI_B_wvalid ),
        .pci_exp_rxn(pcie_mgt_rxn),
        .pci_exp_rxp(pcie_mgt_rxp),
        .pci_exp_txn(pcie_mgt_txn),
        .pci_exp_txp(pcie_mgt_txp),
        .s_axib_araddr({smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR,smartconnect_0_M00_AXI_ARADDR}),
        .s_axib_arburst(smartconnect_0_M00_AXI_ARBURST),
        .s_axib_arid({smartconnect_0_M00_AXI_ARID,smartconnect_0_M00_AXI_ARID}),
        .s_axib_arlen({smartconnect_0_M00_AXI_ARLEN,smartconnect_0_M00_AXI_ARLEN,smartconnect_0_M00_AXI_ARLEN,smartconnect_0_M00_AXI_ARLEN,smartconnect_0_M00_AXI_ARLEN,smartconnect_0_M00_AXI_ARLEN,smartconnect_0_M00_AXI_ARLEN,smartconnect_0_M00_AXI_ARLEN}),
        .s_axib_arready(smartconnect_0_M00_AXI_ARREADY),
        .s_axib_arregion(smartconnect_0_M00_AXI_ARREGION),
        .s_axib_arsize(smartconnect_0_M00_AXI_ARSIZE),
        .s_axib_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .s_axib_awaddr({smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR,smartconnect_0_M00_AXI_AWADDR}),
        .s_axib_awburst(smartconnect_0_M00_AXI_AWBURST),
        .s_axib_awid({smartconnect_0_M00_AXI_AWID,smartconnect_0_M00_AXI_AWID}),
        .s_axib_awlen({smartconnect_0_M00_AXI_AWLEN,smartconnect_0_M00_AXI_AWLEN,smartconnect_0_M00_AXI_AWLEN,smartconnect_0_M00_AXI_AWLEN,smartconnect_0_M00_AXI_AWLEN,smartconnect_0_M00_AXI_AWLEN,smartconnect_0_M00_AXI_AWLEN,smartconnect_0_M00_AXI_AWLEN}),
        .s_axib_awready(smartconnect_0_M00_AXI_AWREADY),
        .s_axib_awregion(smartconnect_0_M00_AXI_AWREGION),
        .s_axib_awsize(smartconnect_0_M00_AXI_AWSIZE),
        .s_axib_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .s_axib_bid(smartconnect_0_M00_AXI_BID),
        .s_axib_bready(smartconnect_0_M00_AXI_BREADY),
        .s_axib_bresp(smartconnect_0_M00_AXI_BRESP),
        .s_axib_bvalid(smartconnect_0_M00_AXI_BVALID),
        .s_axib_rdata(smartconnect_0_M00_AXI_RDATA),
        .s_axib_rid(smartconnect_0_M00_AXI_RID),
        .s_axib_rlast(smartconnect_0_M00_AXI_RLAST),
        .s_axib_rready(smartconnect_0_M00_AXI_RREADY),
        .s_axib_rresp(smartconnect_0_M00_AXI_RRESP),
        .s_axib_rvalid(smartconnect_0_M00_AXI_RVALID),
        .s_axib_wdata({smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA,smartconnect_0_M00_AXI_WDATA}),
        .s_axib_wlast(smartconnect_0_M00_AXI_WLAST),
        .s_axib_wready(smartconnect_0_M00_AXI_WREADY),
        .s_axib_wstrb({smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB,smartconnect_0_M00_AXI_WSTRB}),
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
        .M00_AXI_arid(smartconnect_0_M00_AXI_ARID),
        .M00_AXI_arlen(smartconnect_0_M00_AXI_ARLEN),
        .M00_AXI_arready(smartconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arregion(smartconnect_0_M00_AXI_ARREGION),
        .M00_AXI_arsize(smartconnect_0_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awburst(smartconnect_0_M00_AXI_AWBURST),
        .M00_AXI_awid(smartconnect_0_M00_AXI_AWID),
        .M00_AXI_awlen(smartconnect_0_M00_AXI_AWLEN),
        .M00_AXI_awready(smartconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awregion(smartconnect_0_M00_AXI_AWREGION),
        .M00_AXI_awsize(smartconnect_0_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bid(smartconnect_0_M00_AXI_BID[0]),
        .M00_AXI_bready(smartconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_0_M00_AXI_BRESP),
        .M00_AXI_buser(1'b0),
        .M00_AXI_bvalid(smartconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_0_M00_AXI_RDATA[0]),
        .M00_AXI_rid(smartconnect_0_M00_AXI_RID[0]),
        .M00_AXI_rlast(smartconnect_0_M00_AXI_RLAST),
        .M00_AXI_rready(smartconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_0_M00_AXI_RRESP),
        .M00_AXI_ruser(1'b0),
        .M00_AXI_rvalid(smartconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_0_M00_AXI_WDATA),
        .M00_AXI_wlast(smartconnect_0_M00_AXI_WLAST),
        .M00_AXI_wready(smartconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_0_M00_AXI_WVALID),
        .S00_AXI_araddr(S00_AXI_araddr[0]),
        .S00_AXI_arburst(S00_AXI_arburst),
        .S00_AXI_arcache(S00_AXI_arcache),
        .S00_AXI_arid(S00_AXI_arid[0]),
        .S00_AXI_arlen(S00_AXI_arlen[0]),
        .S00_AXI_arlock(S00_AXI_arlock),
        .S00_AXI_arprot(S00_AXI_arprot),
        .S00_AXI_arqos(S00_AXI_arqos),
        .S00_AXI_arready(\^S00_AXI_arready ),
        .S00_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_arsize(S00_AXI_arsize),
        .S00_AXI_aruser(1'b0),
        .S00_AXI_arvalid(S00_AXI_arvalid),
        .S00_AXI_awaddr(S00_AXI_awaddr[0]),
        .S00_AXI_awburst(S00_AXI_awburst),
        .S00_AXI_awcache(S00_AXI_awcache),
        .S00_AXI_awid(S00_AXI_awid[0]),
        .S00_AXI_awlen(S00_AXI_awlen[0]),
        .S00_AXI_awlock(S00_AXI_awlock),
        .S00_AXI_awprot(S00_AXI_awprot),
        .S00_AXI_awqos(S00_AXI_awqos),
        .S00_AXI_awready(\^S00_AXI_awready ),
        .S00_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_awsize(S00_AXI_awsize),
        .S00_AXI_awuser(1'b0),
        .S00_AXI_awvalid(S00_AXI_awvalid),
        .S00_AXI_bid(\^S00_AXI_bid ),
        .S00_AXI_bready(S00_AXI_bready),
        .S00_AXI_bresp(S00_AXI_bresp),
        .S00_AXI_bvalid(\^S00_AXI_bvalid ),
        .S00_AXI_rdata(\^S00_AXI_rdata ),
        .S00_AXI_rid(\^S00_AXI_rid ),
        .S00_AXI_rlast(\^S00_AXI_rlast ),
        .S00_AXI_rready(S00_AXI_rready),
        .S00_AXI_rresp(S00_AXI_rresp),
        .S00_AXI_rvalid(\^S00_AXI_rvalid ),
        .S00_AXI_wdata(S00_AXI_wdata[0]),
        .S00_AXI_wid(1'b0),
        .S00_AXI_wlast(S00_AXI_wlast),
        .S00_AXI_wready(\^S00_AXI_wready ),
        .S00_AXI_wstrb(S00_AXI_wstrb[0]),
        .S00_AXI_wuser(1'b0),
        .S00_AXI_wvalid(S00_AXI_wvalid),
        .S01_AXI_araddr(S01_AXI_araddr[0]),
        .S01_AXI_arburst(S01_AXI_arburst),
        .S01_AXI_arcache(S01_AXI_arcache),
        .S01_AXI_arid(S01_AXI_arid[0]),
        .S01_AXI_arlen(S01_AXI_arlen[0]),
        .S01_AXI_arlock(S01_AXI_arlock),
        .S01_AXI_arprot(S01_AXI_arprot),
        .S01_AXI_arqos(S01_AXI_arqos),
        .S01_AXI_arready(\^S01_AXI_arready ),
        .S01_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_arsize(S01_AXI_arsize),
        .S01_AXI_aruser(1'b0),
        .S01_AXI_arvalid(S01_AXI_arvalid),
        .S01_AXI_awaddr(S01_AXI_awaddr[0]),
        .S01_AXI_awburst(S01_AXI_awburst),
        .S01_AXI_awcache(S01_AXI_awcache),
        .S01_AXI_awid(S01_AXI_awid[0]),
        .S01_AXI_awlen(S01_AXI_awlen[0]),
        .S01_AXI_awlock(S01_AXI_awlock),
        .S01_AXI_awprot(S01_AXI_awprot),
        .S01_AXI_awqos(S01_AXI_awqos),
        .S01_AXI_awready(\^S01_AXI_awready ),
        .S01_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_awsize(S01_AXI_awsize),
        .S01_AXI_awuser(1'b0),
        .S01_AXI_awvalid(S01_AXI_awvalid),
        .S01_AXI_bid(\^S01_AXI_bid ),
        .S01_AXI_bready(S01_AXI_bready),
        .S01_AXI_bresp(S01_AXI_bresp),
        .S01_AXI_bvalid(\^S01_AXI_bvalid ),
        .S01_AXI_rdata(\^S01_AXI_rdata ),
        .S01_AXI_rid(\^S01_AXI_rid ),
        .S01_AXI_rlast(\^S01_AXI_rlast ),
        .S01_AXI_rready(S01_AXI_rready),
        .S01_AXI_rresp(S01_AXI_rresp),
        .S01_AXI_rvalid(\^S01_AXI_rvalid ),
        .S01_AXI_wdata(S01_AXI_wdata[0]),
        .S01_AXI_wid(1'b0),
        .S01_AXI_wlast(S01_AXI_wlast),
        .S01_AXI_wready(\^S01_AXI_wready ),
        .S01_AXI_wstrb(S01_AXI_wstrb[0]),
        .S01_AXI_wuser(1'b0),
        .S01_AXI_wvalid(S01_AXI_wvalid),
        .S02_AXI_araddr(S02_AXI_araddr[0]),
        .S02_AXI_arburst(S02_AXI_arburst),
        .S02_AXI_arcache(S02_AXI_arcache),
        .S02_AXI_arid(S02_AXI_arid[0]),
        .S02_AXI_arlen(S02_AXI_arlen[0]),
        .S02_AXI_arlock(S02_AXI_arlock),
        .S02_AXI_arprot(S02_AXI_arprot),
        .S02_AXI_arqos(S02_AXI_arqos),
        .S02_AXI_arready(\^S02_AXI_arready ),
        .S02_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S02_AXI_arsize(S02_AXI_arsize),
        .S02_AXI_aruser(1'b0),
        .S02_AXI_arvalid(S02_AXI_arvalid),
        .S02_AXI_awaddr(S02_AXI_awaddr[0]),
        .S02_AXI_awburst(S02_AXI_awburst),
        .S02_AXI_awcache(S02_AXI_awcache),
        .S02_AXI_awid(S02_AXI_awid[0]),
        .S02_AXI_awlen(S02_AXI_awlen[0]),
        .S02_AXI_awlock(S02_AXI_awlock),
        .S02_AXI_awprot(S02_AXI_awprot),
        .S02_AXI_awqos(S02_AXI_awqos),
        .S02_AXI_awready(\^S02_AXI_awready ),
        .S02_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S02_AXI_awsize(S02_AXI_awsize),
        .S02_AXI_awuser(1'b0),
        .S02_AXI_awvalid(S02_AXI_awvalid),
        .S02_AXI_bid(\^S02_AXI_bid ),
        .S02_AXI_bready(S02_AXI_bready),
        .S02_AXI_bresp(S02_AXI_bresp),
        .S02_AXI_bvalid(\^S02_AXI_bvalid ),
        .S02_AXI_rdata(\^S02_AXI_rdata ),
        .S02_AXI_rid(\^S02_AXI_rid ),
        .S02_AXI_rlast(\^S02_AXI_rlast ),
        .S02_AXI_rready(S02_AXI_rready),
        .S02_AXI_rresp(S02_AXI_rresp),
        .S02_AXI_rvalid(\^S02_AXI_rvalid ),
        .S02_AXI_wdata(S02_AXI_wdata[0]),
        .S02_AXI_wid(1'b0),
        .S02_AXI_wlast(S02_AXI_wlast),
        .S02_AXI_wready(\^S02_AXI_wready ),
        .S02_AXI_wstrb(S02_AXI_wstrb[0]),
        .S02_AXI_wuser(1'b0),
        .S02_AXI_wvalid(S02_AXI_wvalid),
        .aclk(axi_aclk),
        .aresetn(axi_aresetn));
endmodule

(* CORE_GENERATION_INFO = "top_level,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=top_level,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=22,numReposBlks=19,numNonXlnxBlks=0,numHierBlks=3,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=13,numPkgbdBlks=0,bdsource=USER,\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"da_axi4_cnt\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"=4,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "top_level.hwdef" *) 
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
  wire [0:0]hier_0_M_AXI_BID;
  wire hier_0_M_AXI_BREADY;
  wire [1:0]hier_0_M_AXI_BRESP;
  wire hier_0_M_AXI_BVALID;
  wire [0:0]hier_0_M_AXI_RDATA;
  wire [0:0]hier_0_M_AXI_RID;
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
  wire smartconnect_M00_AXI_ARADDR;
  wire [2:0]smartconnect_M00_AXI_ARPROT;
  wire smartconnect_M00_AXI_ARREADY;
  wire [0:0]smartconnect_M00_AXI_ARVALID;
  wire smartconnect_M00_AXI_AWADDR;
  wire [2:0]smartconnect_M00_AXI_AWPROT;
  wire smartconnect_M00_AXI_AWREADY;
  wire [0:0]smartconnect_M00_AXI_AWVALID;
  wire [0:0]smartconnect_M00_AXI_BREADY;
  wire [1:0]smartconnect_M00_AXI_BRESP;
  wire smartconnect_M00_AXI_BVALID;
  wire [31:0]smartconnect_M00_AXI_RDATA;
  wire [0:0]smartconnect_M00_AXI_RREADY;
  wire [1:0]smartconnect_M00_AXI_RRESP;
  wire smartconnect_M00_AXI_RVALID;
  wire smartconnect_M00_AXI_WDATA;
  wire smartconnect_M00_AXI_WREADY;
  wire smartconnect_M00_AXI_WSTRB;
  wire [0:0]smartconnect_M00_AXI_WVALID;
  wire smartconnect_M01_AXI_ARADDR;
  wire [2:0]smartconnect_M01_AXI_ARPROT;
  wire smartconnect_M01_AXI_ARREADY;
  wire [0:0]smartconnect_M01_AXI_ARVALID;
  wire smartconnect_M01_AXI_AWADDR;
  wire [2:0]smartconnect_M01_AXI_AWPROT;
  wire smartconnect_M01_AXI_AWREADY;
  wire [0:0]smartconnect_M01_AXI_AWVALID;
  wire [0:0]smartconnect_M01_AXI_BREADY;
  wire [1:0]smartconnect_M01_AXI_BRESP;
  wire smartconnect_M01_AXI_BVALID;
  wire [31:0]smartconnect_M01_AXI_RDATA;
  wire [0:0]smartconnect_M01_AXI_RREADY;
  wire [1:0]smartconnect_M01_AXI_RRESP;
  wire smartconnect_M01_AXI_RVALID;
  wire smartconnect_M01_AXI_WDATA;
  wire smartconnect_M01_AXI_WREADY;
  wire smartconnect_M01_AXI_WSTRB;
  wire [0:0]smartconnect_M01_AXI_WVALID;
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
  wire [0:0]uw_engine_PCI_1_BID;
  wire uw_engine_PCI_1_BREADY;
  wire [1:0]uw_engine_PCI_1_BRESP;
  wire uw_engine_PCI_1_BVALID;
  wire [0:0]uw_engine_PCI_1_RDATA;
  wire [0:0]uw_engine_PCI_1_RID;
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
  wire [0:0]uwfetcher_0_M_AXI_BID;
  wire uwfetcher_0_M_AXI_BREADY;
  wire [1:0]uwfetcher_0_M_AXI_BRESP;
  wire uwfetcher_0_M_AXI_BVALID;
  wire [0:0]uwfetcher_0_M_AXI_RDATA;
  wire [0:0]uwfetcher_0_M_AXI_RID;
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
  wire xdma_0_M_AXI_B_ARADDR;
  wire [1:0]xdma_0_M_AXI_B_ARBURST;
  wire [3:0]xdma_0_M_AXI_B_ARCACHE;
  wire xdma_0_M_AXI_B_ARID;
  wire xdma_0_M_AXI_B_ARLEN;
  wire xdma_0_M_AXI_B_ARLOCK;
  wire [2:0]xdma_0_M_AXI_B_ARPROT;
  wire [0:0]xdma_0_M_AXI_B_ARREADY;
  wire [2:0]xdma_0_M_AXI_B_ARSIZE;
  wire [0:0]xdma_0_M_AXI_B_ARVALID;
  wire xdma_0_M_AXI_B_AWADDR;
  wire [1:0]xdma_0_M_AXI_B_AWBURST;
  wire [3:0]xdma_0_M_AXI_B_AWCACHE;
  wire xdma_0_M_AXI_B_AWID;
  wire xdma_0_M_AXI_B_AWLEN;
  wire xdma_0_M_AXI_B_AWLOCK;
  wire [2:0]xdma_0_M_AXI_B_AWPROT;
  wire [0:0]xdma_0_M_AXI_B_AWREADY;
  wire [2:0]xdma_0_M_AXI_B_AWSIZE;
  wire [0:0]xdma_0_M_AXI_B_AWVALID;
  wire xdma_0_M_AXI_B_BID;
  wire [0:0]xdma_0_M_AXI_B_BREADY;
  wire [1:0]xdma_0_M_AXI_B_BRESP;
  wire [0:0]xdma_0_M_AXI_B_BVALID;
  wire xdma_0_M_AXI_B_RDATA;
  wire xdma_0_M_AXI_B_RID;
  wire [0:0]xdma_0_M_AXI_B_RLAST;
  wire [0:0]xdma_0_M_AXI_B_RREADY;
  wire [1:0]xdma_0_M_AXI_B_RRESP;
  wire [0:0]xdma_0_M_AXI_B_RVALID;
  wire xdma_0_M_AXI_B_WDATA;
  wire [0:0]xdma_0_M_AXI_B_WLAST;
  wire [0:0]xdma_0_M_AXI_B_WREADY;
  wire xdma_0_M_AXI_B_WSTRB;
  wire [0:0]xdma_0_M_AXI_B_WVALID;

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
        .M00_AXI_bid(1'b0),
        .M00_AXI_bready(smartconnect_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_M00_AXI_BRESP),
        .M00_AXI_buser(1'b0),
        .M00_AXI_bvalid(smartconnect_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_M00_AXI_RDATA[0]),
        .M00_AXI_rid(1'b0),
        .M00_AXI_rlast(1'b0),
        .M00_AXI_rready(smartconnect_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_M00_AXI_RRESP),
        .M00_AXI_ruser(1'b0),
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
        .M01_AXI_bid(1'b0),
        .M01_AXI_bready(smartconnect_M01_AXI_BREADY),
        .M01_AXI_bresp(smartconnect_M01_AXI_BRESP),
        .M01_AXI_buser(1'b0),
        .M01_AXI_bvalid(smartconnect_M01_AXI_BVALID),
        .M01_AXI_rdata(smartconnect_M01_AXI_RDATA[0]),
        .M01_AXI_rid(1'b0),
        .M01_AXI_rlast(1'b0),
        .M01_AXI_rready(smartconnect_M01_AXI_RREADY),
        .M01_AXI_rresp(smartconnect_M01_AXI_RRESP),
        .M01_AXI_ruser(1'b0),
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
        .S00_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_arsize(xdma_0_M_AXI_B_ARSIZE),
        .S00_AXI_aruser(1'b0),
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
        .S00_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_awsize(xdma_0_M_AXI_B_AWSIZE),
        .S00_AXI_awuser(1'b0),
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
        .S00_AXI_wid(1'b0),
        .S00_AXI_wlast(xdma_0_M_AXI_B_WLAST),
        .S00_AXI_wready(xdma_0_M_AXI_B_WREADY),
        .S00_AXI_wstrb(xdma_0_M_AXI_B_WSTRB),
        .S00_AXI_wuser(1'b0),
        .S00_AXI_wvalid(xdma_0_M_AXI_B_WVALID),
        .aclk(source_200Mhz_clk),
        .aresetn(source_200Mhz_resetn));
  top_level_tick_src_0_0 tick_src
       (.clk(source_200Mhz_clk),
        .tick(tick_src_tick));
  uw_engine_imp_1G5W8V5 uw_engine
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
       (.M_AXI_araddr(hier_0_M_AXI_ARADDR),
        .M_AXI_arburst(hier_0_M_AXI_ARBURST),
        .M_AXI_arcache(hier_0_M_AXI_ARCACHE),
        .M_AXI_arid(hier_0_M_AXI_ARID),
        .M_AXI_arlen(hier_0_M_AXI_ARLEN),
        .M_AXI_arlock(hier_0_M_AXI_ARLOCK),
        .M_AXI_arprot(hier_0_M_AXI_ARPROT),
        .M_AXI_arqos(hier_0_M_AXI_ARQOS),
        .M_AXI_arready(hier_0_M_AXI_ARREADY),
        .M_AXI_arsize(hier_0_M_AXI_ARSIZE),
        .M_AXI_arvalid(hier_0_M_AXI_ARVALID),
        .M_AXI_awaddr(hier_0_M_AXI_AWADDR),
        .M_AXI_awburst(hier_0_M_AXI_AWBURST),
        .M_AXI_awcache(hier_0_M_AXI_AWCACHE),
        .M_AXI_awid(hier_0_M_AXI_AWID),
        .M_AXI_awlen(hier_0_M_AXI_AWLEN),
        .M_AXI_awlock(hier_0_M_AXI_AWLOCK),
        .M_AXI_awprot(hier_0_M_AXI_AWPROT),
        .M_AXI_awqos(hier_0_M_AXI_AWQOS),
        .M_AXI_awready(hier_0_M_AXI_AWREADY),
        .M_AXI_awsize(hier_0_M_AXI_AWSIZE),
        .M_AXI_awvalid(hier_0_M_AXI_AWVALID),
        .M_AXI_bid(hier_0_M_AXI_BID),
        .M_AXI_bready(hier_0_M_AXI_BREADY),
        .M_AXI_bresp(hier_0_M_AXI_BRESP),
        .M_AXI_bvalid(hier_0_M_AXI_BVALID),
        .M_AXI_rdata(hier_0_M_AXI_RDATA),
        .M_AXI_rid(hier_0_M_AXI_RID),
        .M_AXI_rlast(hier_0_M_AXI_RLAST),
        .M_AXI_rready(hier_0_M_AXI_RREADY),
        .M_AXI_rresp(hier_0_M_AXI_RRESP),
        .M_AXI_rvalid(hier_0_M_AXI_RVALID),
        .M_AXI_wdata(hier_0_M_AXI_WDATA),
        .M_AXI_wlast(hier_0_M_AXI_WLAST),
        .M_AXI_wready(hier_0_M_AXI_WREADY),
        .M_AXI_wstrb(hier_0_M_AXI_WSTRB),
        .M_AXI_wvalid(hier_0_M_AXI_WVALID),
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

module uw_engine_imp_1G5W8V5
   (Q0_PCI_araddr,
    Q0_PCI_arburst,
    Q0_PCI_arcache,
    Q0_PCI_arid,
    Q0_PCI_arlen,
    Q0_PCI_arlock,
    Q0_PCI_arprot,
    Q0_PCI_arqos,
    Q0_PCI_arready,
    Q0_PCI_arsize,
    Q0_PCI_arvalid,
    Q0_PCI_awaddr,
    Q0_PCI_awburst,
    Q0_PCI_awcache,
    Q0_PCI_awid,
    Q0_PCI_awlen,
    Q0_PCI_awlock,
    Q0_PCI_awprot,
    Q0_PCI_awqos,
    Q0_PCI_awready,
    Q0_PCI_awsize,
    Q0_PCI_awvalid,
    Q0_PCI_bid,
    Q0_PCI_bready,
    Q0_PCI_bresp,
    Q0_PCI_bvalid,
    Q0_PCI_rdata,
    Q0_PCI_rid,
    Q0_PCI_rlast,
    Q0_PCI_rready,
    Q0_PCI_rresp,
    Q0_PCI_rvalid,
    Q0_PCI_wdata,
    Q0_PCI_wlast,
    Q0_PCI_wready,
    Q0_PCI_wstrb,
    Q0_PCI_wvalid,
    Q1_PCI_araddr,
    Q1_PCI_arburst,
    Q1_PCI_arcache,
    Q1_PCI_arid,
    Q1_PCI_arlen,
    Q1_PCI_arlock,
    Q1_PCI_arprot,
    Q1_PCI_arqos,
    Q1_PCI_arready,
    Q1_PCI_arsize,
    Q1_PCI_arvalid,
    Q1_PCI_awaddr,
    Q1_PCI_awburst,
    Q1_PCI_awcache,
    Q1_PCI_awid,
    Q1_PCI_awlen,
    Q1_PCI_awlock,
    Q1_PCI_awprot,
    Q1_PCI_awqos,
    Q1_PCI_awready,
    Q1_PCI_awsize,
    Q1_PCI_awvalid,
    Q1_PCI_bid,
    Q1_PCI_bready,
    Q1_PCI_bresp,
    Q1_PCI_bvalid,
    Q1_PCI_rdata,
    Q1_PCI_rid,
    Q1_PCI_rlast,
    Q1_PCI_rready,
    Q1_PCI_rresp,
    Q1_PCI_rvalid,
    Q1_PCI_wdata,
    Q1_PCI_wlast,
    Q1_PCI_wready,
    Q1_PCI_wstrb,
    Q1_PCI_wvalid,
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
    md_out_tdata,
    md_out_tready,
    md_out_tvalid,
    pa_sync,
    pre0,
    pre256,
    refn_sw,
    refp_sw,
    resetn,
    row_tick_stb,
    rs0,
    rs256,
    smem_access_enable,
    spi_csld,
    spi_mosi0,
    spi_mosi1,
    spi_sck,
    tick_count,
    vprebot_sw,
    vpretop_sw);
  output [63:0]Q0_PCI_araddr;
  output [1:0]Q0_PCI_arburst;
  output [3:0]Q0_PCI_arcache;
  output [1:0]Q0_PCI_arid;
  output [7:0]Q0_PCI_arlen;
  output Q0_PCI_arlock;
  output [2:0]Q0_PCI_arprot;
  output [3:0]Q0_PCI_arqos;
  input Q0_PCI_arready;
  output [2:0]Q0_PCI_arsize;
  output Q0_PCI_arvalid;
  output [63:0]Q0_PCI_awaddr;
  output [1:0]Q0_PCI_awburst;
  output [3:0]Q0_PCI_awcache;
  output [1:0]Q0_PCI_awid;
  output [7:0]Q0_PCI_awlen;
  output Q0_PCI_awlock;
  output [2:0]Q0_PCI_awprot;
  output [3:0]Q0_PCI_awqos;
  input Q0_PCI_awready;
  output [2:0]Q0_PCI_awsize;
  output Q0_PCI_awvalid;
  input [0:0]Q0_PCI_bid;
  output Q0_PCI_bready;
  input [1:0]Q0_PCI_bresp;
  input Q0_PCI_bvalid;
  input [0:0]Q0_PCI_rdata;
  input [0:0]Q0_PCI_rid;
  input Q0_PCI_rlast;
  output Q0_PCI_rready;
  input [1:0]Q0_PCI_rresp;
  input Q0_PCI_rvalid;
  output [511:0]Q0_PCI_wdata;
  output Q0_PCI_wlast;
  input Q0_PCI_wready;
  output [63:0]Q0_PCI_wstrb;
  output Q0_PCI_wvalid;
  output [63:0]Q1_PCI_araddr;
  output [1:0]Q1_PCI_arburst;
  output [3:0]Q1_PCI_arcache;
  output [1:0]Q1_PCI_arid;
  output [7:0]Q1_PCI_arlen;
  output Q1_PCI_arlock;
  output [2:0]Q1_PCI_arprot;
  output [3:0]Q1_PCI_arqos;
  input Q1_PCI_arready;
  output [2:0]Q1_PCI_arsize;
  output Q1_PCI_arvalid;
  output [63:0]Q1_PCI_awaddr;
  output [1:0]Q1_PCI_awburst;
  output [3:0]Q1_PCI_awcache;
  output [1:0]Q1_PCI_awid;
  output [7:0]Q1_PCI_awlen;
  output Q1_PCI_awlock;
  output [2:0]Q1_PCI_awprot;
  output [3:0]Q1_PCI_awqos;
  input Q1_PCI_awready;
  output [2:0]Q1_PCI_awsize;
  output Q1_PCI_awvalid;
  input [0:0]Q1_PCI_bid;
  output Q1_PCI_bready;
  input [1:0]Q1_PCI_bresp;
  input Q1_PCI_bvalid;
  input [0:0]Q1_PCI_rdata;
  input [0:0]Q1_PCI_rid;
  input Q1_PCI_rlast;
  output Q1_PCI_rready;
  input [1:0]Q1_PCI_rresp;
  input Q1_PCI_rvalid;
  output [511:0]Q1_PCI_wdata;
  output Q1_PCI_wlast;
  input Q1_PCI_wready;
  output [63:0]Q1_PCI_wstrb;
  output Q1_PCI_wvalid;
  input [0:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [0:0]S_AXI_awaddr;
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
  input [0:0]S_AXI_wdata;
  output S_AXI_wready;
  input [0:0]S_AXI_wstrb;
  input S_AXI_wvalid;
  input clk;
  output glb_pre_sw;
  output liq_sw;
  output [511:0]md_out_tdata;
  input md_out_tready;
  output md_out_tvalid;
  input pa_sync;
  output pre0;
  output pre256;
  output refn_sw;
  output refp_sw;
  input resetn;
  output row_tick_stb;
  output rs0;
  output rs256;
  output smem_access_enable;
  output spi_csld;
  output spi_mosi0;
  output spi_mosi1;
  output spi_sck;
  output [15:0]tick_count;
  output vprebot_sw;
  output vpretop_sw;

  wire [63:0]Q0_PCI_araddr;
  wire [1:0]Q0_PCI_arburst;
  wire [3:0]Q0_PCI_arcache;
  wire [1:0]Q0_PCI_arid;
  wire [7:0]Q0_PCI_arlen;
  wire Q0_PCI_arlock;
  wire [2:0]Q0_PCI_arprot;
  wire [3:0]Q0_PCI_arqos;
  wire Q0_PCI_arready;
  wire [2:0]Q0_PCI_arsize;
  wire Q0_PCI_arvalid;
  wire [63:0]Q0_PCI_awaddr;
  wire [1:0]Q0_PCI_awburst;
  wire [3:0]Q0_PCI_awcache;
  wire [1:0]Q0_PCI_awid;
  wire [7:0]Q0_PCI_awlen;
  wire Q0_PCI_awlock;
  wire [2:0]Q0_PCI_awprot;
  wire [3:0]Q0_PCI_awqos;
  wire Q0_PCI_awready;
  wire [2:0]Q0_PCI_awsize;
  wire Q0_PCI_awvalid;
  wire [0:0]Q0_PCI_bid;
  wire Q0_PCI_bready;
  wire [1:0]Q0_PCI_bresp;
  wire Q0_PCI_bvalid;
  wire [0:0]Q0_PCI_rdata;
  wire [0:0]Q0_PCI_rid;
  wire Q0_PCI_rlast;
  wire Q0_PCI_rready;
  wire [1:0]Q0_PCI_rresp;
  wire Q0_PCI_rvalid;
  wire [511:0]Q0_PCI_wdata;
  wire Q0_PCI_wlast;
  wire Q0_PCI_wready;
  wire [63:0]Q0_PCI_wstrb;
  wire Q0_PCI_wvalid;
  wire [63:0]Q1_PCI_araddr;
  wire [1:0]Q1_PCI_arburst;
  wire [3:0]Q1_PCI_arcache;
  wire [1:0]Q1_PCI_arid;
  wire [7:0]Q1_PCI_arlen;
  wire Q1_PCI_arlock;
  wire [2:0]Q1_PCI_arprot;
  wire [3:0]Q1_PCI_arqos;
  wire Q1_PCI_arready;
  wire [2:0]Q1_PCI_arsize;
  wire Q1_PCI_arvalid;
  wire [63:0]Q1_PCI_awaddr;
  wire [1:0]Q1_PCI_awburst;
  wire [3:0]Q1_PCI_awcache;
  wire [1:0]Q1_PCI_awid;
  wire [7:0]Q1_PCI_awlen;
  wire Q1_PCI_awlock;
  wire [2:0]Q1_PCI_awprot;
  wire [3:0]Q1_PCI_awqos;
  wire Q1_PCI_awready;
  wire [2:0]Q1_PCI_awsize;
  wire Q1_PCI_awvalid;
  wire [0:0]Q1_PCI_bid;
  wire Q1_PCI_bready;
  wire [1:0]Q1_PCI_bresp;
  wire Q1_PCI_bvalid;
  wire [0:0]Q1_PCI_rdata;
  wire [0:0]Q1_PCI_rid;
  wire Q1_PCI_rlast;
  wire Q1_PCI_rready;
  wire [1:0]Q1_PCI_rresp;
  wire Q1_PCI_rvalid;
  wire [511:0]Q1_PCI_wdata;
  wire Q1_PCI_wlast;
  wire Q1_PCI_wready;
  wire [63:0]Q1_PCI_wstrb;
  wire Q1_PCI_wvalid;
  wire [0:0]S_AXI_araddr;
  wire [2:0]S_AXI_arprot;
  wire S_AXI_arready;
  wire S_AXI_arvalid;
  wire [0:0]S_AXI_awaddr;
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
  wire [0:0]S_AXI_wdata;
  wire S_AXI_wready;
  wire [0:0]S_AXI_wstrb;
  wire S_AXI_wvalid;
  wire clk;
  wire glb_pre_sw;
  wire liq_sw;
  wire [511:0]md_out_tdata;
  wire md_out_tready;
  wire md_out_tvalid;
  wire pa_sync;
  wire pre0;
  wire pre256;
  wire refn_sw;
  wire refp_sw;
  wire resetn;
  wire row_tick_stb;
  wire rs0;
  wire rs256;
  wire smem_access_enable;
  wire spi_csld;
  wire spi_mosi0;
  wire spi_mosi1;
  wire spi_sck;
  wire [15:0]tick_count;
  wire [2:0]uw_ctl_ctl_command;
  wire uw_ctl_q0_suspend;
  wire uw_ctl_q1_suspend;
  wire [63:0]uw_ctl_q1_uw_host_addr;
  wire [31:0]uw_ctl_q1_uw_host_capacity;
  wire [63:0]uw_ctl_q1_uwc_provided;
  wire [63:0]uw_ctl_uw_host_addr;
  wire [31:0]uw_ctl_uw_host_capacity;
  wire [63:0]uw_ctl_uwc_provided;
  wire uw_engine_glb_pre_sw;
  wire uw_engine_halted;
  wire uw_engine_liq_sw;
  wire uw_engine_md_stall_stb;
  wire uw_engine_pre0;
  wire uw_engine_pre256;
  wire uw_engine_q_select;
  wire uw_engine_refn_sw;
  wire uw_engine_refp_sw;
  wire uw_engine_rs0;
  wire uw_engine_rs256;
  wire uw_engine_short_uwc_stb;
  wire uw_engine_spi_csld;
  wire uw_engine_spi_mosi0;
  wire uw_engine_spi_mosi1;
  wire uw_engine_spi_sck;
  wire uw_engine_underflow_stb;
  wire uw_engine_vprebot_sw;
  wire uw_engine_vpretop_sw;
  wire uw_fetcher_0_q_active;
  wire [31:0]uw_fetcher_0_uw_host_free;
  wire uw_fetcher_1_alignment_err_stb;
  wire [511:0]uw_fetcher_1_axis_out_TDATA;
  wire uw_fetcher_1_axis_out_TREADY;
  wire uw_fetcher_1_axis_out_TVALID;
  wire uw_fetcher_1_q_active;
  wire [31:0]uw_fetcher_1_uw_host_free;
  wire uw_fetcher_alignment_err_stb;
  wire [511:0]uw_fetcher_axis_out_TDATA;
  wire uw_fetcher_axis_out_TREADY;
  wire uw_fetcher_axis_out_TVALID;
  wire uw_pulse_pa_pulse;
  wire vprebot_sw;
  wire vpretop_sw;

  top_level_uw_fetcher_0_0 q0_fetcher
       (.M_AXI_ARADDR(Q0_PCI_araddr),
        .M_AXI_ARBURST(Q0_PCI_arburst),
        .M_AXI_ARCACHE(Q0_PCI_arcache),
        .M_AXI_ARID(Q0_PCI_arid),
        .M_AXI_ARLEN(Q0_PCI_arlen),
        .M_AXI_ARLOCK(Q0_PCI_arlock),
        .M_AXI_ARPROT(Q0_PCI_arprot),
        .M_AXI_ARQOS(Q0_PCI_arqos),
        .M_AXI_ARREADY(Q0_PCI_arready),
        .M_AXI_ARSIZE(Q0_PCI_arsize),
        .M_AXI_ARVALID(Q0_PCI_arvalid),
        .M_AXI_AWADDR(Q0_PCI_awaddr),
        .M_AXI_AWBURST(Q0_PCI_awburst),
        .M_AXI_AWCACHE(Q0_PCI_awcache),
        .M_AXI_AWID(Q0_PCI_awid),
        .M_AXI_AWLEN(Q0_PCI_awlen),
        .M_AXI_AWLOCK(Q0_PCI_awlock),
        .M_AXI_AWPROT(Q0_PCI_awprot),
        .M_AXI_AWQOS(Q0_PCI_awqos),
        .M_AXI_AWREADY(Q0_PCI_awready),
        .M_AXI_AWSIZE(Q0_PCI_awsize),
        .M_AXI_AWVALID(Q0_PCI_awvalid),
        .M_AXI_BID({1'b0,Q0_PCI_bid}),
        .M_AXI_BREADY(Q0_PCI_bready),
        .M_AXI_BRESP(Q0_PCI_bresp),
        .M_AXI_BVALID(Q0_PCI_bvalid),
        .M_AXI_RDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,Q0_PCI_rdata}),
        .M_AXI_RID({1'b0,Q0_PCI_rid}),
        .M_AXI_RLAST(Q0_PCI_rlast),
        .M_AXI_RREADY(Q0_PCI_rready),
        .M_AXI_RRESP(Q0_PCI_rresp),
        .M_AXI_RVALID(Q0_PCI_rvalid),
        .M_AXI_WDATA(Q0_PCI_wdata),
        .M_AXI_WLAST(Q0_PCI_wlast),
        .M_AXI_WREADY(Q0_PCI_wready),
        .M_AXI_WSTRB(Q0_PCI_wstrb),
        .M_AXI_WVALID(Q0_PCI_wvalid),
        .alignment_err_stb(uw_fetcher_alignment_err_stb),
        .axis_out_tdata(uw_fetcher_axis_out_TDATA),
        .axis_out_tready(uw_fetcher_axis_out_TREADY),
        .axis_out_tvalid(uw_fetcher_axis_out_TVALID),
        .clk(clk),
        .q_active(uw_fetcher_0_q_active),
        .suspend(uw_ctl_q0_suspend),
        .uw_host_addr(uw_ctl_uw_host_addr),
        .uw_host_capacity(uw_ctl_uw_host_capacity),
        .uw_host_free(uw_fetcher_0_uw_host_free),
        .uwc_provided(uw_ctl_uwc_provided));
  top_level_uw_fetcher_0_1 q1_fetcher
       (.M_AXI_ARADDR(Q1_PCI_araddr),
        .M_AXI_ARBURST(Q1_PCI_arburst),
        .M_AXI_ARCACHE(Q1_PCI_arcache),
        .M_AXI_ARID(Q1_PCI_arid),
        .M_AXI_ARLEN(Q1_PCI_arlen),
        .M_AXI_ARLOCK(Q1_PCI_arlock),
        .M_AXI_ARPROT(Q1_PCI_arprot),
        .M_AXI_ARQOS(Q1_PCI_arqos),
        .M_AXI_ARREADY(Q1_PCI_arready),
        .M_AXI_ARSIZE(Q1_PCI_arsize),
        .M_AXI_ARVALID(Q1_PCI_arvalid),
        .M_AXI_AWADDR(Q1_PCI_awaddr),
        .M_AXI_AWBURST(Q1_PCI_awburst),
        .M_AXI_AWCACHE(Q1_PCI_awcache),
        .M_AXI_AWID(Q1_PCI_awid),
        .M_AXI_AWLEN(Q1_PCI_awlen),
        .M_AXI_AWLOCK(Q1_PCI_awlock),
        .M_AXI_AWPROT(Q1_PCI_awprot),
        .M_AXI_AWQOS(Q1_PCI_awqos),
        .M_AXI_AWREADY(Q1_PCI_awready),
        .M_AXI_AWSIZE(Q1_PCI_awsize),
        .M_AXI_AWVALID(Q1_PCI_awvalid),
        .M_AXI_BID({1'b0,Q1_PCI_bid}),
        .M_AXI_BREADY(Q1_PCI_bready),
        .M_AXI_BRESP(Q1_PCI_bresp),
        .M_AXI_BVALID(Q1_PCI_bvalid),
        .M_AXI_RDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,Q1_PCI_rdata}),
        .M_AXI_RID({1'b0,Q1_PCI_rid}),
        .M_AXI_RLAST(Q1_PCI_rlast),
        .M_AXI_RREADY(Q1_PCI_rready),
        .M_AXI_RRESP(Q1_PCI_rresp),
        .M_AXI_RVALID(Q1_PCI_rvalid),
        .M_AXI_WDATA(Q1_PCI_wdata),
        .M_AXI_WLAST(Q1_PCI_wlast),
        .M_AXI_WREADY(Q1_PCI_wready),
        .M_AXI_WSTRB(Q1_PCI_wstrb),
        .M_AXI_WVALID(Q1_PCI_wvalid),
        .alignment_err_stb(uw_fetcher_1_alignment_err_stb),
        .axis_out_tdata(uw_fetcher_1_axis_out_TDATA),
        .axis_out_tready(uw_fetcher_1_axis_out_TREADY),
        .axis_out_tvalid(uw_fetcher_1_axis_out_TVALID),
        .clk(clk),
        .q_active(uw_fetcher_1_q_active),
        .suspend(uw_ctl_q1_suspend),
        .uw_host_addr(uw_ctl_q1_uw_host_addr),
        .uw_host_capacity(uw_ctl_q1_uw_host_capacity),
        .uw_host_free(uw_fetcher_1_uw_host_free),
        .uwc_provided(uw_ctl_q1_uwc_provided));
  top_level_uw_ctl_0_0 uw_ctl
       (.S_AXI_ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S_AXI_araddr}),
        .S_AXI_ARPROT(S_AXI_arprot),
        .S_AXI_ARREADY(S_AXI_arready),
        .S_AXI_ARVALID(S_AXI_arvalid),
        .S_AXI_AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S_AXI_awaddr}),
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
        .S_AXI_WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S_AXI_wdata}),
        .S_AXI_WREADY(S_AXI_wready),
        .S_AXI_WSTRB({1'b1,1'b1,1'b1,S_AXI_wstrb}),
        .S_AXI_WVALID(S_AXI_wvalid),
        .clk(clk),
        .ctl_command(uw_ctl_ctl_command),
        .q0_active(uw_fetcher_0_q_active),
        .q0_alignment_stb(uw_fetcher_alignment_err_stb),
        .q0_suspend(uw_ctl_q0_suspend),
        .q0_uw_host_addr(uw_ctl_uw_host_addr),
        .q0_uw_host_capacity(uw_ctl_uw_host_capacity),
        .q0_uwc_host_free(uw_fetcher_0_uw_host_free),
        .q0_uwc_provided(uw_ctl_uwc_provided),
        .q1_active(uw_fetcher_1_q_active),
        .q1_alignment_stb(uw_fetcher_1_alignment_err_stb),
        .q1_suspend(uw_ctl_q1_suspend),
        .q1_uw_host_addr(uw_ctl_q1_uw_host_addr),
        .q1_uw_host_capacity(uw_ctl_q1_uw_host_capacity),
        .q1_uwc_host_free(uw_fetcher_1_uw_host_free),
        .q1_uwc_provided(uw_ctl_q1_uwc_provided),
        .q_select(uw_engine_q_select),
        .resetn(resetn),
        .uw_halted(uw_engine_halted),
        .uw_md_stall_stb(uw_engine_md_stall_stb),
        .uw_short_uwc_stb(uw_engine_short_uwc_stb),
        .uw_underflow_stb(uw_engine_underflow_stb));
  top_level_uw_engine_0_0 uw_engine
       (.axis_in0_tdata(uw_fetcher_axis_out_TDATA),
        .axis_in0_tready(uw_fetcher_axis_out_TREADY),
        .axis_in0_tvalid(uw_fetcher_axis_out_TVALID),
        .axis_in1_tdata(uw_fetcher_1_axis_out_TDATA),
        .axis_in1_tready(uw_fetcher_1_axis_out_TREADY),
        .axis_in1_tvalid(uw_fetcher_1_axis_out_TVALID),
        .clk(clk),
        .ctl_command(uw_ctl_ctl_command),
        .glb_pre_sw(uw_engine_glb_pre_sw),
        .halted(uw_engine_halted),
        .liq_sw(uw_engine_liq_sw),
        .md_out_tdata(md_out_tdata),
        .md_out_tready(md_out_tready),
        .md_out_tvalid(md_out_tvalid),
        .md_stall_stb(uw_engine_md_stall_stb),
        .pre0(uw_engine_pre0),
        .pre256(uw_engine_pre256),
        .q0_active(uw_fetcher_0_q_active),
        .q1_active(uw_fetcher_1_q_active),
        .q_select(uw_engine_q_select),
        .refn_sw(uw_engine_refn_sw),
        .refp_sw(uw_engine_refp_sw),
        .resetn(resetn),
        .row_pulse(uw_pulse_pa_pulse),
        .row_tick_stb(row_tick_stb),
        .rs0(uw_engine_rs0),
        .rs256(uw_engine_rs256),
        .short_uwc_stb(uw_engine_short_uwc_stb),
        .smem_access_enable(smem_access_enable),
        .spi_csld(uw_engine_spi_csld),
        .spi_mosi0(uw_engine_spi_mosi0),
        .spi_mosi1(uw_engine_spi_mosi1),
        .spi_sck(uw_engine_spi_sck),
        .tick_count(tick_count),
        .underflow_stb(uw_engine_underflow_stb),
        .vprebot_sw(uw_engine_vprebot_sw),
        .vpretop_sw(uw_engine_vpretop_sw));
  top_level_uw_extra_flops_0_0 uw_extra_flops
       (.clk(clk),
        .glb_pre_sw(uw_engine_glb_pre_sw),
        .liq_sw(uw_engine_liq_sw),
        .pin_glb_pre_sw(glb_pre_sw),
        .pin_liq_sw(liq_sw),
        .pin_pre0(pre0),
        .pin_pre256(pre256),
        .pin_refn_sw(refn_sw),
        .pin_refp_sw(refp_sw),
        .pin_rs0(rs0),
        .pin_rs256(rs256),
        .pin_spi_csld(spi_csld),
        .pin_spi_mosi0(spi_mosi0),
        .pin_spi_mosi1(spi_mosi1),
        .pin_spi_sck(spi_sck),
        .pin_vprebot_sw(vprebot_sw),
        .pin_vpretop_sw(vpretop_sw),
        .pre0(uw_engine_pre0),
        .pre256(uw_engine_pre256),
        .refn_sw(uw_engine_refn_sw),
        .refp_sw(uw_engine_refp_sw),
        .resetn(resetn),
        .rs0(uw_engine_rs0),
        .rs256(uw_engine_rs256),
        .spi_csld(uw_engine_spi_csld),
        .spi_mosi0(uw_engine_spi_mosi0),
        .spi_mosi1(uw_engine_spi_mosi1),
        .spi_sck(uw_engine_spi_sck),
        .vprebot_sw(uw_engine_vprebot_sw),
        .vpretop_sw(uw_engine_vpretop_sw));
  top_level_uw_pulse_0_0 uw_pulse
       (.clk(clk),
        .pa_sync(pa_sync),
        .row_pulse(uw_pulse_pa_pulse));
endmodule

module uw_recorder_imp_18A1Y49
   (M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
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
  output [63:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [3:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [63:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [3:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [0:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [0:0]M_AXI_rdata;
  input [0:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [511:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [63:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input [0:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [0:0]S_AXI_awaddr;
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
  input [0:0]S_AXI_wdata;
  output S_AXI_wready;
  input [0:0]S_AXI_wstrb;
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

  wire [63:0]M_AXI_araddr;
  wire [1:0]M_AXI_arburst;
  wire [3:0]M_AXI_arcache;
  wire [3:0]M_AXI_arid;
  wire [7:0]M_AXI_arlen;
  wire M_AXI_arlock;
  wire [2:0]M_AXI_arprot;
  wire [3:0]M_AXI_arqos;
  wire M_AXI_arready;
  wire [2:0]M_AXI_arsize;
  wire M_AXI_arvalid;
  wire [63:0]M_AXI_awaddr;
  wire [1:0]M_AXI_awburst;
  wire [3:0]M_AXI_awcache;
  wire [3:0]M_AXI_awid;
  wire [7:0]M_AXI_awlen;
  wire M_AXI_awlock;
  wire [2:0]M_AXI_awprot;
  wire [3:0]M_AXI_awqos;
  wire M_AXI_awready;
  wire [2:0]M_AXI_awsize;
  wire M_AXI_awvalid;
  wire [0:0]M_AXI_bid;
  wire M_AXI_bready;
  wire [1:0]M_AXI_bresp;
  wire M_AXI_bvalid;
  wire [0:0]M_AXI_rdata;
  wire [0:0]M_AXI_rid;
  wire M_AXI_rlast;
  wire M_AXI_rready;
  wire [1:0]M_AXI_rresp;
  wire M_AXI_rvalid;
  wire [511:0]M_AXI_wdata;
  wire M_AXI_wlast;
  wire M_AXI_wready;
  wire [63:0]M_AXI_wstrb;
  wire M_AXI_wvalid;
  wire [0:0]S_AXI_araddr;
  wire [2:0]S_AXI_arprot;
  wire S_AXI_arready;
  wire S_AXI_arvalid;
  wire [0:0]S_AXI_awaddr;
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
  wire [0:0]S_AXI_wdata;
  wire S_AXI_wready;
  wire [0:0]S_AXI_wstrb;
  wire S_AXI_wvalid;
  wire clk;
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
  wire spi_csld;
  wire spi_mosi0;
  wire spi_mosi1;
  wire spi_sck;
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

  top_level_uw_recorder_ctl_0_1 uw_recorder_ctl
       (.S_AXI_ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S_AXI_araddr}),
        .S_AXI_ARPROT(S_AXI_arprot),
        .S_AXI_ARREADY(S_AXI_arready),
        .S_AXI_ARVALID(S_AXI_arvalid),
        .S_AXI_AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S_AXI_awaddr}),
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
        .S_AXI_WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S_AXI_wdata}),
        .S_AXI_WREADY(S_AXI_wready),
        .S_AXI_WSTRB({1'b1,1'b1,1'b1,S_AXI_wstrb}),
        .S_AXI_WVALID(S_AXI_wvalid),
        .clk(clk),
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
        .clk(clk),
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
       (.M_AXI_ARADDR(M_AXI_araddr),
        .M_AXI_ARBURST(M_AXI_arburst),
        .M_AXI_ARCACHE(M_AXI_arcache),
        .M_AXI_ARID(M_AXI_arid),
        .M_AXI_ARLEN(M_AXI_arlen),
        .M_AXI_ARLOCK(M_AXI_arlock),
        .M_AXI_ARPROT(M_AXI_arprot),
        .M_AXI_ARQOS(M_AXI_arqos),
        .M_AXI_ARREADY(M_AXI_arready),
        .M_AXI_ARSIZE(M_AXI_arsize),
        .M_AXI_ARVALID(M_AXI_arvalid),
        .M_AXI_AWADDR(M_AXI_awaddr),
        .M_AXI_AWBURST(M_AXI_awburst),
        .M_AXI_AWCACHE(M_AXI_awcache),
        .M_AXI_AWID(M_AXI_awid),
        .M_AXI_AWLEN(M_AXI_awlen),
        .M_AXI_AWLOCK(M_AXI_awlock),
        .M_AXI_AWPROT(M_AXI_awprot),
        .M_AXI_AWQOS(M_AXI_awqos),
        .M_AXI_AWREADY(M_AXI_awready),
        .M_AXI_AWSIZE(M_AXI_awsize),
        .M_AXI_AWVALID(M_AXI_awvalid),
        .M_AXI_BID({1'b0,1'b0,1'b0,M_AXI_bid}),
        .M_AXI_BREADY(M_AXI_bready),
        .M_AXI_BRESP(M_AXI_bresp),
        .M_AXI_BVALID(M_AXI_bvalid),
        .M_AXI_RDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,M_AXI_rdata}),
        .M_AXI_RID({1'b0,1'b0,1'b0,M_AXI_rid}),
        .M_AXI_RLAST(M_AXI_rlast),
        .M_AXI_RREADY(M_AXI_rready),
        .M_AXI_RRESP(M_AXI_rresp),
        .M_AXI_RVALID(M_AXI_rvalid),
        .M_AXI_WDATA(M_AXI_wdata),
        .M_AXI_WLAST(M_AXI_wlast),
        .M_AXI_WREADY(M_AXI_wready),
        .M_AXI_WSTRB(M_AXI_wstrb),
        .M_AXI_WVALID(M_AXI_wvalid),
        .axis_in_tdata(uw_recorder_s1_0_axis_out_TDATA),
        .axis_in_tready(uw_recorder_s1_0_axis_out_TREADY),
        .axis_in_tvalid(uw_recorder_s1_0_axis_out_TVALID),
        .clk(clk),
        .fifo_entries(uw_recorder_s1_0_fifo_entries),
        .host_buff_addr(uw_recorder_ctl_host_buff_addr),
        .recording(uw_recorder_s1_0_recording),
        .resetn(resetn));
  top_level_uw_sim_ltc2656_0_0 uw_sim_ltc2656_0
       (.clk(clk),
        .dac_output(uw_sim_ltc2656_0_dac_output),
        .resetn(resetn),
        .spi_csld(spi_csld),
        .spi_mosi(spi_mosi0),
        .spi_sck(spi_sck));
  top_level_uw_sim_ltc2656_0_1 uw_sim_ltc2656_1
       (.clk(clk),
        .dac_output(uw_sim_ltc2656_1_dac_output),
        .resetn(resetn),
        .spi_csld(spi_csld),
        .spi_mosi(spi_mosi1),
        .spi_sck(spi_sck));
endmodule
