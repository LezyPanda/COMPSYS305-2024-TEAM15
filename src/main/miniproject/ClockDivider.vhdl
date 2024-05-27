library IEEE;
use IEEE.std_logic_1164.all;

-- Converts 25MHZ to 1HZ
entity ClockDivider is
    port (
        clockIn, reset : in std_logic;
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
            if (counter = 12499999) then
                vClockOut <= not vClockOut;
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
	
    clockOut <= vClockOut;
	
end aClockDivider;
