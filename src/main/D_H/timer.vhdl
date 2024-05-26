library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity timer is
	port(
		clock50 : in std_logic; -- Clock
		Reset : in std_logic; -- Start
		Enable : in std_logic;
		timeOut : out std_logic;
		HEX2 : out std_logic_vector(6 downto 0); -- m
		HEX1 : out std_logic_vector(6 downto 0); --st
		HEX0 : out std_logic_vector(6 downto 0); -- so
		debugTime : out std_logic_vector(11 downto 0);
		LEDR : out std_logic_vector(9 downto 0) -- led
	);
end entity timer;

architecture atimer of timer is
    component BCDCounter is
        port (
            clock, reset, enable : in std_logic;
				minNum, maxNum : in std_logic_vector(3 downto 0);
				count : out std_logic_vector(3 downto 0)
        );
    end component;

	 component ClockDivider is
		  port (
		  clockIn, reset : in std_logic;
			factor : in integer; -- How many input periods to represent one output period, i.e. 4 means it will take 3 input period to have a complete output waveform
        clockOut: out std_logic
    );
	end component;

	component BCD2SevenSeg is
	port (
		DisplayDigit : in std_logic_vector(3 downto 0);
		SevenSeg : out std_logic_vector(6 downto 0)
				);
	end component;

	signal init : std_logic;
    signal vEnable1, vEnable2, vEnable3 : std_logic;
    signal vQ1, vQ2, vQ3 : std_logic_vector(3 downto 0);
	signal vClk : std_logic;
begin
	dummy : ClockDivider port map(clock50, Reset, 25000000, vClk);
	dummy2 : BCDCounter port map(vClk, init, vEnable1, "0000", "0011", vQ1); -- m
    dummy3 : BCDCounter port map(vClk, init, vEnable2, "0000", "0101", vQ2); -- st
    dummy4 : BCDCounter port map(vClk, init, vEnable3, "0000", "1001", vQ3); -- so
	dummy5 : BCD2SevenSeg port map(vQ1, HEX2);
	dummy6 : BCD2SevenSeg port map(vQ2, HEX1);
	dummy7 : BCD2SevenSeg port map(vQ3, HEX0);
	
    process (clock50, vClk, Reset, Enable)
		variable tEnable1, tEnable2, tEnable3 : std_logic; 
    begin
		
        if (Reset = '1') then
            init <= '1';
			timeOut <= '0';
        elsif (rising_edge(vClk)) then
			if (Enable = '1') then
				init <= '0';
				-- if num is 3:59 stop all
				if (vQ3 = "1001" and vQ2 = "0101" and vQ1 = "0011") then
					tEnable1 := '0';
					tEnable2 := '0';
					tEnable3 := '0';
					timeOut <= '1';
					LEDR <= "1111111111";
				-- if the second one is 9 second turn on the second ten seven seg
				elsif (vQ3 = "1000") then
					LEDR <= "0000000000";
					-- if tens second sevenseg is 5 turn on the minute counter
					if (vQ2 = "0101") then
						tEnable1 := '1';
						tEnable2 := '1';
						tEnable3 := '1';
					 -- if 59 turn increase minute
					else
						tEnable1 := '0';
						tEnable2 := '1';
						tEnable3 := '1';
					end if;
				-- else enable second again
				else
					LEDR <= "0000000000";
					tEnable1 := '0';
					tEnable2 := '0';
					tEnable3 := '1';
				end if;
			end if;
		end if;

		debugTime <= vQ1 & vQ2 & vQ3;
		vEnable1 <= tEnable1;
		vEnable2 <= tEnable2;
		vEnable3 <= tEnable3;
    end process;
end architecture atimer;