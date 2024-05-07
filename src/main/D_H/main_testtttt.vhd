library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity main_tb is
end main_tb;

architecture tb of main_tb is
    signal refclk   : std_logic := '0';
    signal rst      : std_logic := '0';
    signal locked   : std_logic;
    signal red, green, blue : std_logic := '1';
    signal red_out, green_out, blue_out, horiz_sync_out, vert_sync_out : std_logic;
    signal pixel_row, pixel_column: std_logic_vector(9 DOWNTO 0);

    component main is
        port (
            refclk   : in  std_logic;
            rst      : in  std_logic;
            locked   : out std_logic;
            red, green, blue : in std_logic;
            red_out, green_out, blue_out, horiz_sync_out, vert_sync_out : out std_logic;
            pixel_row, pixel_column: out std_logic_vector(9 DOWNTO 0)
        );
    end component main;
begin
    uut: main port map (
        refclk => refclk,
        rst => rst,
        locked => locked,
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

    clk_process :process
    begin
        refclk <= '0';
        wait for 10 ns;
        refclk <= '1';
        wait for 10 ns;
    end process;

end tb;