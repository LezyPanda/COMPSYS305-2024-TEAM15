-- testbench
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity BCDCounterTest is
end entity BCDCounterTest;

architecture aBCDCounterTest of BCDCounterTest is
	component BCDCounter is
       	port(
			clock, reset, enable : in std_logic;
			minNum, maxNum : in std_logic_vector(3 downto 0);
			count : out std_logic_vector(3 downto 0)
		);
    end component;
	
	signal clock, reset, enable : std_logic := '0';
	constant minNum : std_logic_vector(3 downto 0) := "0000";
	constant maxNum : std_logic_vector(3 downto 0) := "1001";
	signal count : std_logic_vector(3 downto 0) := "0000";

begin
	dummy : BCDCounter port map(clock, reset, enable, minNum, maxNum, count);
	
	process
	begin
		reset <= '1';
		wait for 10 ns;
		reset <= '0';
		wait;
	end process;
	
	process
	begin
		enable <= '1';
		wait for 200 ns;
		enable <= '0';
		wait;
	end process;

	process
	begin
		clock <= '0';
		wait for 5 ns;
		clock <= '1';
		wait for 5 ns;
	end process;
end architecture aBCDCounterTest;