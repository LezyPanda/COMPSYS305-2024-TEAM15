-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "05/07/2024 22:04:50"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	main_d IS
    PORT (
	refclk : IN std_logic;
	rst : IN std_logic;
	locked : BUFFER std_logic;
	red : IN std_logic;
	green : IN std_logic;
	blue : IN std_logic;
	red_out : BUFFER std_logic;
	green_out : BUFFER std_logic;
	blue_out : BUFFER std_logic;
	horiz_sync_out : BUFFER std_logic;
	vert_sync_out : BUFFER std_logic;
	pixel_row : BUFFER std_logic_vector(9 DOWNTO 0);
	pixel_column : BUFFER std_logic_vector(9 DOWNTO 0)
	);
END main_d;

-- Design Ports Information
-- locked	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- red_out	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- green_out	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- blue_out	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- horiz_sync_out	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vert_sync_out	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_row[0]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_row[1]	=>  Location: PIN_P7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_row[2]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_row[3]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_row[4]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_row[5]	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_row[6]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_row[7]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_row[8]	=>  Location: PIN_V6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_row[9]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_column[0]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_column[1]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_column[2]	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_column[3]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_column[4]	=>  Location: PIN_W9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_column[5]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_column[6]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_column[7]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_column[8]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pixel_column[9]	=>  Location: PIN_U8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- refclk	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- red	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- green	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- blue	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF main_d IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_refclk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_locked : std_logic;
SIGNAL ww_red : std_logic;
SIGNAL ww_green : std_logic;
SIGNAL ww_blue : std_logic;
SIGNAL ww_red_out : std_logic;
SIGNAL ww_green_out : std_logic;
SIGNAL ww_blue_out : std_logic;
SIGNAL ww_horiz_sync_out : std_logic;
SIGNAL ww_vert_sync_out : std_logic;
SIGNAL ww_pixel_row : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_pixel_column : std_logic_vector(9 DOWNTO 0);
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \refclk~input_o\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\ : std_logic;
SIGNAL \red~input_o\ : std_logic;
SIGNAL \vga|Add0~1_sumout\ : std_logic;
SIGNAL \vga|Equal0~0_combout\ : std_logic;
SIGNAL \vga|Equal0~1_combout\ : std_logic;
SIGNAL \vga|Add0~2\ : std_logic;
SIGNAL \vga|Add0~17_sumout\ : std_logic;
SIGNAL \vga|Add0~18\ : std_logic;
SIGNAL \vga|Add0~21_sumout\ : std_logic;
SIGNAL \vga|Add0~22\ : std_logic;
SIGNAL \vga|Add0~25_sumout\ : std_logic;
SIGNAL \vga|Add0~26\ : std_logic;
SIGNAL \vga|Add0~29_sumout\ : std_logic;
SIGNAL \vga|Add0~30\ : std_logic;
SIGNAL \vga|Add0~33_sumout\ : std_logic;
SIGNAL \vga|Add0~34\ : std_logic;
SIGNAL \vga|Add0~37_sumout\ : std_logic;
SIGNAL \vga|Add0~38\ : std_logic;
SIGNAL \vga|Add0~9_sumout\ : std_logic;
SIGNAL \vga|Add0~10\ : std_logic;
SIGNAL \vga|Add0~13_sumout\ : std_logic;
SIGNAL \vga|Add0~14\ : std_logic;
SIGNAL \vga|Add0~5_sumout\ : std_logic;
SIGNAL \vga|h_count[7]~DUPLICATE_q\ : std_logic;
SIGNAL \vga|process_0~0_combout\ : std_logic;
SIGNAL \vga|video_on_h~DUPLICATE_q\ : std_logic;
SIGNAL \vga|Add1~1_sumout\ : std_logic;
SIGNAL \vga|process_0~7_combout\ : std_logic;
SIGNAL \vga|h_count[6]~DUPLICATE_q\ : std_logic;
SIGNAL \vga|process_0~9_combout\ : std_logic;
SIGNAL \vga|process_0~5_combout\ : std_logic;
SIGNAL \vga|process_0~8_combout\ : std_logic;
SIGNAL \vga|process_0~10_combout\ : std_logic;
SIGNAL \vga|v_count[0]~0_combout\ : std_logic;
SIGNAL \vga|Add1~2\ : std_logic;
SIGNAL \vga|Add1~25_sumout\ : std_logic;
SIGNAL \vga|Add1~26\ : std_logic;
SIGNAL \vga|Add1~29_sumout\ : std_logic;
SIGNAL \vga|Add1~30\ : std_logic;
SIGNAL \vga|Add1~33_sumout\ : std_logic;
SIGNAL \vga|Add1~34\ : std_logic;
SIGNAL \vga|Add1~37_sumout\ : std_logic;
SIGNAL \vga|Add1~38\ : std_logic;
SIGNAL \vga|Add1~17_sumout\ : std_logic;
SIGNAL \vga|Add1~18\ : std_logic;
SIGNAL \vga|Add1~21_sumout\ : std_logic;
SIGNAL \vga|Add1~22\ : std_logic;
SIGNAL \vga|Add1~13_sumout\ : std_logic;
SIGNAL \vga|Add1~14\ : std_logic;
SIGNAL \vga|Add1~9_sumout\ : std_logic;
SIGNAL \vga|Add1~10\ : std_logic;
SIGNAL \vga|Add1~5_sumout\ : std_logic;
SIGNAL \vga|LessThan7~0_combout\ : std_logic;
SIGNAL \vga|video_on_v~feeder_combout\ : std_logic;
SIGNAL \vga|video_on_v~q\ : std_logic;
SIGNAL \vga|red_out~0_combout\ : std_logic;
SIGNAL \vga|red_out~q\ : std_logic;
SIGNAL \vga|video_on_h~q\ : std_logic;
SIGNAL \green~input_o\ : std_logic;
SIGNAL \vga|green_out~0_combout\ : std_logic;
SIGNAL \vga|green_out~q\ : std_logic;
SIGNAL \blue~input_o\ : std_logic;
SIGNAL \vga|blue_out~0_combout\ : std_logic;
SIGNAL \vga|blue_out~q\ : std_logic;
SIGNAL \vga|process_0~1_combout\ : std_logic;
SIGNAL \vga|process_0~3_combout\ : std_logic;
SIGNAL \vga|h_count[4]~DUPLICATE_q\ : std_logic;
SIGNAL \vga|process_0~2_combout\ : std_logic;
SIGNAL \vga|process_0~4_combout\ : std_logic;
SIGNAL \vga|horiz_sync~q\ : std_logic;
SIGNAL \vga|horiz_sync_out~q\ : std_logic;
SIGNAL \vga|LessThan7~1_combout\ : std_logic;
SIGNAL \vga|process_0~6_combout\ : std_logic;
SIGNAL \vga|vert_sync~q\ : std_logic;
SIGNAL \vga|vert_sync_out~feeder_combout\ : std_logic;
SIGNAL \vga|vert_sync_out~q\ : std_logic;
SIGNAL \vga|pixel_row[0]~feeder_combout\ : std_logic;
SIGNAL \vga|v_count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \vga|pixel_row[3]~feeder_combout\ : std_logic;
SIGNAL \vga|pixel_column[2]~feeder_combout\ : std_logic;
SIGNAL \vga|pixel_column[8]~feeder_combout\ : std_logic;
SIGNAL \pll|dp_clk_inst|altera_pll_i|outclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|v_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \vga|h_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \pll|dp_clk_inst|altera_pll_i|locked_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|pixel_row\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \pll|dp_clk_inst|altera_pll_i|fboutclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \vga|pixel_column\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \vga|ALT_INV_video_on_h~DUPLICATE_q\ : std_logic;
SIGNAL \vga|ALT_INV_h_count[6]~DUPLICATE_q\ : std_logic;
SIGNAL \vga|ALT_INV_h_count[4]~DUPLICATE_q\ : std_logic;
SIGNAL \vga|ALT_INV_h_count[7]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_blue~input_o\ : std_logic;
SIGNAL \ALT_INV_green~input_o\ : std_logic;
SIGNAL \ALT_INV_red~input_o\ : std_logic;
SIGNAL \vga|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \vga|ALT_INV_process_0~10_combout\ : std_logic;
SIGNAL \vga|ALT_INV_process_0~9_combout\ : std_logic;
SIGNAL \vga|ALT_INV_process_0~8_combout\ : std_logic;
SIGNAL \vga|ALT_INV_process_0~7_combout\ : std_logic;
SIGNAL \vga|ALT_INV_process_0~5_combout\ : std_logic;
SIGNAL \vga|ALT_INV_LessThan7~1_combout\ : std_logic;
SIGNAL \vga|ALT_INV_process_0~3_combout\ : std_logic;
SIGNAL \vga|ALT_INV_process_0~2_combout\ : std_logic;
SIGNAL \vga|ALT_INV_process_0~1_combout\ : std_logic;
SIGNAL \vga|ALT_INV_process_0~0_combout\ : std_logic;
SIGNAL \vga|ALT_INV_LessThan7~0_combout\ : std_logic;
SIGNAL \vga|ALT_INV_vert_sync~q\ : std_logic;
SIGNAL \vga|ALT_INV_video_on_h~q\ : std_logic;
SIGNAL \vga|ALT_INV_video_on_v~q\ : std_logic;
SIGNAL \vga|ALT_INV_h_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \vga|ALT_INV_v_count\ : std_logic_vector(9 DOWNTO 0);

