library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity BCDCounter is
	port(
		clock, reset, enable : in std_logic;
		minNum, maxNum : in std_logic_vector(3 downto 0);
		count : out std_logic_vector(3 downto 0)
	);
end entity BCDCounter;


architecture aBCDCounter of BCDCounter is
begin
	process (clock, reset, enable)
		variable vCount : std_logic_vector(3 downto 0) := "0000";
	begin
		if (reset = '1') then
			vCount := minNum;
		elsif (rising_edge(clock)) then
			if (enable = '1') then
				if (vCount /= maxNum and vCount /= "1001") then
					vCount := vCount + "0001";
				else
					vCount := "0000";
				end if;
			end if;
		end if;
		count <= vCount;
		
	end process;

end architecture aBCDCounter;