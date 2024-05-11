library IEEE;
use IEEE.std_logic_1164.all;


entity ClockDivider is
    port (
        clockIn, reset : in std_logic;
		factor : in integer; -- How many input periods to represent one output period, i.e. 4 means it will take 3 input period to have a complete output waveform
        clockOut: out std_logic
    );
end ClockDivider;


architecture aClockDivider of ClockDivider is
    signal vClockOut : std_logic;
    signal counter : integer := 0;
begin
    process (reset, clockIn) 
    begin
        if (reset = '1') then
            vClockOut <= '0';
			counter <= 0;
        elsif rising_edge(clockIn) then
            if (counter = factor / 2 - 1) then
                vClockOut <= not vClockOut;
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
	
    clockOut <= vClockOut;
	
end aClockDivider;
