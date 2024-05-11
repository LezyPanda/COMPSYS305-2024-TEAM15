LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY flappy_text IS
   PORT(
		  pixel_row, pixel_column	: in std_logic_vector(9 downto 0);
		  character_address			: out std_logic_vector(5 downto 0);
		  font_row, font_col			: out std_logic_vector(2 downto 0)
	  );
end flappy_text;

architecture behavior of flappy_text is

begin

	TEXT_Display: process (pixel_column, pixel_row)
	begin
			--G
			if (pixel_column >= CONV_STD_LOGIC_VECTOR(8, 10)) and
				(pixel_column <= CONV_STD_LOGIC_VECTOR(8 + 8, 10)) and
				(pixel_row >= CONV_STD_LOGIC_VECTOR(8, 10)) and
				(pixel_row <= CONV_STD_LOGIC_VECTOR(8 + 8 - 1, 10)) then
				character_address <= CONV_STD_LOGIC_VECTOR(7, 6);
				font_row <= pixel_row(2 downto 0);
				font_col <= pixel_column(2 downto 0);
			--A
			elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(80, 10)) and
				(pixel_column <= CONV_STD_LOGIC_VECTOR(80 + 16, 10)) and
				(pixel_row >= CONV_STD_LOGIC_VECTOR(80, 10)) and
				(pixel_row <= CONV_STD_LOGIC_VECTOR(80 + 16 - 1, 10)) then
				character_address <= CONV_STD_LOGIC_VECTOR(1, 6);
				font_row <= pixel_row(3 downto 1);
				font_col <= pixel_column(3 downto 1);
			--M
			elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(160, 10)) and
				(pixel_column <= CONV_STD_LOGIC_VECTOR(160 + 32, 10)) and
				(pixel_row >= CONV_STD_LOGIC_VECTOR(160, 10)) and
				(pixel_row <= CONV_STD_LOGIC_VECTOR(160 + 32 - 1, 10)) then
				character_address <= CONV_STD_LOGIC_VECTOR(13, 6);		
				font_row <= pixel_row(4 downto 2);
				font_col <= pixel_column(4 downto 2);
			--E
			elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(256, 10)) and
				(pixel_column <= CONV_STD_LOGIC_VECTOR(256 + 64, 10)) and
				(pixel_row >= CONV_STD_LOGIC_VECTOR(256, 10)) and
				(pixel_row <= CONV_STD_LOGIC_VECTOR(256 + 64 - 1, 10)) then
				character_address <= CONV_STD_LOGIC_VECTOR(5, 6);				
				font_row <= pixel_row(5 downto 3);
				font_col <= pixel_column(5 downto 3);
			else
				character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
			end if;
			
	end process TEXT_Display;

end behavior;