BEGIN

ww_refclk <= refclk;
ww_rst <= rst;
locked <= ww_locked;
ww_red <= red;
ww_green <= green;
ww_blue <= blue;
red_out <= ww_red_out;
green_out <= ww_green_out;
blue_out <= ww_blue_out;
horiz_sync_out <= ww_horiz_sync_out;
vert_sync_out <= ww_vert_sync_out;
pixel_row <= ww_pixel_row;
pixel_column <= ww_pixel_column;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ <= \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(0);
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ <= \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(1);
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ <= \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(2);
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ <= \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(3);
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ <= \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(4);
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ <= \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(5);
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ <= \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(6);
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ <= \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(7);

\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ <= \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(0);
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ <= \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(1);
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ <= \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(2);
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ <= \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(3);
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ <= \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(4);
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ <= \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(5);
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ <= \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(6);
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ <= \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(7);

\pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ <= (gnd & gnd & gnd & \refclk~input_o\);

\pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ <= (\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ & \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ & 
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ & \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ & \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ & 
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ & \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ & \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\);

\pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ <= \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\(6);

\pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ <= (\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ & \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ & 
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ & \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ & \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ & 
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ & \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ & \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\);
\vga|ALT_INV_video_on_h~DUPLICATE_q\ <= NOT \vga|video_on_h~DUPLICATE_q\;
\vga|ALT_INV_h_count[6]~DUPLICATE_q\ <= NOT \vga|h_count[6]~DUPLICATE_q\;
\vga|ALT_INV_h_count[4]~DUPLICATE_q\ <= NOT \vga|h_count[4]~DUPLICATE_q\;
\vga|ALT_INV_h_count[7]~DUPLICATE_q\ <= NOT \vga|h_count[7]~DUPLICATE_q\;
\ALT_INV_blue~input_o\ <= NOT \blue~input_o\;
\ALT_INV_green~input_o\ <= NOT \green~input_o\;
\ALT_INV_red~input_o\ <= NOT \red~input_o\;
\vga|ALT_INV_Equal0~0_combout\ <= NOT \vga|Equal0~0_combout\;
\vga|ALT_INV_process_0~10_combout\ <= NOT \vga|process_0~10_combout\;
\vga|ALT_INV_process_0~9_combout\ <= NOT \vga|process_0~9_combout\;
\vga|ALT_INV_process_0~8_combout\ <= NOT \vga|process_0~8_combout\;
\vga|ALT_INV_process_0~7_combout\ <= NOT \vga|process_0~7_combout\;
\vga|ALT_INV_process_0~5_combout\ <= NOT \vga|process_0~5_combout\;
\vga|ALT_INV_LessThan7~1_combout\ <= NOT \vga|LessThan7~1_combout\;
\vga|ALT_INV_process_0~3_combout\ <= NOT \vga|process_0~3_combout\;
\vga|ALT_INV_process_0~2_combout\ <= NOT \vga|process_0~2_combout\;
\vga|ALT_INV_process_0~1_combout\ <= NOT \vga|process_0~1_combout\;
\vga|ALT_INV_process_0~0_combout\ <= NOT \vga|process_0~0_combout\;
\vga|ALT_INV_LessThan7~0_combout\ <= NOT \vga|LessThan7~0_combout\;
\vga|ALT_INV_vert_sync~q\ <= NOT \vga|vert_sync~q\;
\vga|ALT_INV_video_on_h~q\ <= NOT \vga|video_on_h~q\;
\vga|ALT_INV_video_on_v~q\ <= NOT \vga|video_on_v~q\;
\vga|ALT_INV_h_count\(6) <= NOT \vga|h_count\(6);
\vga|ALT_INV_h_count\(5) <= NOT \vga|h_count\(5);
\vga|ALT_INV_h_count\(4) <= NOT \vga|h_count\(4);
\vga|ALT_INV_h_count\(3) <= NOT \vga|h_count\(3);
\vga|ALT_INV_h_count\(2) <= NOT \vga|h_count\(2);
\vga|ALT_INV_h_count\(1) <= NOT \vga|h_count\(1);
\vga|ALT_INV_h_count\(8) <= NOT \vga|h_count\(8);
\vga|ALT_INV_h_count\(7) <= NOT \vga|h_count\(7);
\vga|ALT_INV_h_count\(9) <= NOT \vga|h_count\(9);
\vga|ALT_INV_h_count\(0) <= NOT \vga|h_count\(0);
\vga|ALT_INV_v_count\(4) <= NOT \vga|v_count\(4);
\vga|ALT_INV_v_count\(3) <= NOT \vga|v_count\(3);
\vga|ALT_INV_v_count\(2) <= NOT \vga|v_count\(2);
\vga|ALT_INV_v_count\(1) <= NOT \vga|v_count\(1);
\vga|ALT_INV_v_count\(6) <= NOT \vga|v_count\(6);
\vga|ALT_INV_v_count\(5) <= NOT \vga|v_count\(5);
\vga|ALT_INV_v_count\(7) <= NOT \vga|v_count\(7);
\vga|ALT_INV_v_count\(8) <= NOT \vga|v_count\(8);
\vga|ALT_INV_v_count\(9) <= NOT \vga|v_count\(9);
\vga|ALT_INV_v_count\(0) <= NOT \vga|v_count\(0);

