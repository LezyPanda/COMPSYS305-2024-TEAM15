library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity bcd_counter is
	port(
		Clk, Init, Enable, Direction : in std_logic;
		InitNum, MaxNum, MinNum : in std_logic_vector(3 downto 0);
		Q : out std_logic_vector(3 downto 0)
	);
end entity bcd_counter;


architecture abcd_counter of bcd_counter is
begin
	process (Clk, Init, Enable)
		variable vQ : std_logic_vector(3 downto 0) := InitNum;
	begin
		if (Init = '1') then
			vQ := InitNum;
		elsif (rising_edge(Clk)) then
			if (Enable = '1') then
				if (Direction = '0') then
					if (vQ /= MaxNum and vQ /= "1001") then
						vQ := vQ + "0001";
					else
						vQ := MinNum;
					end if;
				else
					if (vQ /= MinNum and vQ /= "0000") then
						vQ := vQ - "0001";
					else
						vQ := MaxNum;
					end if;
				end if;
			end if;
		end if;
		Q <= vQ;
	end process;

end architecture abcd_counter;