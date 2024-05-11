library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity timer is
	port(
		CLOCK_50 : in std_logic; -- Clock
		KEY0 : in std_logic; -- Start
		SW : in std_logic_vector(9 downto 0); -- Data in
		timeOut : out std_logic;
		HEX2 : out std_logic_vector(6 downto 0); -- m
		HEX1 : out std_logic_vector(6 downto 0); --st
		HEX0 : out std_logic_vector(6 downto 0); -- so
		debugTime : out std_logic_vector(11 downto 0);
		LEDR : out std_logic_vector(9 downto 0) -- led
	);
end entity timer;

architecture atimer of timer is
    component bcd_counter is
        port (
            clock, reset, enable : in std_logic;
		minNum, maxNum : in std_logic_vector(3 downto 0);
		count : out std_logic_vector(3 downto 0)
        );
    end component;

	component Clk_divider is
		port (
			 port (
        clockIn, reset : in std_logic;
			factor : in integer; -- How many input periods to represent one output period, i.e. 4 means it will take 3 input period to have a complete output waveform
        clockOut: out std_logic
    );
		);
	end component;

	component BCD_to_SevenSeg is
		 port (BCD_digit : in std_logic_vector(3 downto 0);
			   SevenSeg_out : out std_logic_vector(6 downto 0));
	end component;

	signal direction, init : std_logic;
    signal vEnable1, vEnable2, vEnable3 : std_logic;
    signal vQ1, vQ2, vQ3 : std_logic_vector(3 downto 0);
	signal vInitNum1, vInitNum2, vInitNum3 : std_logic_vector(3 downto 0);
	signal vMaxNum1, vMaxNum2, vMaxNum3 : std_logic_vector(3 downto 0);
	signal vMinNum1, vMinNum2, vMinNum3 : std_logic_vector(3 downto 0);
	signal vClk, Reset : std_logic;
begin
	dummy : Clk_divider port map(CLOCK_50,50000,Reset, vClk);
	dummy2 : bcd_counter port map(vClk, init, vEnable1, direction, vInitNum1, vMaxNum1, vMinNum1, vQ1); -- m
    dummy3 : bcd_counter port map(vClk, init, vEnable2, direction, vInitNum2, vMaxNum2, vMinNum2, vQ2); -- st
    dummy4 : bcd_counter port map(vClk, init, vEnable3, direction, vInitNum3, vMaxNum3, vMinNum3, vQ3); -- so
	dummy5 : BCD_to_SevenSeg port map(vQ1, HEX2);
	dummy6 : BCD_to_SevenSeg port map(vQ2, HEX1);
	dummy7 : BCD_to_SevenSeg port map(vQ3, HEX0);
	
    process (vClk, KEY0)
		variable tEnable1, tEnable2, tEnable3 : std_logic; 
    begin
        if (KEY0 = '0') then
			Reset <= '1';
            init <= '1';
			vInitNum1 <= "00" & SW(9 downto 8);
			if (SW(7 downto 4) < "0111") then
				vInitNum2 <= SW(7 downto 4);
				vInitNum3 <= SW(3 downto 0);
			else
				vInitNum2 <= "0110";
				vInitNum3 <= "0000";
			end if;
			vMaxNum1 <= "0011"; -- 3
			vMaxNum2 <= "0101"; -- 5
			vMaxNum3 <= "1001"; -- 9
			vMinNum1 <= "0000";
			vMinNum2 <= "0000";
			vMinNum3 <= "0000";
			timeOut <= '0';
        elsif (rising_edge(vClk)) then
			Reset <= '0';
			init <= '0';
			-- if num is 3:59
			if (vQ3 = "1001" and vQ2 = "0101" and vQ1 = "0011") then
				tEnable1 := '0';
				tEnable2 := '0';
				tEnable3 := '0';
				timeOut <= '1';
				LEDR <= "1111111111";
			-- if the second one is 1 second? idk if this is suppose to check 
			elsif (vQ3 = "0001") then
				LEDR <= "0000000000";
					tEnable1 := '0';
					tEnable2 := '0';
					tEnable3 := '1'; 
				if (vQ2 = "0000") then
					tEnable1 := '0';
					tEnable2 := '1';
					tEnable2 := '1'; --?
				else
					tEnable1 := '1';
					tEnable2 := '1';
					tEnable3 := '1';
				end if;
			else
				LEDR <= "0000000000";
				tEnable1 := '0';
				tEnable2 := '0';
				tEnable3 := '1';
			end if;
		else
			Reset <= '0';
		end if;

		debugTime <= vQ1 & vQ2 & vQ3;
		vEnable1 <= tEnable1;
		vEnable2 <= tEnable2;
		vEnable3 <= tEnable3;
    end process;
end architecture atimer;