-- Location: IOOBUF_X8_Y45_N59
\locked~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pll|dp_clk_inst|altera_pll_i|locked_wire\(0),
	devoe => ww_devoe,
	o => ww_locked);

-- Location: IOOBUF_X11_Y0_N53
\red_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|red_out~q\,
	devoe => ww_devoe,
	o => ww_red_out);

-- Location: IOOBUF_X18_Y0_N2
\green_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|green_out~q\,
	devoe => ww_devoe,
	o => ww_green_out);

-- Location: IOOBUF_X14_Y0_N19
\blue_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|blue_out~q\,
	devoe => ww_devoe,
	o => ww_blue_out);

-- Location: IOOBUF_X16_Y0_N59
\horiz_sync_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|horiz_sync_out~q\,
	devoe => ww_devoe,
	o => ww_horiz_sync_out);

-- Location: IOOBUF_X0_Y18_N45
\vert_sync_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|vert_sync_out~q\,
	devoe => ww_devoe,
	o => ww_vert_sync_out);

-- Location: IOOBUF_X16_Y0_N76
\pixel_row[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|pixel_row\(0),
	devoe => ww_devoe,
	o => ww_pixel_row(0));

-- Location: IOOBUF_X14_Y0_N36
\pixel_row[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|pixel_row\(1),
	devoe => ww_devoe,
	o => ww_pixel_row(1));

-- Location: IOOBUF_X12_Y0_N19
\pixel_row[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|pixel_row\(2),
	devoe => ww_devoe,
	o => ww_pixel_row(2));

-- Location: IOOBUF_X11_Y0_N2
\pixel_row[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|pixel_row\(3),
	devoe => ww_devoe,
	o => ww_pixel_row(3));

-- Location: IOOBUF_X14_Y0_N2
\pixel_row[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|pixel_row\(4),
	devoe => ww_devoe,
	o => ww_pixel_row(4));

-- Location: IOOBUF_X12_Y0_N53
\pixel_row[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|pixel_row\(5),
	devoe => ww_devoe,
	o => ww_pixel_row(5));

-- Location: IOOBUF_X18_Y0_N53
\pixel_row[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|pixel_row\(6),
	devoe => ww_devoe,
	o => ww_pixel_row(6));

-- Location: IOOBUF_X12_Y0_N2
\pixel_row[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|pixel_row\(7),
	devoe => ww_devoe,
	o => ww_pixel_row(7));

-- Location: IOOBUF_X12_Y0_N36
\pixel_row[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|pixel_row\(8),
	devoe => ww_devoe,
	o => ww_pixel_row(8));

-- Location: IOOBUF_X46_Y45_N59
\pixel_row[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_pixel_row(9));

-- Location: IOOBUF_X11_Y0_N19
\pixel_column[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|pixel_column\(0),
	devoe => ww_devoe,
	o => ww_pixel_column(0));

-- Location: IOOBUF_X10_Y0_N42
\pixel_column[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|pixel_column\(1),
	devoe => ww_devoe,
	o => ww_pixel_column(1));

-- Location: IOOBUF_X18_Y0_N19
\pixel_column[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|pixel_column\(2),
	devoe => ww_devoe,
	o => ww_pixel_column(2));

-- Location: IOOBUF_X10_Y0_N59
\pixel_column[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|pixel_column\(3),
	devoe => ww_devoe,
	o => ww_pixel_column(3));

-- Location: IOOBUF_X11_Y0_N36
\pixel_column[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|pixel_column\(4),
	devoe => ww_devoe,
	o => ww_pixel_column(4));

-- Location: IOOBUF_X16_Y0_N93
\pixel_column[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|pixel_column\(5),
	devoe => ww_devoe,
	o => ww_pixel_column(5));

-- Location: IOOBUF_X14_Y0_N53
\pixel_column[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|pixel_column\(6),
	devoe => ww_devoe,
	o => ww_pixel_column(6));

-- Location: IOOBUF_X10_Y0_N93
\pixel_column[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|pixel_column\(7),
	devoe => ww_devoe,
	o => ww_pixel_column(7));

-- Location: IOOBUF_X18_Y0_N36
\pixel_column[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|pixel_column\(8),
	devoe => ww_devoe,
	o => ww_pixel_column(8));

-- Location: IOOBUF_X10_Y0_N76
\pixel_column[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga|pixel_column\(9),
	devoe => ww_devoe,
	o => ww_pixel_column(9));

-- Location: IOIBUF_X14_Y45_N1
\refclk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_refclk,
	o => \refclk~input_o\);

-- Location: PLLREFCLKSELECT_X0_Y44_N0
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT\ : cyclonev_pll_refclk_select
-- pragma translate_off
GENERIC MAP (
	pll_auto_clk_sw_en => "false",
	pll_clk_loss_edge => "both_edges",
	pll_clk_loss_sw_en => "false",
	pll_clk_sw_dly => 0,
	pll_clkin_0_src => "clk_0",
	pll_clkin_1_src => "ref_clk1",
	pll_manu_clk_sw_en => "false",
	pll_sw_refclk_src => "clk_0")
-- pragma translate_on
PORT MAP (
	clkin => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\,
	clkout => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	extswitchbuf => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\);

-- Location: IOIBUF_X8_Y45_N92
\rst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: FRACTIONALPLL_X0_Y38_N0
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL\ : cyclonev_fractional_pll
-- pragma translate_off
GENERIC MAP (
	dsm_accumulator_reset_value => 0,
	forcelock => "false",
	mimic_fbclk_type => "none",
	nreset_invert => "true",
	output_clock_frequency => "300.0 mhz",
	pll_atb => 0,
	pll_bwctrl => 4000,
	pll_cmp_buf_dly => "0 ps",
	pll_cp_comp => "true",
	pll_cp_current => 10,
	pll_ctrl_override_setting => "false",
	pll_dsm_dither => "disable",
	pll_dsm_out_sel => "disable",
	pll_dsm_reset => "false",
	pll_ecn_bypass => "false",
	pll_ecn_test_en => "false",
	pll_enable => "true",
	pll_fbclk_mux_1 => "glb",
	pll_fbclk_mux_2 => "m_cnt",
	pll_fractional_carry_out => 32,
	pll_fractional_division => 1,
	pll_fractional_division_string => "'0'",
	pll_fractional_value_ready => "true",
	pll_lf_testen => "false",
	pll_lock_fltr_cfg => 25,
	pll_lock_fltr_test => "false",
	pll_m_cnt_bypass_en => "false",
	pll_m_cnt_coarse_dly => "0 ps",
	pll_m_cnt_fine_dly => "0 ps",
	pll_m_cnt_hi_div => 6,
	pll_m_cnt_in_src => "ph_mux_clk",
	pll_m_cnt_lo_div => 6,
	pll_m_cnt_odd_div_duty_en => "false",
	pll_m_cnt_ph_mux_prst => 0,
	pll_m_cnt_prst => 1,
	pll_n_cnt_bypass_en => "false",
	pll_n_cnt_coarse_dly => "0 ps",
	pll_n_cnt_fine_dly => "0 ps",
	pll_n_cnt_hi_div => 1,
	pll_n_cnt_lo_div => 1,
	pll_n_cnt_odd_div_duty_en => "false",
	pll_ref_buf_dly => "0 ps",
	pll_reg_boost => 0,
	pll_regulator_bypass => "false",
	pll_ripplecap_ctrl => 0,
	pll_slf_rst => "false",
	pll_tclk_mux_en => "false",
	pll_tclk_sel => "n_src",
	pll_test_enable => "false",
	pll_testdn_enable => "false",
	pll_testup_enable => "false",
	pll_unlock_fltr_cfg => 2,
	pll_vco_div => 2,
	pll_vco_ph0_en => "true",
	pll_vco_ph1_en => "true",
	pll_vco_ph2_en => "true",
	pll_vco_ph3_en => "true",
	pll_vco_ph4_en => "true",
	pll_vco_ph5_en => "true",
	pll_vco_ph6_en => "true",
	pll_vco_ph7_en => "true",
	pll_vctrl_test_voltage => 750,
	reference_clock_frequency => "50.0 mhz",
	vccd0g_atb => "disable",
	vccd0g_output => 0,
	vccd1g_atb => "disable",
	vccd1g_output => 0,
	vccm1g_tap => 2,
	vccr_pd => "false",
	vcodiv_override => "false",
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	coreclkfb => \pll|dp_clk_inst|altera_pll_i|fboutclk_wire\(0),
	ecnc1test => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\,
	nresync => \rst~input_o\,
	refclkin => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	shift => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftdonein => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	cntnen => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	fbclk => \pll|dp_clk_inst|altera_pll_i|fboutclk_wire\(0),
	lock => \pll|dp_clk_inst|altera_pll_i|locked_wire\(0),
	tclk => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	vcoph => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\,
	mhi => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\);

