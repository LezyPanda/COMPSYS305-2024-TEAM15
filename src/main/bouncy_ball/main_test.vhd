-- testbench
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity test is
end entity test;

architecture atest of test is
	signal clock50, reset, pb1, pb2 : std_logic := '0';
	signal rO, gO, bO : std_logic := '0';
	signal horizSyncO, vertSyncO : std_logic := '0';
	
	component main is
		port(
			clock50, reset, pb1, pb2 : in std_logic;
			rO, gO, bO : out std_logic;
			horizSyncO, vertSyncO : out std_logic
		);
    end component;

begin
	DUT : main port map(clock50, reset, pb1, pb2, rO, gO, bO, horizSyncO, vertSyncO);

	--clock generation 50MHz
	clk_gen : process
	begin
		clock50 <= '0';
		wait for 10 ns;
		clock50 <= '1';
		wait for 10 ns;
	end process clk_gen;
end architecture atest;