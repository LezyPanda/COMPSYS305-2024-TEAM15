LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY flappy_text IS
   PORT(
        game_state 					: in std_logic_vector(1 downto 0);
		  mode						: in std_logic;
		  pixel_row, pixel_column	: in std_logic_vector(9 downto 0);
		  timeset					: in std_logic_vector(11 downto 0);
		  lives						: in std_logic_vector(2 downto 0);
		  character_address			: out std_logic_vector(5 downto 0);
		  font_row, font_col		: out std_logic_vector(2 downto 0)
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
	
		signal minute, secondten, secondone : std_logic_vector(3 downto 0);
	
begin

	--g : CharRender port map(16, 16, 8, 7, tpixel_row, tpixel_column, tcharacter_address, tfont_row, tfont_col);
	process (pixel_column, pixel_row)
		variable x : integer := 0;
		variable y : integer := 0;
		variable s : integer := 0;
		
		variable max_lives: integer := 0;
		
 
		
		variable vA : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(1, 6); -- A...
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
		variable vHeart : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(34, 6);
		variable v0 : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(48, 6); --1
		variable v1 : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(49, 6); --2
		variable v2 : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(50, 6); --3.... 
		variable v3 : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(51, 6);
		variable v4 : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(52, 6);
		variable v5 : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(53, 6);
		variable v6 : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(54, 6);
		variable v7 : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(55, 6);
		variable v8 : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(56, 6);
		variable v9 : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(57, 6);
		variable vApostrphy : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(33, 6); -- :
		variable vbopen : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(27, 6); 		-- [
		variable vbclose : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(29, 6); 	-- ]
	begin
		-- Start Stage
		if (game_state = "00") then
			-- "FLAPPY"
			x := 128;
			y := 64;
			s := 64;
			if (pixel_row >= CONV_STD_LOGIC_VECTOR(y, 10)) and (pixel_row <= CONV_STD_LOGIC_VECTOR(y + s - 1, 10)) then
				if (pixel_column >= CONV_STD_LOGIC_VECTOR(		x + s * 0, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 1, 10)) then
					character_address <= vF;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 1, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 2 - 1, 10)) then
					character_address <= vL;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 2, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 3 - 1, 10)) then
					character_address <= vA;
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
			
			-- "START" keyx
			x := 160;
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
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 6, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 7 - 1, 10)) then
					character_address <= vbopen;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 7, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 8 - 1, 10)) then
					character_address <= vK;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 8, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 9 - 1, 10)) then
					character_address <= vE;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 9, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 10 - 1, 10)) then
					character_address <= vY;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 10, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 11- 1, 10)) then
					character_address <= v0;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 11, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 12- 1, 10)) then
					character_address <= vbclose;
				else
					character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
				end if;
				font_row <= pixel_row(4 downto 2);
				font_col <= pixel_column(4 downto 2);
			end if;
			
			if(mode = '1') then 
			
				-- "TRAIN" keyx
				x := 160;
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
					
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 6, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 7 - 1, 10)) then
						character_address <= vbopen;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 7, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 8 - 1, 10)) then
						character_address <= vS;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 8, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 9 - 1, 10)) then
						character_address <= vW;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 9, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 10 - 1, 10)) then
						character_address <= v0;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 10, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 11 - 1, 10)) then
						character_address <= vbclose;
					else
						character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
					end if;
					font_row <= pixel_row(4 downto 2);
					font_col <= pixel_column(4 downto 2);
				end if;
			else
				--Normal
				x := 160;
				y := 352;
				s := 32;
				if (pixel_row >= CONV_STD_LOGIC_VECTOR(y, 10)) and (pixel_row <= CONV_STD_LOGIC_VECTOR(y + s - 1, 10)) then
					if (pixel_column >= CONV_STD_LOGIC_VECTOR(		x + s * 0, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 1, 10)) then
						character_address <= vN;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 1, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 2 - 1, 10)) then
						character_address <= vO;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 2, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 3 - 1, 10)) then
						character_address <= vR;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 3, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 4 - 1, 10)) then
						character_address <= vM;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 4, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 5 - 1, 10)) then
						character_address <= vA;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 5, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 6 - 1, 10)) then
						character_address <= vL;
						
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 6, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 7 - 1, 10)) then
						character_address <= vbopen;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 7, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 8 - 1, 10)) then
						character_address <= vS;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 8, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 9 - 1, 10)) then
						character_address <= vW;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 9, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 10 - 1, 10)) then
						character_address <= v0;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 10, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 11 - 1, 10)) then
						character_address <= vbclose;
					else
						character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
					end if;
					font_row <= pixel_row(4 downto 2);
					font_col <= pixel_column(4 downto 2);
				end if;
			end if;
			
			
		end if;
		-- Play Stage
		if (game_state /= "00") then
			-- lives set
			x := 0;
			y := 16;
			s := 16;
			minute <= timeset(11 downto 8);
         secondten <= timeset(7 downto 4);
         secondone <= timeset(3 downto 0);
			-- check mode
			if( mode ='1') then
			 -- Train mode Lives
				max_lives := 5;
				if (pixel_row >= CONV_STD_LOGIC_VECTOR(y, 10)) and (pixel_row <= CONV_STD_LOGIC_VECTOR(y + s - 1, 10)) then
					if (pixel_column >= CONV_STD_LOGIC_VECTOR(		x + s * 0, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 1, 10)) then
						case lives is
								when "101" => character_address <= vHeart;
								when "100" => character_address <= vHeart;
								when "011" => character_address <= vHeart;
								when "010" => character_address <= vHeart;
								when "001" => character_address <= vHeart;
								when others => character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
							end case;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 1, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 2 - 1, 10)) then
						case lives is
								when "101" => character_address <= vHeart;
								when "100" => character_address <= vHeart;
								when "011" => character_address <= vHeart;
								when "010" => character_address <= vHeart;
								when "001" => character_address  <= CONV_STD_LOGIC_VECTOR(32, 6);
								when others => character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
							end case;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 2, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 3 - 1, 10)) then
						case lives is
								when "101" => character_address <= vHeart;
								when "100" => character_address <= vHeart;
								when "011" => character_address <= vHeart;
								when "010" => character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
								when "001" => character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
								when others => character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
							end case;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 3, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 4 - 1, 10)) then
						case lives is
								when "101" => character_address <= vHeart;
								when "100" => character_address <= vHeart;
								when "011" => character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
								when "010" => character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
								when "001" => character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
								when others => character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
							end case;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 4, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 5 - 1, 10)) then
						case lives is
								when "101" => character_address <= vHeart;
								when "100" => character_address <=  CONV_STD_LOGIC_VECTOR(32, 6);
								when "011" => character_address <=  CONV_STD_LOGIC_VECTOR(32, 6);
								when "010" => character_address <=  CONV_STD_LOGIC_VECTOR(32, 6);
								when "001" => character_address <=  CONV_STD_LOGIC_VECTOR(32, 6);
								when others => character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
							end case;
					
				--pause
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 10, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 11, 10)) then
						character_address <= vP;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 11, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 12 - 1, 10)) then
						character_address <= vA;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 12, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 13 - 1, 10)) then
						character_address <= vU;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 13, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 14- 1, 10)) then
						character_address <= vS;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 14, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 15 - 1, 10)) then
							character_address <= vE;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 15, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 16 - 1, 10)) then
							character_address <= vbopen;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 16, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 17 - 1, 10)) then
							character_address <= vK;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 17, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 18 - 1, 10)) then
							character_address <= vE;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 18, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 19 - 1, 10)) then
							character_address <= vY;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 19, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 20 - 1, 10)) then
							character_address <= v2;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 20, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 21 - 1, 10)) then
							character_address <= vbclose;	
                else
                    character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
                end if;

					
					font_row <= pixel_row(3 downto 1);
					font_col <= pixel_column(3 downto 1);
				end if;
			------------------------------------------------------////////////////////////-----------------------------------------------
			x := 0;
			y := 464;
			s := 16;
				
				if (pixel_row >= CONV_STD_LOGIC_VECTOR(y, 10)) and (pixel_row <= CONV_STD_LOGIC_VECTOR(y + s - 1, 10)) then
				if (pixel_column >= CONV_STD_LOGIC_VECTOR(		x + s * 0, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 1, 10)) then
					character_address <= vL;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 1, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 2 - 1, 10)) then
					character_address <= vE;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 2, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 3 - 1, 10)) then
					character_address <= vV;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 3, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 4 - 1, 10)) then
					character_address <= vE;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 4, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 5 - 1, 10)) then
					character_address <= vL;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 5, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 6 - 1, 10)) then
					character_address <= v1;
				else
					character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
				end if;
				font_row <= pixel_row(3 downto 1);
				font_col <= pixel_column(3 downto 1);
			end if;
				
				
			else
			--normal mode
				max_lives := 3;
				if (pixel_row >= CONV_STD_LOGIC_VECTOR(y, 10)) and (pixel_row <= CONV_STD_LOGIC_VECTOR(y + s - 1, 10)) then
						if (pixel_column >= CONV_STD_LOGIC_VECTOR(		x + s * 0, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 1, 10)) then
							case lives is
								when "011" => character_address <= vHeart;
								when "010" => character_address <= vHeart;
								when "001" => character_address <= vHeart;
								when others => character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
							end case;
						elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 1, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 2 - 1, 10)) then
							case lives is
								when "011" => character_address <= vHeart;
								when "010" => character_address <= vHeart;
								when "001" => character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
								when others => character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
							end case;
						elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 2, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 3 - 1, 10)) then
							case lives is
								when "011" => character_address <= vHeart;
								when "010" => character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
								when "001" => character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
								when others => character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
							end case;
					-- pause	
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 10, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 11, 10)) then
						character_address <= vP;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 11, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 12 - 1, 10)) then
						character_address <= vA;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 12, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 13 - 1, 10)) then
						character_address <= vU;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 13, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 14- 1, 10)) then
						character_address <= vS;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 14, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 15 - 1, 10)) then
							character_address <= vE;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 15, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 16 - 1, 10)) then
							character_address <= vbopen;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 16, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 17 - 1, 10)) then
							character_address <= vK;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 17, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 18 - 1, 10)) then
							character_address <= vE;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 18, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 19 - 1, 10)) then
							character_address <= vY;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 19, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 20 - 1, 10)) then
							character_address <= v2;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 20, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 21 - 1, 10)) then
							character_address <= vbclose;	
					
						--	time
						elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(x + s * 29, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 30 - 1, 10)) then
					case minute is
						when "0000" => character_address <= v0;
						when "0001" => character_address <= v1;
						when "0010" => character_address <= v2;
						when "0011" => character_address <= v3;
						when others => character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
					end case;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(x + s * 30, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 31 - 1, 10)) then
					character_address <= vApostrphy;
					 elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(x + s * 31, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 32 - 1, 10)) then
					case secondten is
						when "0000" => character_address <= v0;
						when "0001" => character_address <= v1;
						when "0010" => character_address <= v2;
						when "0011" => character_address <= v3;
						when "0100" => character_address <= v4;
						when "0101" => character_address <= v5;
						when "0110" => character_address <= v6;
						when "0111" => character_address <= v7;
						when "1000" => character_address <= v8;
						when "1001" => character_address <= v9;
						when others => character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
					end case;	
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(x + s * 32, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 33 - 1, 10)) then
					case secondone is
						when "0000" => character_address <= v0;
						when "0001" => character_address <= v1;
						when "0010" => character_address <= v2;
						when "0011" => character_address <= v3;
						when "0100" => character_address <= v4;
						when "0101" => character_address <= v5;
						when "0110" => character_address <= v6;
						when "0111" => character_address <= v7;
						when "1000" => character_address <= v8;
						when "1001" => character_address <= v9;
						when others => character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
					end case;
				else
					character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
						end if;
						font_row <= pixel_row(3 downto 1);
						font_col <= pixel_column(3 downto 1);
					end if;
			x := 0;
			y := 464;
			s := 16;
				
				if (pixel_row >= CONV_STD_LOGIC_VECTOR(y, 10)) and (pixel_row <= CONV_STD_LOGIC_VECTOR(y + s - 1, 10)) then
				if (pixel_column >= CONV_STD_LOGIC_VECTOR(		x + s * 0, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 1, 10)) then
					character_address <= vL;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 1, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 2 - 1, 10)) then
					character_address <= vE;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 2, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 3 - 1, 10)) then
					character_address <= vV;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 3, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 4 - 1, 10)) then
					character_address <= vE;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 4, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 5 - 1, 10)) then
					character_address <= vL;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 5, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 6 - 1, 10)) then
					 if("000000110000" > timeset 							 ) then -- less than 30
								character_address <= v1;
					 elsif("000100000000" > timeset and timeset > "000000110000" ) then  -- more than 30 less than 1.0
								character_address <= v2;
					 elsif("000100110000" > timeset and timeset > "000100000000" ) then  -- more than 1.0 less than 1.3
								character_address <= v3;
					elsif("001000000000" > timeset and timeset > "000100110000" ) then -- more  than 1.3 less than 2
								character_address <= v4;
					elsif("001000110000" > timeset and timeset > "001000000000" ) then -- more than 2 less than 2.3
								character_address <= v5;
					elsif("001100000000" > timeset and timeset > "001000110000" ) then -- more than 2.3 less than 3
								character_address <= v6;
					elsif("001100110000" > timeset and timeset > "001100000000" ) then -- more than 3.0 less than 3.3
								character_address <= v7;
					else -- more than 3.3
								character_address <= v8;
					end if;			
					 
				else
					character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
				end if;
				font_row <= pixel_row(3 downto 1);
				font_col <= pixel_column(3 downto 1);
			end if;
			end if;
		end if;
		-- Pause Stage
		if (game_state = "10") then
			-- "PAUSE"
			x := 196;
			y := 128;
			s := 64;
			if (pixel_row >= CONV_STD_LOGIC_VECTOR(y, 10)) and (pixel_row <= CONV_STD_LOGIC_VECTOR(y + s - 1, 10)) then
				if (pixel_column >= CONV_STD_LOGIC_VECTOR(		x + s * 0, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 1, 10)) then
					character_address <= vP;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 1, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 2 - 1, 10)) then
					character_address <= vA;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 2, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 3 - 1, 10)) then
					character_address <= vU;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 3, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 4 - 1, 10)) then
					character_address <= vS;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 4, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 5 - 1, 10)) then
					character_address <= vE;
				else
					character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
				end if;
				font_row <= pixel_row(5 downto 3);
				font_col <= pixel_column(5 downto 3);
			end if;
			-- "continue"
			x := 96;
			y := 288;
			s := 32;
			if (pixel_row >= CONV_STD_LOGIC_VECTOR(y, 10)) and (pixel_row <= CONV_STD_LOGIC_VECTOR(y + s - 1, 10)) then
				if (pixel_column >= CONV_STD_LOGIC_VECTOR(		x + s * 0, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 1, 10)) then
					character_address <= vC;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 1, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 2 - 1, 10)) then
					character_address <= vO;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 2, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 3 - 1, 10)) then
					character_address <= vN;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 3, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 4 - 1, 10)) then
					character_address <= vT;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 4, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 5 - 1, 10)) then
					character_address <= vI;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 5, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 6 - 1, 10)) then
					character_address <= vN;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 6, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 7 - 1, 10)) then
					character_address <= vU;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 7, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 8 - 1, 10)) then
					character_address <= vE;
				
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 9, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 10 - 1, 10)) then
						character_address <= vbopen;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 10, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 11 - 1, 10)) then
						character_address <= vK;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 11, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 12 - 1, 10)) then
						character_address <= vE;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 12, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 13 - 1, 10)) then
						character_address <= vY;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 13, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 14 - 1, 10)) then
						character_address <= v0;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 14, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 15 - 1, 10)) then
						character_address <= vbclose;
				else
					character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
				end if;
				font_row <= pixel_row(4 downto 2);
				font_col <= pixel_column(4 downto 2);
			end if;
			
			
				--Home
				x := 160;
				y := 352;
				s := 32;
				if (pixel_row >= CONV_STD_LOGIC_VECTOR(y, 10)) and (pixel_row <= CONV_STD_LOGIC_VECTOR(y + s - 1, 10)) then
					if (pixel_column >= CONV_STD_LOGIC_VECTOR(		x + s * 0, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 1, 10)) then
						character_address <= vH;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 1, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 2 - 1, 10)) then
						character_address <= vO;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 2, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 3 - 1, 10)) then
						character_address <= vM;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 3, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 4 - 1, 10)) then
						character_address <= vE;
						
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 5, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 6 - 1, 10)) then
							character_address <= vbopen;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 6, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 7 - 1, 10)) then
							character_address <= vK;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 7, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 8 - 1, 10)) then
							character_address <= vE;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 8, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 9 - 1, 10)) then
							character_address <= vY;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 9, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 10 - 1, 10)) then
							character_address <= v1;	
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 10, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 11 - 1, 10)) then
							character_address <= vbclose;	
					else
						character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
					end if;
					font_row <= pixel_row(4 downto 2);
					font_col <= pixel_column(4 downto 2);
				end if;
			
		end if;
		-- Dead Stage
		if (game_state = "11") then
			-- "Dead"
			x := 196;
			y := 128;
			s := 64;
			if (pixel_row >= CONV_STD_LOGIC_VECTOR(y, 10)) and (pixel_row <= CONV_STD_LOGIC_VECTOR(y + s - 1, 10)) then
				if (pixel_column >= CONV_STD_LOGIC_VECTOR(		x + s * 0, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 1, 10)) then
					character_address <= vD;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 1, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 2 - 1, 10)) then
					character_address <= vE;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 2, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 3 - 1, 10)) then
					character_address <= vA;
				elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 3, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 4 - 1, 10)) then
					character_address <= vD;
				else
					character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
				end if;
				font_row <= pixel_row(5 downto 3);
				font_col <= pixel_column(5 downto 3);
			end if;
			
			
		
			--Play
				x := 160;
				y := 288;
				s := 32;
				if (pixel_row >= CONV_STD_LOGIC_VECTOR(y, 10)) and (pixel_row <= CONV_STD_LOGIC_VECTOR(y + s - 1, 10)) then
					if (pixel_column >= CONV_STD_LOGIC_VECTOR(		x + s * 0, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 1, 10)) then
						character_address <= vP;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 1, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 2 - 1, 10)) then
						character_address <= vL;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 2, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 3 - 1, 10)) then
						character_address <= vA;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 3, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 4 - 1, 10)) then
						character_address <= vY;
						
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 5, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 6 - 1, 10)) then
							character_address <= vbopen;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 6, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 7 - 1, 10)) then
							character_address <= vK;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 7, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 8 - 1, 10)) then
							character_address <= vE;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 8, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 9 - 1, 10)) then
							character_address <= vY;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 9, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 10 - 1, 10)) then
							character_address <= v0;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 10, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 11 - 1, 10)) then
							character_address <= vbclose;
					else
						character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
					end if;
					font_row <= pixel_row(4 downto 2);
					font_col <= pixel_column(4 downto 2);
				end if;
			
			
				--Home
				x := 160;
				y := 352;
				s := 32;
				if (pixel_row >= CONV_STD_LOGIC_VECTOR(y, 10)) and (pixel_row <= CONV_STD_LOGIC_VECTOR(y + s - 1, 10)) then
					if (pixel_column >= CONV_STD_LOGIC_VECTOR(		x + s * 0, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 1, 10)) then
						character_address <= vH;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 1, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 2 - 1, 10)) then
						character_address <= vO;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 2, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 3 - 1, 10)) then
						character_address <= vM;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 3, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 4 - 1, 10)) then
						character_address <= vE;
						
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 5, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 6 - 1, 10)) then
							character_address <= vbopen;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 6, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 7 - 1, 10)) then
							character_address <= vK;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 7, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 8 - 1, 10)) then
							character_address <= vE;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 8, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 9 - 1, 10)) then
							character_address <= vY;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 9, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 10 - 1, 10)) then
							character_address <= v1;
					elsif (pixel_column >= CONV_STD_LOGIC_VECTOR(	x + s * 10, 10)) and (pixel_column <= CONV_STD_LOGIC_VECTOR(x + s * 11 - 1, 10)) then
							character_address <= vbclose;
					else
						character_address <= CONV_STD_LOGIC_VECTOR(32, 6);
					end if;
					font_row <= pixel_row(4 downto 2);
					font_col <= pixel_column(4 downto 2);
				end if;
				
		end if;
	end process;

end behavior;