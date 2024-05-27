library ieee;
use ieee.std_logic_1164.all;

entity LFSR is
  port (
    clk		: in std_logic 						:= '0';
    output	: out std_logic_vector (5 downto 0) := "000001"
  );
end LFSR;

architecture aLFSR of LFSR is

begin
	process (clk)
		variable currstate 	: std_logic_vector (5 downto 0) := "000001";
		variable nextstate 	: std_logic_vector (5 downto 0) := "000010";
		variable feedback 	: std_logic 								:= '0';
		begin
			if (rising_edge(clk)) then
				currstate := nextstate;
				feedback := currstate(4) xor currstate(3) xor currstate(2) xor currstate(0);
				nextstate := feedback & currstate(5 downto 1);
				output <= currstate;
		end if;
	end process;
end aLFSR;