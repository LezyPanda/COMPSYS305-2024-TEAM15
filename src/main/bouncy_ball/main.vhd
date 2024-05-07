library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity main is
	port(
		clock50, reset, pb1, pb2 : in std_logic;
		rO, gO, bO : out std_logic;
		horizSyncO, vertSyncO : out std_logic
	);
end entity main;


architecture amain of main is
	
	component DP_CLK is
		port (
			refclk   : in  std_logic := 'X'; -- clk
			rst      : in  std_logic := 'X'; -- reset
			outclk_0 : out std_logic;        -- clk
			locked   : out std_logic         -- export
		);
	end component;
	
	component vga_sync is
		PORT(	clock_25Mhz, red, green, blue		: IN	STD_LOGIC;
			red_out, green_out, blue_out, horiz_sync_out, vert_sync_out	: OUT	STD_LOGIC;
			pixel_row, pixel_column: OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
	end component;
	
	component bouncy_ball is
		PORT
		( pb1, pb2, clk, vert_sync	: IN std_logic;
          pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
		  red, green, blue 			: OUT std_logic);		
	end component;

	signal clock25, locked : std_logic := '0';
	signal rI, gI, bI : std_logic := '0';
	signal vertSyncI, vertSyncO2 : std_logic := '0';
	signal pixelRow, pixelColumn : std_logic_vector(9 downto 0);
	signal rO2, gO2, bO2 : std_logic := '0';
begin
	
	dummy : DP_CLK port map(clock50, reset, clock25, locked);
	dummy2 : vga_sync port map(clock25, rI, gI, bI, rO, gO, bO, horizSyncO, vertSyncO2, pixelRow, pixelColumn);
	dummy3 : bouncy_ball port map(pb1, pb2, clock25, vertSyncI, pixelRow, pixelColumn, rO2, gO2, bO2);
	
	process (clock25)
	begin
		if (rising_edge(clock25)) then
			rI <= rO2;
			gI <= gO2;
			bI <= bO2;
			vertSyncI <= vertSyncO2;
			vertSyncO <= vertSyncO2;
		end if;
	end process;

end architecture amain;