-- Location: PLLRECONFIG_X0_Y42_N0
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG\ : cyclonev_pll_reconfig
-- pragma translate_off
GENERIC MAP (
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	cntnen => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	mhi => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\,
	shift => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftenm => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	shiften => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\);

-- Location: PLLOUTPUTCOUNTER_X0_Y39_N1
\pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER\ : cyclonev_pll_output_counter
-- pragma translate_off
GENERIC MAP (
	c_cnt_coarse_dly => "0 ps",
	c_cnt_fine_dly => "0 ps",
	c_cnt_in_src => "ph_mux_clk",
	c_cnt_ph_mux_prst => 0,
	c_cnt_prst => 1,
	cnt_fpll_src => "fpll_0",
	dprio0_cnt_bypass_en => "false",
	dprio0_cnt_hi_div => 6,
	dprio0_cnt_lo_div => 6,
	dprio0_cnt_odd_div_even_duty_en => "false",
	duty_cycle => 50,
	output_clock_frequency => "25.0 mhz",
	phase_shift => "0 ps",
  fractional_pll_index => 0,
  output_counter_index => 6)
-- pragma translate_on
PORT MAP (
	nen0 => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	shift0 => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\,
	tclk0 => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	up0 => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	vco0ph => \pll|dp_clk_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\,
	divclk => \pll|dp_clk_inst|altera_pll_i|outclk_wire\(0));

-- Location: CLKCTRL_G13
\pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \pll|dp_clk_inst|altera_pll_i|outclk_wire\(0),
	outclk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\);

-- Location: IOIBUF_X16_Y0_N41
\red~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_red,
	o => \red~input_o\);

