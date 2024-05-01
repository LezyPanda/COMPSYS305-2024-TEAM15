-- Morteza (March 2023)
-- VHDL code for BCD to 7-Segment conversion
-- In this case, LED is on when it is '0'   
library IEEE;
use IEEE.std_logic_1164.all;   

entity BCD2SevenSeg is
	port (
		DisplayDigit : in std_logic_vector(3 downto 0);
		SevenSeg : out std_logic_vector(6 downto 0)
	);
end entity;

architecture aBCD2SevenSeg of BCD2SevenSeg is
begin
    SevenSeg <= 
		"1111001" when DisplayDigit = "0001" else -- 1
		"0100100" when DisplayDigit = "0010" else -- 2
		"0110000" when DisplayDigit = "0011" else -- 3
		"0011001" when DisplayDigit = "0100" else -- 4
		"0010010" when DisplayDigit = "0101" else -- 5
		"0000010" when DisplayDigit = "0110" else -- 6
		"1111000" when DisplayDigit = "0111" else -- 7
		"0000000" when DisplayDigit = "1000" else -- 8
		"0010000" when DisplayDigit = "1001" else -- 9
		"1000000" when DisplayDigit = "0000" else -- 0
		"1111111";
end architecture aBCD2SevenSeg; 
