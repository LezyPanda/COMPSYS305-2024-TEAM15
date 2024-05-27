-- testbench
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity timer_test is
end entity timer_test;

architecture atimer_test of timer_test is
	signal vClkIn, start, timeOut : std_logic;
	signal dataIn : std_logic_vector(9 downto 0);
	signal minutes, seconds_tenth, seconds_ones : std_logic_vector(6 downto 0);
	signal debugTime : std_logic_vector(11 downto 0);
	component timer is
		port(
			vClkIn : in std_logic;
			start : in std_logic;
			dataIn : in std_logic_vector(9 downto 0);
			timeOut : out std_logic;
			minutes : out std_logic_vector(6 downto 0);
			seconds_tenth : out std_logic_vector(6 downto 0); 
			seconds_ones : out std_logic_vector(6 downto 0);
			debugTime : out std_logic_vector(11 downto 0)
		);
    end component;
begin
	DUT : timer port map(vClkIn, start, dataIn, timeOut, minutes, seconds_tenth, seconds_ones, debugTime);
	init : process
	begin
		dataIn <= "1101011001";
		start <= '1', '0' after 35 ns;
		wait;
	end process init;
	

	clk_gen : process
	begin
		wait for 10 ns;
		vClkIn <= '0';
		wait for 10 ns;
		vClkIn <= '1';
	end process clk_gen;
end architecture atimer_test;