-- Location: LABCELL_X10_Y1_N0
\vga|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add0~1_sumout\ = SUM(( \vga|h_count\(0) ) + ( VCC ) + ( !VCC ))
-- \vga|Add0~2\ = CARRY(( \vga|h_count\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_h_count\(0),
	cin => GND,
	sumout => \vga|Add0~1_sumout\,
	cout => \vga|Add0~2\);

-- Location: LABCELL_X10_Y1_N48
\vga|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Equal0~0_combout\ = ( \vga|h_count\(0) & ( !\vga|h_count\(6) & ( (\vga|h_count\(1) & (\vga|h_count\(3) & (\vga|h_count\(9) & \vga|h_count\(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga|ALT_INV_h_count\(1),
	datab => \vga|ALT_INV_h_count\(3),
	datac => \vga|ALT_INV_h_count\(9),
	datad => \vga|ALT_INV_h_count\(4),
	datae => \vga|ALT_INV_h_count\(0),
	dataf => \vga|ALT_INV_h_count\(6),
	combout => \vga|Equal0~0_combout\);

-- Location: LABCELL_X10_Y1_N54
\vga|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Equal0~1_combout\ = ( !\vga|h_count\(5) & ( (!\vga|h_count\(7) & (\vga|h_count\(8) & (\vga|Equal0~0_combout\ & \vga|h_count\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000010000000000000001000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga|ALT_INV_h_count\(7),
	datab => \vga|ALT_INV_h_count\(8),
	datac => \vga|ALT_INV_Equal0~0_combout\,
	datad => \vga|ALT_INV_h_count\(2),
	dataf => \vga|ALT_INV_h_count\(5),
	combout => \vga|Equal0~1_combout\);

-- Location: FF_X10_Y1_N2
\vga|h_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add0~1_sumout\,
	sclr => \vga|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|h_count\(0));

-- Location: LABCELL_X10_Y1_N3
\vga|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add0~17_sumout\ = SUM(( \vga|h_count\(1) ) + ( GND ) + ( \vga|Add0~2\ ))
-- \vga|Add0~18\ = CARRY(( \vga|h_count\(1) ) + ( GND ) + ( \vga|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_h_count\(1),
	cin => \vga|Add0~2\,
	sumout => \vga|Add0~17_sumout\,
	cout => \vga|Add0~18\);

-- Location: FF_X10_Y1_N5
\vga|h_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add0~17_sumout\,
	sclr => \vga|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|h_count\(1));

-- Location: LABCELL_X10_Y1_N6
\vga|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add0~21_sumout\ = SUM(( \vga|h_count\(2) ) + ( GND ) + ( \vga|Add0~18\ ))
-- \vga|Add0~22\ = CARRY(( \vga|h_count\(2) ) + ( GND ) + ( \vga|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_h_count\(2),
	cin => \vga|Add0~18\,
	sumout => \vga|Add0~21_sumout\,
	cout => \vga|Add0~22\);

-- Location: FF_X10_Y1_N7
\vga|h_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add0~21_sumout\,
	sclr => \vga|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|h_count\(2));

-- Location: LABCELL_X10_Y1_N9
\vga|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add0~25_sumout\ = SUM(( \vga|h_count\(3) ) + ( GND ) + ( \vga|Add0~22\ ))
-- \vga|Add0~26\ = CARRY(( \vga|h_count\(3) ) + ( GND ) + ( \vga|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_h_count\(3),
	cin => \vga|Add0~22\,
	sumout => \vga|Add0~25_sumout\,
	cout => \vga|Add0~26\);

-- Location: FF_X10_Y1_N11
\vga|h_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add0~25_sumout\,
	sclr => \vga|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|h_count\(3));

-- Location: LABCELL_X10_Y1_N12
\vga|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add0~29_sumout\ = SUM(( \vga|h_count\(4) ) + ( GND ) + ( \vga|Add0~26\ ))
-- \vga|Add0~30\ = CARRY(( \vga|h_count\(4) ) + ( GND ) + ( \vga|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_h_count\(4),
	cin => \vga|Add0~26\,
	sumout => \vga|Add0~29_sumout\,
	cout => \vga|Add0~30\);

-- Location: FF_X10_Y1_N14
\vga|h_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add0~29_sumout\,
	sclr => \vga|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|h_count\(4));

-- Location: LABCELL_X10_Y1_N15
\vga|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add0~33_sumout\ = SUM(( \vga|h_count\(5) ) + ( GND ) + ( \vga|Add0~30\ ))
-- \vga|Add0~34\ = CARRY(( \vga|h_count\(5) ) + ( GND ) + ( \vga|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_h_count\(5),
	cin => \vga|Add0~30\,
	sumout => \vga|Add0~33_sumout\,
	cout => \vga|Add0~34\);

-- Location: FF_X10_Y1_N16
\vga|h_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add0~33_sumout\,
	sclr => \vga|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|h_count\(5));

-- Location: LABCELL_X10_Y1_N18
\vga|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add0~37_sumout\ = SUM(( \vga|h_count\(6) ) + ( GND ) + ( \vga|Add0~34\ ))
-- \vga|Add0~38\ = CARRY(( \vga|h_count\(6) ) + ( GND ) + ( \vga|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_h_count\(6),
	cin => \vga|Add0~34\,
	sumout => \vga|Add0~37_sumout\,
	cout => \vga|Add0~38\);

-- Location: FF_X10_Y1_N20
\vga|h_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add0~37_sumout\,
	sclr => \vga|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|h_count\(6));

-- Location: LABCELL_X10_Y1_N21
\vga|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add0~9_sumout\ = SUM(( \vga|h_count\(7) ) + ( GND ) + ( \vga|Add0~38\ ))
-- \vga|Add0~10\ = CARRY(( \vga|h_count\(7) ) + ( GND ) + ( \vga|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_h_count\(7),
	cin => \vga|Add0~38\,
	sumout => \vga|Add0~9_sumout\,
	cout => \vga|Add0~10\);

-- Location: FF_X10_Y1_N23
\vga|h_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add0~9_sumout\,
	sclr => \vga|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|h_count\(7));

-- Location: LABCELL_X10_Y1_N24
\vga|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add0~13_sumout\ = SUM(( \vga|h_count\(8) ) + ( GND ) + ( \vga|Add0~10\ ))
-- \vga|Add0~14\ = CARRY(( \vga|h_count\(8) ) + ( GND ) + ( \vga|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_h_count\(8),
	cin => \vga|Add0~10\,
	sumout => \vga|Add0~13_sumout\,
	cout => \vga|Add0~14\);

-- Location: FF_X10_Y1_N25
\vga|h_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add0~13_sumout\,
	sclr => \vga|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|h_count\(8));

-- Location: LABCELL_X10_Y1_N27
\vga|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add0~5_sumout\ = SUM(( \vga|h_count\(9) ) + ( GND ) + ( \vga|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_h_count\(9),
	cin => \vga|Add0~14\,
	sumout => \vga|Add0~5_sumout\);

-- Location: FF_X10_Y1_N29
\vga|h_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add0~5_sumout\,
	sclr => \vga|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|h_count\(9));

-- Location: FF_X10_Y1_N22
\vga|h_count[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add0~9_sumout\,
	sclr => \vga|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|h_count[7]~DUPLICATE_q\);

-- Location: LABCELL_X10_Y1_N45
\vga|process_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|process_0~0_combout\ = ( \vga|h_count[7]~DUPLICATE_q\ & ( !\vga|h_count\(9) ) ) # ( !\vga|h_count[7]~DUPLICATE_q\ & ( (!\vga|h_count\(9)) # (!\vga|h_count\(8)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101011111010111110101111101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga|ALT_INV_h_count\(9),
	datac => \vga|ALT_INV_h_count\(8),
	dataf => \vga|ALT_INV_h_count[7]~DUPLICATE_q\,
	combout => \vga|process_0~0_combout\);

-- Location: FF_X13_Y1_N10
\vga|video_on_h~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \vga|process_0~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|video_on_h~DUPLICATE_q\);

-- Location: LABCELL_X12_Y1_N30
\vga|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add1~1_sumout\ = SUM(( \vga|v_count\(0) ) + ( VCC ) + ( !VCC ))
-- \vga|Add1~2\ = CARRY(( \vga|v_count\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_v_count\(0),
	cin => GND,
	sumout => \vga|Add1~1_sumout\,
	cout => \vga|Add1~2\);

-- Location: LABCELL_X12_Y1_N9
\vga|process_0~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|process_0~7_combout\ = ( !\vga|v_count\(6) & ( (!\vga|v_count\(7) & (!\vga|v_count\(8) & (!\vga|v_count\(4) & !\vga|v_count\(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga|ALT_INV_v_count\(7),
	datab => \vga|ALT_INV_v_count\(8),
	datac => \vga|ALT_INV_v_count\(4),
	datad => \vga|ALT_INV_v_count\(5),
	dataf => \vga|ALT_INV_v_count\(6),
	combout => \vga|process_0~7_combout\);

-- Location: FF_X10_Y1_N19
\vga|h_count[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add0~37_sumout\,
	sclr => \vga|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|h_count[6]~DUPLICATE_q\);

-- Location: MLABCELL_X13_Y1_N48
\vga|process_0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|process_0~9_combout\ = ( !\vga|h_count[6]~DUPLICATE_q\ & ( !\vga|h_count\(8) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \vga|ALT_INV_h_count\(8),
	dataf => \vga|ALT_INV_h_count[6]~DUPLICATE_q\,
	combout => \vga|process_0~9_combout\);

-- Location: LABCELL_X12_Y1_N21
\vga|process_0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|process_0~5_combout\ = (\vga|v_count\(3) & \vga|v_count\(2))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \vga|ALT_INV_v_count\(3),
	datad => \vga|ALT_INV_v_count\(2),
	combout => \vga|process_0~5_combout\);

-- Location: LABCELL_X10_Y1_N36
\vga|process_0~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|process_0~8_combout\ = ( \vga|h_count\(0) & ( \vga|h_count\(3) & ( (\vga|h_count\(4) & (\vga|h_count\(5) & ((\vga|h_count\(1)) # (\vga|h_count\(2))))) ) ) ) # ( !\vga|h_count\(0) & ( \vga|h_count\(3) & ( (\vga|h_count\(2) & (\vga|h_count\(4) & 
-- \vga|h_count\(5))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000100010000000000010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga|ALT_INV_h_count\(2),
	datab => \vga|ALT_INV_h_count\(4),
	datac => \vga|ALT_INV_h_count\(1),
	datad => \vga|ALT_INV_h_count\(5),
	datae => \vga|ALT_INV_h_count\(0),
	dataf => \vga|ALT_INV_h_count\(3),
	combout => \vga|process_0~8_combout\);

-- Location: LABCELL_X12_Y1_N12
\vga|process_0~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|process_0~10_combout\ = ( \vga|process_0~5_combout\ & ( \vga|process_0~8_combout\ & ( (!\vga|process_0~0_combout\ & \vga|v_count\(9)) ) ) ) # ( !\vga|process_0~5_combout\ & ( \vga|process_0~8_combout\ & ( (!\vga|process_0~0_combout\ & 
-- (!\vga|process_0~7_combout\ & \vga|v_count\(9))) ) ) ) # ( \vga|process_0~5_combout\ & ( !\vga|process_0~8_combout\ & ( (!\vga|process_0~0_combout\ & (\vga|v_count\(9) & !\vga|process_0~9_combout\)) ) ) ) # ( !\vga|process_0~5_combout\ & ( 
-- !\vga|process_0~8_combout\ & ( (!\vga|process_0~0_combout\ & (!\vga|process_0~7_combout\ & (\vga|v_count\(9) & !\vga|process_0~9_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000010100000000000001000000010000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga|ALT_INV_process_0~0_combout\,
	datab => \vga|ALT_INV_process_0~7_combout\,
	datac => \vga|ALT_INV_v_count\(9),
	datad => \vga|ALT_INV_process_0~9_combout\,
	datae => \vga|ALT_INV_process_0~5_combout\,
	dataf => \vga|ALT_INV_process_0~8_combout\,
	combout => \vga|process_0~10_combout\);

-- Location: LABCELL_X12_Y1_N0
\vga|v_count[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|v_count[0]~0_combout\ = ( \vga|h_count\(8) & ( \vga|process_0~10_combout\ ) ) # ( !\vga|h_count\(8) & ( \vga|process_0~10_combout\ ) ) # ( !\vga|h_count\(8) & ( !\vga|process_0~10_combout\ & ( (\vga|h_count\(5) & (!\vga|h_count\(2) & 
-- (\vga|h_count[7]~DUPLICATE_q\ & \vga|Equal0~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga|ALT_INV_h_count\(5),
	datab => \vga|ALT_INV_h_count\(2),
	datac => \vga|ALT_INV_h_count[7]~DUPLICATE_q\,
	datad => \vga|ALT_INV_Equal0~0_combout\,
	datae => \vga|ALT_INV_h_count\(8),
	dataf => \vga|ALT_INV_process_0~10_combout\,
	combout => \vga|v_count[0]~0_combout\);

-- Location: FF_X12_Y1_N31
\vga|v_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add1~1_sumout\,
	sclr => \vga|process_0~10_combout\,
	ena => \vga|v_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|v_count\(0));

-- Location: LABCELL_X12_Y1_N33
\vga|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add1~25_sumout\ = SUM(( \vga|v_count\(1) ) + ( GND ) + ( \vga|Add1~2\ ))
-- \vga|Add1~26\ = CARRY(( \vga|v_count\(1) ) + ( GND ) + ( \vga|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_v_count\(1),
	cin => \vga|Add1~2\,
	sumout => \vga|Add1~25_sumout\,
	cout => \vga|Add1~26\);

-- Location: FF_X12_Y1_N35
\vga|v_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add1~25_sumout\,
	sclr => \vga|process_0~10_combout\,
	ena => \vga|v_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|v_count\(1));

-- Location: LABCELL_X12_Y1_N36
\vga|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add1~29_sumout\ = SUM(( \vga|v_count\(2) ) + ( GND ) + ( \vga|Add1~26\ ))
-- \vga|Add1~30\ = CARRY(( \vga|v_count\(2) ) + ( GND ) + ( \vga|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_v_count\(2),
	cin => \vga|Add1~26\,
	sumout => \vga|Add1~29_sumout\,
	cout => \vga|Add1~30\);

-- Location: FF_X12_Y1_N38
\vga|v_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add1~29_sumout\,
	sclr => \vga|process_0~10_combout\,
	ena => \vga|v_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|v_count\(2));

-- Location: LABCELL_X12_Y1_N39
\vga|Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add1~33_sumout\ = SUM(( \vga|v_count\(3) ) + ( GND ) + ( \vga|Add1~30\ ))
-- \vga|Add1~34\ = CARRY(( \vga|v_count\(3) ) + ( GND ) + ( \vga|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_v_count\(3),
	cin => \vga|Add1~30\,
	sumout => \vga|Add1~33_sumout\,
	cout => \vga|Add1~34\);

-- Location: FF_X12_Y1_N40
\vga|v_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add1~33_sumout\,
	sclr => \vga|process_0~10_combout\,
	ena => \vga|v_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|v_count\(3));

-- Location: LABCELL_X12_Y1_N42
\vga|Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add1~37_sumout\ = SUM(( \vga|v_count\(4) ) + ( GND ) + ( \vga|Add1~34\ ))
-- \vga|Add1~38\ = CARRY(( \vga|v_count\(4) ) + ( GND ) + ( \vga|Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_v_count\(4),
	cin => \vga|Add1~34\,
	sumout => \vga|Add1~37_sumout\,
	cout => \vga|Add1~38\);

-- Location: FF_X12_Y1_N44
\vga|v_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add1~37_sumout\,
	sclr => \vga|process_0~10_combout\,
	ena => \vga|v_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|v_count\(4));

-- Location: LABCELL_X12_Y1_N45
\vga|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add1~17_sumout\ = SUM(( \vga|v_count\(5) ) + ( GND ) + ( \vga|Add1~38\ ))
-- \vga|Add1~18\ = CARRY(( \vga|v_count\(5) ) + ( GND ) + ( \vga|Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_v_count\(5),
	cin => \vga|Add1~38\,
	sumout => \vga|Add1~17_sumout\,
	cout => \vga|Add1~18\);

-- Location: FF_X12_Y1_N46
\vga|v_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add1~17_sumout\,
	sclr => \vga|process_0~10_combout\,
	ena => \vga|v_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|v_count\(5));

-- Location: LABCELL_X12_Y1_N48
\vga|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add1~21_sumout\ = SUM(( \vga|v_count\(6) ) + ( GND ) + ( \vga|Add1~18\ ))
-- \vga|Add1~22\ = CARRY(( \vga|v_count\(6) ) + ( GND ) + ( \vga|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_v_count\(6),
	cin => \vga|Add1~18\,
	sumout => \vga|Add1~21_sumout\,
	cout => \vga|Add1~22\);

-- Location: FF_X12_Y1_N50
\vga|v_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add1~21_sumout\,
	sclr => \vga|process_0~10_combout\,
	ena => \vga|v_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|v_count\(6));

-- Location: LABCELL_X12_Y1_N51
\vga|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add1~13_sumout\ = SUM(( \vga|v_count\(7) ) + ( GND ) + ( \vga|Add1~22\ ))
-- \vga|Add1~14\ = CARRY(( \vga|v_count\(7) ) + ( GND ) + ( \vga|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_v_count\(7),
	cin => \vga|Add1~22\,
	sumout => \vga|Add1~13_sumout\,
	cout => \vga|Add1~14\);

-- Location: FF_X12_Y1_N53
\vga|v_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add1~13_sumout\,
	sclr => \vga|process_0~10_combout\,
	ena => \vga|v_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|v_count\(7));

-- Location: LABCELL_X12_Y1_N54
\vga|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add1~9_sumout\ = SUM(( \vga|v_count\(8) ) + ( GND ) + ( \vga|Add1~14\ ))
-- \vga|Add1~10\ = CARRY(( \vga|v_count\(8) ) + ( GND ) + ( \vga|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_v_count\(8),
	cin => \vga|Add1~14\,
	sumout => \vga|Add1~9_sumout\,
	cout => \vga|Add1~10\);

-- Location: FF_X12_Y1_N55
\vga|v_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add1~9_sumout\,
	sclr => \vga|process_0~10_combout\,
	ena => \vga|v_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|v_count\(8));

-- Location: LABCELL_X12_Y1_N57
\vga|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|Add1~5_sumout\ = SUM(( \vga|v_count\(9) ) + ( GND ) + ( \vga|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga|ALT_INV_v_count\(9),
	cin => \vga|Add1~10\,
	sumout => \vga|Add1~5_sumout\);

-- Location: FF_X12_Y1_N59
\vga|v_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add1~5_sumout\,
	sclr => \vga|process_0~10_combout\,
	ena => \vga|v_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|v_count\(9));

-- Location: LABCELL_X12_Y1_N18
\vga|LessThan7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|LessThan7~0_combout\ = ( \vga|v_count\(7) & ( (!\vga|v_count\(9) & ((!\vga|v_count\(5)) # ((!\vga|v_count\(6)) # (!\vga|v_count\(8))))) ) ) # ( !\vga|v_count\(7) & ( !\vga|v_count\(9) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010001010101010101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga|ALT_INV_v_count\(9),
	datab => \vga|ALT_INV_v_count\(5),
	datac => \vga|ALT_INV_v_count\(6),
	datad => \vga|ALT_INV_v_count\(8),
	dataf => \vga|ALT_INV_v_count\(7),
	combout => \vga|LessThan7~0_combout\);

-- Location: MLABCELL_X13_Y1_N27
\vga|video_on_v~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|video_on_v~feeder_combout\ = ( \vga|LessThan7~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \vga|ALT_INV_LessThan7~0_combout\,
	combout => \vga|video_on_v~feeder_combout\);

-- Location: FF_X13_Y1_N28
\vga|video_on_v\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|video_on_v~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|video_on_v~q\);

-- Location: MLABCELL_X13_Y1_N0
\vga|red_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|red_out~0_combout\ = ( \vga|video_on_v~q\ & ( (\red~input_o\ & \vga|video_on_h~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_red~input_o\,
	datad => \vga|ALT_INV_video_on_h~DUPLICATE_q\,
	dataf => \vga|ALT_INV_video_on_v~q\,
	combout => \vga|red_out~0_combout\);

-- Location: FF_X13_Y1_N2
\vga|red_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|red_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|red_out~q\);

-- Location: FF_X13_Y1_N11
\vga|video_on_h\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \vga|process_0~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|video_on_h~q\);

-- Location: IOIBUF_X19_Y0_N1
\green~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_green,
	o => \green~input_o\);

-- Location: MLABCELL_X13_Y1_N3
\vga|green_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|green_out~0_combout\ = ( \vga|video_on_v~q\ & ( (\vga|video_on_h~q\ & \green~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \vga|ALT_INV_video_on_h~q\,
	datad => \ALT_INV_green~input_o\,
	dataf => \vga|ALT_INV_video_on_v~q\,
	combout => \vga|green_out~0_combout\);

-- Location: FF_X13_Y1_N4
\vga|green_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|green_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|green_out~q\);

-- Location: IOIBUF_X19_Y0_N18
\blue~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_blue,
	o => \blue~input_o\);

-- Location: MLABCELL_X13_Y1_N6
\vga|blue_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|blue_out~0_combout\ = ( \vga|video_on_h~DUPLICATE_q\ & ( \vga|video_on_v~q\ & ( \blue~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_blue~input_o\,
	datae => \vga|ALT_INV_video_on_h~DUPLICATE_q\,
	dataf => \vga|ALT_INV_video_on_v~q\,
	combout => \vga|blue_out~0_combout\);

-- Location: FF_X13_Y1_N7
\vga|blue_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|blue_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|blue_out~q\);

-- Location: LABCELL_X10_Y1_N42
\vga|process_0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|process_0~1_combout\ = (!\vga|h_count\(3) & !\vga|h_count\(2))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000110000001100000011000000110000001100000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \vga|ALT_INV_h_count\(3),
	datac => \vga|ALT_INV_h_count\(2),
	combout => \vga|process_0~1_combout\);

-- Location: LABCELL_X10_Y1_N57
\vga|process_0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|process_0~3_combout\ = ( !\vga|h_count\(8) & ( (\vga|h_count[7]~DUPLICATE_q\ & \vga|h_count\(9)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \vga|ALT_INV_h_count[7]~DUPLICATE_q\,
	datad => \vga|ALT_INV_h_count\(9),
	dataf => \vga|ALT_INV_h_count\(8),
	combout => \vga|process_0~3_combout\);

-- Location: FF_X10_Y1_N13
\vga|h_count[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add0~29_sumout\,
	sclr => \vga|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|h_count[4]~DUPLICATE_q\);

-- Location: LABCELL_X10_Y1_N30
\vga|process_0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|process_0~2_combout\ = ( \vga|h_count\(0) & ( !\vga|h_count\(6) & ( (!\vga|h_count\(2) & (!\vga|h_count\(3) & (!\vga|h_count\(1) & !\vga|h_count\(5)))) ) ) ) # ( !\vga|h_count\(0) & ( !\vga|h_count\(6) & ( (!\vga|h_count\(2) & (!\vga|h_count\(3) & 
-- !\vga|h_count\(5))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga|ALT_INV_h_count\(2),
	datab => \vga|ALT_INV_h_count\(3),
	datac => \vga|ALT_INV_h_count\(1),
	datad => \vga|ALT_INV_h_count\(5),
	datae => \vga|ALT_INV_h_count\(0),
	dataf => \vga|ALT_INV_h_count\(6),
	combout => \vga|process_0~2_combout\);

-- Location: MLABCELL_X13_Y1_N12
\vga|process_0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|process_0~4_combout\ = ( \vga|h_count[4]~DUPLICATE_q\ & ( \vga|process_0~2_combout\ ) ) # ( !\vga|h_count[4]~DUPLICATE_q\ & ( \vga|process_0~2_combout\ ) ) # ( \vga|h_count[4]~DUPLICATE_q\ & ( !\vga|process_0~2_combout\ & ( 
-- (!\vga|process_0~3_combout\) # ((!\vga|process_0~1_combout\ & (\vga|h_count\(5) & \vga|h_count[6]~DUPLICATE_q\))) ) ) ) # ( !\vga|h_count[4]~DUPLICATE_q\ & ( !\vga|process_0~2_combout\ & ( (!\vga|process_0~3_combout\) # ((!\vga|h_count\(5) & 
-- !\vga|h_count[6]~DUPLICATE_q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110011001100110011001100111011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga|ALT_INV_process_0~1_combout\,
	datab => \vga|ALT_INV_process_0~3_combout\,
	datac => \vga|ALT_INV_h_count\(5),
	datad => \vga|ALT_INV_h_count[6]~DUPLICATE_q\,
	datae => \vga|ALT_INV_h_count[4]~DUPLICATE_q\,
	dataf => \vga|ALT_INV_process_0~2_combout\,
	combout => \vga|process_0~4_combout\);

-- Location: FF_X13_Y1_N13
\vga|horiz_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|process_0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|horiz_sync~q\);

-- Location: FF_X13_Y1_N16
\vga|horiz_sync_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \vga|horiz_sync~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|horiz_sync_out~q\);

-- Location: LABCELL_X12_Y1_N6
\vga|LessThan7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|LessThan7~1_combout\ = (\vga|v_count\(7) & (\vga|v_count\(8) & (\vga|v_count\(6) & \vga|v_count\(5))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000100000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga|ALT_INV_v_count\(7),
	datab => \vga|ALT_INV_v_count\(8),
	datac => \vga|ALT_INV_v_count\(6),
	datad => \vga|ALT_INV_v_count\(5),
	combout => \vga|LessThan7~1_combout\);

-- Location: LABCELL_X12_Y1_N24
\vga|process_0~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|process_0~6_combout\ = ( \vga|LessThan7~1_combout\ & ( \vga|v_count\(0) & ( (!\vga|process_0~5_combout\) # (((\vga|v_count\(9)) # (\vga|v_count\(1))) # (\vga|v_count\(4))) ) ) ) # ( !\vga|LessThan7~1_combout\ & ( \vga|v_count\(0) ) ) # ( 
-- \vga|LessThan7~1_combout\ & ( !\vga|v_count\(0) & ( (!\vga|process_0~5_combout\) # (((!\vga|v_count\(1)) # (\vga|v_count\(9))) # (\vga|v_count\(4))) ) ) ) # ( !\vga|LessThan7~1_combout\ & ( !\vga|v_count\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111110111111111111111111111111111011111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga|ALT_INV_process_0~5_combout\,
	datab => \vga|ALT_INV_v_count\(4),
	datac => \vga|ALT_INV_v_count\(1),
	datad => \vga|ALT_INV_v_count\(9),
	datae => \vga|ALT_INV_LessThan7~1_combout\,
	dataf => \vga|ALT_INV_v_count\(0),
	combout => \vga|process_0~6_combout\);

-- Location: FF_X12_Y1_N26
\vga|vert_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|process_0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|vert_sync~q\);

-- Location: LABCELL_X1_Y18_N0
\vga|vert_sync_out~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|vert_sync_out~feeder_combout\ = ( \vga|vert_sync~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \vga|ALT_INV_vert_sync~q\,
	combout => \vga|vert_sync_out~feeder_combout\);

-- Location: FF_X1_Y18_N2
\vga|vert_sync_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|vert_sync_out~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|vert_sync_out~q\);

-- Location: MLABCELL_X13_Y1_N18
\vga|pixel_row[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|pixel_row[0]~feeder_combout\ = ( \vga|v_count\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \vga|ALT_INV_v_count\(0),
	combout => \vga|pixel_row[0]~feeder_combout\);

-- Location: FF_X13_Y1_N19
\vga|pixel_row[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|pixel_row[0]~feeder_combout\,
	ena => \vga|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|pixel_row\(0));

-- Location: FF_X12_Y1_N34
\vga|v_count[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|Add1~25_sumout\,
	sclr => \vga|process_0~10_combout\,
	ena => \vga|v_count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|v_count[1]~DUPLICATE_q\);

-- Location: FF_X13_Y1_N22
\vga|pixel_row[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \vga|v_count[1]~DUPLICATE_q\,
	sload => VCC,
	ena => \vga|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|pixel_row\(1));

-- Location: FF_X12_Y1_N1
\vga|pixel_row[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \vga|v_count\(2),
	sload => VCC,
	ena => \vga|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|pixel_row\(2));

-- Location: MLABCELL_X13_Y1_N54
\vga|pixel_row[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|pixel_row[3]~feeder_combout\ = ( \vga|v_count\(3) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \vga|ALT_INV_v_count\(3),
	combout => \vga|pixel_row[3]~feeder_combout\);

-- Location: FF_X13_Y1_N56
\vga|pixel_row[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|pixel_row[3]~feeder_combout\,
	ena => \vga|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|pixel_row\(3));

-- Location: FF_X12_Y1_N10
\vga|pixel_row[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \vga|v_count\(4),
	sload => VCC,
	ena => \vga|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|pixel_row\(4));

-- Location: FF_X12_Y1_N16
\vga|pixel_row[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \vga|v_count\(5),
	sload => VCC,
	ena => \vga|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|pixel_row\(5));

-- Location: FF_X12_Y1_N8
\vga|pixel_row[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \vga|v_count\(6),
	sload => VCC,
	ena => \vga|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|pixel_row\(6));

-- Location: FF_X12_Y1_N22
\vga|pixel_row[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \vga|v_count\(7),
	sload => VCC,
	ena => \vga|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|pixel_row\(7));

-- Location: FF_X12_Y1_N4
\vga|pixel_row[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \vga|v_count\(8),
	sload => VCC,
	ena => \vga|LessThan7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|pixel_row\(8));

-- Location: FF_X10_Y1_N31
\vga|pixel_column[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \vga|h_count\(0),
	sload => VCC,
	ena => \vga|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|pixel_column\(0));

-- Location: FF_X10_Y1_N35
\vga|pixel_column[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \vga|h_count\(1),
	sload => VCC,
	ena => \vga|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|pixel_column\(1));

-- Location: MLABCELL_X13_Y1_N30
\vga|pixel_column[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|pixel_column[2]~feeder_combout\ = ( \vga|h_count\(2) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \vga|ALT_INV_h_count\(2),
	combout => \vga|pixel_column[2]~feeder_combout\);

-- Location: FF_X13_Y1_N31
\vga|pixel_column[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|pixel_column[2]~feeder_combout\,
	ena => \vga|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|pixel_column\(2));

-- Location: FF_X10_Y1_N40
\vga|pixel_column[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \vga|h_count\(3),
	sload => VCC,
	ena => \vga|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|pixel_column\(3));

-- Location: FF_X13_Y1_N40
\vga|pixel_column[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \vga|h_count[4]~DUPLICATE_q\,
	sload => VCC,
	ena => \vga|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|pixel_column\(4));

-- Location: FF_X13_Y1_N43
\vga|pixel_column[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \vga|h_count\(5),
	sload => VCC,
	ena => \vga|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|pixel_column\(5));

-- Location: FF_X13_Y1_N52
\vga|pixel_column[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \vga|h_count[6]~DUPLICATE_q\,
	sload => VCC,
	ena => \vga|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|pixel_column\(6));

-- Location: FF_X10_Y1_N43
\vga|pixel_column[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \vga|h_count[7]~DUPLICATE_q\,
	sload => VCC,
	ena => \vga|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|pixel_column\(7));

-- Location: MLABCELL_X13_Y1_N36
\vga|pixel_column[8]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga|pixel_column[8]~feeder_combout\ = ( \vga|h_count\(8) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \vga|ALT_INV_h_count\(8),
	combout => \vga|pixel_column[8]~feeder_combout\);

-- Location: FF_X13_Y1_N37
\vga|pixel_column[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \vga|pixel_column[8]~feeder_combout\,
	ena => \vga|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|pixel_column\(8));

-- Location: FF_X10_Y1_N52
\vga|pixel_column[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|dp_clk_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \vga|h_count\(9),
	sload => VCC,
	ena => \vga|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga|pixel_column\(9));

-- Location: MLABCELL_X49_Y21_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;


pll_reconfig_inst_tasks : altera_pll_reconfig_tasks
-- pragma translate_off
GENERIC MAP (
      number_of_fplls => 1);
-- pragma translate_on
END structure;


