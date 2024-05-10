LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY flappy_text IS
   PORT(
		  signal pixel_column, pixel_row	: in std_logic_vector(9 downto 0);
		  signal character_address					: out std_logic_vector(5 downto 0);
		  signal font_row, font_col			: out std_logic_vector(2 downto 0));
end flappy_text;

architecture behavior of flappy_text is

signal pixel_row_t, pixel_column_t			: std_logic_vector(9 downto 0);


begin           
pixel_column_t <= pixel_column;
pixel_row_t <= pixel_row;

TEXT_Display: process (pixel_column_t, pixel_row_t)
begin
		if (pixel_column_t >= CONV_STD_LOGIC_VECTOR(288, 10)) and
			(pixel_column_t <= CONV_STD_LOGIC_VECTOR(304, 10)) and
			(pixel_row_t >= CONV_STD_LOGIC_VECTOR(320, 10)) and
			(pixel_row_t <= CONV_STD_LOGIC_VECTOR(335, 10)) then
			font_row <= pixel_row_t(3 downto 1);
			font_col <= pixel_column_t(3 downto 1);
			character_address <= CONV_STD_LOGIC_VECTOR(7, 6);
		--A
		elsif (pixel_column_t >= CONV_STD_LOGIC_VECTOR(304, 10)) and
			(pixel_column_t <= CONV_STD_LOGIC_VECTOR(320, 10)) and
			(pixel_row_t >= CONV_STD_LOGIC_VECTOR(320, 10)) and
			(pixel_row_t <= CONV_STD_LOGIC_VECTOR(335, 10)) then
			font_row <= pixel_row_t(3 downto 1);
			font_col <= pixel_column_t(3 downto 1);
			character_address <= CONV_STD_LOGIC_VECTOR(1, 6);
		--M
		elsif (pixel_column_t >= CONV_STD_LOGIC_VECTOR(320, 10)) and
			(pixel_column_t <= CONV_STD_LOGIC_VECTOR(336, 10)) and
			(pixel_row_t >= CONV_STD_LOGIC_VECTOR(320, 10)) and
			(pixel_row_t <= CONV_STD_LOGIC_VECTOR(335, 10)) then
			font_row <= pixel_row_t(3 downto 1);
			font_col <= pixel_column_t(3 downto 1);
			character_address <= CONV_STD_LOGIC_VECTOR(13, 6);
		--E
		elsif (pixel_column_t >= CONV_STD_LOGIC_VECTOR(336, 10)) and
			(pixel_column_t <= CONV_STD_LOGIC_VECTOR(352, 10)) and
			(pixel_row_t >= CONV_STD_LOGIC_VECTOR(320, 10)) and
			(pixel_row_t <= CONV_STD_LOGIC_VECTOR(335, 10)) then
			font_row <= pixel_row_t(3 downto 1);
			font_col <= pixel_column_t(3 downto 1);
			character_address <= CONV_STD_LOGIC_VECTOR(5, 6);
		else
			font_row <= pixel_row_t(3 downto 1);
			font_col <= pixel_column_t(3 downto 1);
			character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
		end if;
	end process TEXT_Display;

end behavior;