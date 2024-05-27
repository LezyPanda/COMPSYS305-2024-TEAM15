library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity main_d is
    port (
        refclk   : in  std_logic := 'X'; -- clk
        rst      : in  std_logic := 'X'; -- reset
        locked   : out std_logic;        -- export
        red, green, blue : in std_logic;
        red_out, green_out, blue_out, horiz_sync_out, vert_sync_out : out std_logic;
        pixel_row, pixel_column: out std_logic_vector(9 DOWNTO 0)
    );
end main_d;

architecture a of main_d is
    signal outclk_0 : std_logic;
    component DP_CLK is
        port (
            refclk   : in  std_logic := 'X'; -- clk
            rst      : in  std_logic := 'X'; -- reset
            outclk_0 : out std_logic;        -- clk
            locked   : out std_logic         -- export
        );
    end component DP_CLK;

    component VGA_SYNC is
        port (
            clock_25Mhz, red, green, blue : in std_logic;
            red_out, green_out, blue_out, horiz_sync_out, vert_sync_out : out std_logic;
            pixel_row, pixel_column: out std_logic_vector(9 DOWNTO 0)
        );
    end component VGA_SYNC;
begin
    pll: DP_CLK port map (
        refclk => refclk,
        rst => rst,
        outclk_0 => outclk_0,
        locked => locked
    );

    vga: VGA_SYNC port map (
        clock_25Mhz => outclk_0,
        red => red,
        green => green,
        blue => blue,
        red_out => red_out,
        green_out => green_out,
        blue_out => blue_out,
        horiz_sync_out => horiz_sync_out,
        vert_sync_out => vert_sync_out,
        pixel_row => pixel_row,
        pixel_column => pixel_column
    );
end a;