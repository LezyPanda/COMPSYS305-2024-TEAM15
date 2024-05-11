-- testbench
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity bcd_counter_test is
end entity bcd_counter_test;

architecture abcd_counter_test of bcd_counter_test is
	signal t_Clk, t_Init, t_Enable, t_Direction : std_logic;
	signal t_InitNum, t_MaxNum, t_MinNum : std_logic_vector(3 downto 0);
	signal t_Q : std_logic_vector(3 downto 0);
	component bcd_counter is
       	port(
			Clk, Init, Enable, Direction : in std_logic;
			InitNum, MaxNum, MinNum : in std_logic_vector(3 downto 0);
			Q : out std_logic_vector(3 downto 0)
		);
    end component;

begin
	DUT : bcd_counter port map(t_Clk, t_Init, t_Enable, t_Direction, t_InitNum, t_MaxNum, t_MinNum, t_Q);
	-- Initialization process (code that executes onlyonce).
	init : process
	begin
		-- reset pulse
		t_InitNum <= "0101";
		t_MaxNum <= "0111";
		t_MinNum <= "0011";
		t_Enable <= '1', '0' after 124 ns, '1' after 144 ns;
		t_Init <= '1', '0' after 3 ns, '1' after 97 ns, '0' after 103 ns;
		t_Direction <= '0', '1' after 100 ns;
		wait;
	end process init;

	--clock generation 50MHz
	clk_gen : process
	begin
		t_Clk <= '0';
		wait for 5 ns;
		t_Clk <= '1';
		wait for 5 ns;
	end process clk_gen;
end architecture abcd_counter_test;