library IEEE;
use IEEE.std_logic_1164.all;

entity ClockDividerTest is
end ClockDividerTest;

architecture aClockDividerTest of ClockDividerTest is
	component ClockDivider
		port(
			clockIn, reset : in std_logic;
			factor : in integer;
			clockOut: out std_logic
		);
	end component;

	signal clockIn, reset, clockOut : std_logic := '0';
	constant period : integer := 20;
	constant factor : integer := 4;
begin
	dummy : ClockDivider port map(clockin, reset, factor, clockOut);

	process
		begin
		clockIn <= '0';
		wait for period / 2 * 1 ns;
		clockIn <= '1';
		wait for period / 2 * 1 ns;
	end process;

	process
	begin
		reset <= '1';
		wait for 30 ns;
		reset <= '0';
        wait;
	end process;
end aClockDividerTest;
