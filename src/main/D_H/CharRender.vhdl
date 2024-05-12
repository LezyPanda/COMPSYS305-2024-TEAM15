library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;


entity CharRender is
    port (
        x, y, size, char: in integer;
		pixel_row, pixel_column	: in std_logic_vector(9 downto 0);
		character_address : out std_logic_vector(5 downto 0);
		font_row, font_col : out std_logic_vector(2 downto 0)
    );
end CharRender;


architecture aCharRender of CharRender is
begin
	assert x mod size = 0;
	assert y mod size = 0;
    process (pixel_column, pixel_row) 
    begin
		if (pixel_column >= CONV_STD_LOGIC_VECTOR(x, 10)) and
			(pixel_column <= CONV_STD_LOGIC_VECTOR(x + size, 10)) and
			(pixel_row >= CONV_STD_LOGIC_VECTOR(y, 10)) and
			(pixel_row <= CONV_STD_LOGIC_VECTOR(y + size - 1, 10)) then
			character_address <= CONV_STD_LOGIC_VECTOR(char, 6);
			if (size = 8) then
				font_row <= pixel_row(2 downto 0);
				font_col <= pixel_column(2 downto 0);
			elsif (size = 16) then
				font_row <= pixel_row(3 downto 1);
				font_col <= pixel_column(3 downto 1);
			elsif (size = 32) then
				font_row <= pixel_row(4 downto 2);
				font_col <= pixel_column(4 downto 2);
			elsif (size = 64) then
				font_row <= pixel_row(5 downto 3);
				font_col <= pixel_column(5 downto 3);
			end if;
		end if;
    end process;
end aCharRender;
