vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_8
vlib modelsim_lib/msim/processing_system7_vip_v1_0_10
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/xlconstant_v1_1_7
vlib modelsim_lib/msim/smartconnect_v1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_22
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/interrupt_control_v3_1_4
vlib modelsim_lib/msim/axi_gpio_v2_0_24
vlib modelsim_lib/msim/fifo_generator_v13_2_5

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_8 modelsim_lib/msim/axi_vip_v1_1_8
vmap processing_system7_vip_v1_0_10 modelsim_lib/msim/processing_system7_vip_v1_0_10
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap xlconstant_v1_1_7 modelsim_lib/msim/xlconstant_v1_1_7
vmap smartconnect_v1_0 modelsim_lib/msim/smartconnect_v1_0
vmap axi_register_slice_v2_1_22 modelsim_lib/msim/axi_register_slice_v2_1_22
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_4 modelsim_lib/msim/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_24 modelsim_lib/msim/axi_gpio_v2_0_24
vmap fifo_generator_v13_2_5 modelsim_lib/msim/fifo_generator_v13_2_5

vlog -work xilinx_vip  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_8  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../backup.gen/sources_1/bd/design_1/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_10  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v" \

vcom -work lib_cdc_v1_0_2  -93 \
"../../../../backup.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13  -93 \
"../../../../backup.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/design_1/ip/design_1_proc_sys_reset_0_0/sim/design_1_proc_sys_reset_0_0.vhd" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/sim/bd_48ac.v" \

vlog -work xlconstant_v1_1_7  -incr "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../backup.gen/sources_1/bd/design_1/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_0/sim/bd_48ac_one_0.v" \

vcom -work xil_defaultlib  -93 \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_1/sim/bd_48ac_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../backup.gen/sources_1/bd/design_1/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_2/sim/bd_48ac_arinsw_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_3/sim/bd_48ac_rinsw_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_4/sim/bd_48ac_awinsw_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_5/sim/bd_48ac_winsw_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_6/sim/bd_48ac_binsw_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_7/sim/bd_48ac_aroutsw_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_8/sim/bd_48ac_routsw_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_9/sim/bd_48ac_awoutsw_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_10/sim/bd_48ac_woutsw_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_11/sim/bd_48ac_boutsw_0.sv" \

vlog -work smartconnect_v1_0  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_12/sim/bd_48ac_arni_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_13/sim/bd_48ac_rni_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_14/sim/bd_48ac_awni_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_15/sim/bd_48ac_wni_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_16/sim/bd_48ac_bni_0.sv" \

vlog -work smartconnect_v1_0  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../backup.gen/sources_1/bd/design_1/ipshared/ea34/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_17/sim/bd_48ac_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../backup.gen/sources_1/bd/design_1/ipshared/4fd2/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_18/sim/bd_48ac_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../backup.gen/sources_1/bd/design_1/ipshared/8047/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_19/sim/bd_48ac_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../backup.gen/sources_1/bd/design_1/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_20/sim/bd_48ac_s00a2s_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_21/sim/bd_48ac_sarn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_22/sim/bd_48ac_srn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_23/sim/bd_48ac_sawn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_24/sim/bd_48ac_swn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_25/sim/bd_48ac_sbn_0.sv" \

vlog -work smartconnect_v1_0  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../backup.gen/sources_1/bd/design_1/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_26/sim/bd_48ac_m00s2a_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_27/sim/bd_48ac_m00arn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_28/sim/bd_48ac_m00rn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_29/sim/bd_48ac_m00awn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_30/sim/bd_48ac_m00wn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_31/sim/bd_48ac_m00bn_0.sv" \

vlog -work smartconnect_v1_0  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../backup.gen/sources_1/bd/design_1/ipshared/7bd7/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -sv -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_32/sim/bd_48ac_m00e_0.sv" \

vlog -work axi_register_slice_v2_1_22  -incr "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../backup.gen/sources_1/bd/design_1/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/sim/design_1_smartconnect_0_0.v" \

vcom -work xil_defaultlib  -93 \
"../../../bd/design_1/sim/design_1.vhd" \

vcom -work axi_lite_ipif_v3_0_4  -93 \
"../../../../backup.gen/sources_1/bd/design_1/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_4  -93 \
"../../../../backup.gen/sources_1/bd/design_1/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_24  -93 \
"../../../../backup.gen/sources_1/bd/design_1/ipshared/4318/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/design_1/ip/design_1_axi_gpio_0_0/sim/design_1_axi_gpio_0_0.vhd" \

vlog -work fifo_generator_v13_2_5  -incr "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../backup.gen/sources_1/bd/design_1/ip/fifo_generator_0/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5  -93 \
"../../../../backup.gen/sources_1/bd/design_1/ip/fifo_generator_0/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -incr "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../backup.gen/sources_1/bd/design_1/ip/fifo_generator_0/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/34f8/hdl" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../backup.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/fifo_generator_0/sim/fifo_generator_0.v" \

vcom -work xil_defaultlib  -93 \
"../../../bd/design_1/ipshared/3b78/vga_controller.vhd" \
"../../../bd/design_1/ip/design_1_vga_controller_1_0/sim/design_1_vga_controller_1_0.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

