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
    --component CharRender is
    --    port (
	--		x, y, size, char: in integer;
	--		pixel_row, pixel_column	: in std_logic_vector(9 downto 0);
	--		character_address : out std_logic_vector(5 downto 0);
	--		font_row, font_col : out std_logic_vector(2 downto 0)
    --    );
    --end component;
	
	--signal tpixel_row, tpixel_column	: std_logic_vector(9 downto 0);
	--signal tcharacter_address : std_logic_vector(5 downto 0);
	--signal tfont_row, tfont_col : std_logic_vector(2 downto 0);
	
	
begin
	--g : CharRender port map(16, 16, 8, 7, tpixel_row, tpixel_column, tcharacter_address, tfont_row, tfont_col);
	process (pixel_column, pixel_row)
		variable x : integer := 0;
		variable y : integer := 0;
		variable s : integer := 0;
		
		variable vA : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(1, 6);
		variable vB : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(2, 6);
		variable vC : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(3, 6);
		variable vD : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(4, 6);
		variable vE : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(5, 6);
		variable vF : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(6, 6);
		variable vG : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(7, 6);
		variable vH : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(8, 6);
		variable vI : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(9, 6);
		variable vJ : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(10, 6);
		variable vK : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(11, 6);
		variable vL : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(12, 6);
		variable vM : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(13, 6);
		variable vN : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(14, 6);
		variable vO : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(15, 6);
		variable vP : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(16, 6);
		variable vQ : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(17, 6);
		variable vR : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(18, 6);
		variable vS : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(19, 6);
		variable vT : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(20, 6);
		variable vU : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(21, 6);
		variable vV : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(22, 6);
		variable vW : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(23, 6);
		variable vX : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(24, 6);
		variable vY : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(25, 6);
		variable vZ : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(26, 6);
	begin
		-- "FLOPPY"
		x := 128;
		y := 64;
		s := 64;
		if (pixel_row >= CONV_STD_LOGIC_VECTOR(y, 10)) and (pixel_row <= CONV_STD_LOGIC_VECTOR(y + s - 1, 10)) then
			if (pixel_column >= CONV_STD_LOGIC_VECTOR(		x + s * 0, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 1, 10)) then
				character_address <= vF;
			elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 1, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 2 - 1, 10)) then
				character_address <= vL;
			elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 2, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 3 - 1, 10)) then
				character_address <= vO;
			elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 3, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 4 - 1, 10)) then
				character_address <= vP;
			elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 4, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 5 - 1, 10)) then
				character_address <= vP;
			elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 5, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 6 - 1, 10)) then
				character_address <= vY;
			else
				character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
			end if;
			font_row <= pixel_row(5 downto 3);
			font_col <= pixel_column(5 downto 3);
		end if;
		
		-- "BIRD"
		x := 196;
		y := 128;
		s := 64;
		if (pixel_row >= CONV_STD_LOGIC_VECTOR(y, 10)) and (pixel_row <= CONV_STD_LOGIC_VECTOR(y + s - 1, 10)) then
			if (pixel_column >= CONV_STD_LOGIC_VECTOR(		x + s * 0, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 1, 10)) then
				character_address <= vB;
			elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 1, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 2 - 1, 10)) then
				character_address <= vI;
			elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 2, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 3 - 1, 10)) then
				character_address <= vR;
			elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 3, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 4 - 1, 10)) then
				character_address <= vD;
			else
				character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
			end if;
			font_row <= pixel_row(5 downto 3);
			font_col <= pixel_column(5 downto 3);
		end if;
		
		-- "START"
		x := 192;
		y := 288;
		s := 32;
		if (pixel_row >= CONV_STD_LOGIC_VECTOR(y, 10)) and (pixel_row <= CONV_STD_LOGIC_VECTOR(y + s - 1, 10)) then
			if (pixel_column >= CONV_STD_LOGIC_VECTOR(		x + s * 0, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 1, 10)) then
				character_address <= vS;
			elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 1, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 2 - 1, 10)) then
				character_address <= vT;
			elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 2, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 3 - 1, 10)) then
				character_address <= vA;
			elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 3, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 4 - 1, 10)) then
				character_address <= vR;
			elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 4, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 5 - 1, 10)) then
				character_address <= vT;
			else
				character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
			end if;
			font_row <= pixel_row(4 downto 2);
			font_col <= pixel_column(4 downto 2);
		end if;
		
		-- "TRAIN"
		x := 256;
		y := 352;
		s := 32;
		if (pixel_row >= CONV_STD_LOGIC_VECTOR(y, 10)) and (pixel_row <= CONV_STD_LOGIC_VECTOR(y + s - 1, 10)) then
			if (pixel_column >= CONV_STD_LOGIC_VECTOR(		x + s * 0, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 1, 10)) then
				character_address <= vT;
			elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 1, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 2 - 1, 10)) then
				character_address <= vR;
			elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 2, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 3 - 1, 10)) then
				character_address <= vA;
			elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 3, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 4 - 1, 10)) then
				character_address <= vI;
			elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 4, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 5 - 1, 10)) then
				character_address <= vN;
			else
				character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
			end if;
			font_row <= pixel_row(4 downto 2);
			font_col <= pixel_column(4 downto 2);
		end if;
			
	end process;

end behavior;