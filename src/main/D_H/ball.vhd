LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_SIGNED.all;

ENTITY ball IS
	PORT( 
		clk, vertSync 				: in std_logic;
		mbL, mbR						: in std_logic;
		game_state					: in std_logic_vector(1 downto 0);
		pixel_row, pixel_column		: IN std_logic_vector(9 DOWNTO 0);
		displayText : in std_logic;
		red, green, blue 			: out std_logic_vector(3 downto 0)
	);		
END ball;

architecture behavior of ball is


	SIGNAL ball_on					: std_logic_vector(3 downto 0);
	SIGNAL size 					: std_logic_vector(9 DOWNTO 0)	:= CONV_STD_LOGIC_VECTOR(8, 10);  
	SiGNAL ball_x_pos				: std_logic_vector(10 DOWNTO 0)  := CONV_STD_LOGIC_VECTOR(316, 11);
	SIGNAL ball_y_pos				: std_logic_vector(9 DOWNTO 0) 	:= CONV_STD_LOGIC_VECTOR(100, 10);
	SIGNAL ball_y_motion			: std_logic_vector(9 DOWNTO 0);

BEGIN
	
	process(clk)
	begin
		if (game_state = "01") then
			-- x_pos - size <= pixel_column <= x_pos + size
			if (('0' & ball_x_pos <= pixel_column + size) and ('0' & pixel_column <= ball_x_pos + size) and ('0' & ball_y_pos <= pixel_row + size) and ('0' & pixel_row <= ball_y_pos + size) ) then
				ball_on <= "1111";
			else
				ball_on <= "0000";
			end if;
			red <= (displayText & displayText & displayText & displayText) or ball_on	or "0010";
			green <= ball_on																				or "0001";
			blue <= (displayText & displayText & displayText & displayText)				or "0110";
		else
			red <= (displayText & displayText & displayText & displayText) 				or "0010";
			green <= "0000"																				or "0001";
			blue <= (displayText & displayText & displayText & displayText)				or "0110";
		end if;

	end process;
	
	process (vertSync, ball_x_pos, ball_y_pos)  	
	begin
		-- Move ball once every vertical sync
		if (rising_edge(vertSync)) then			
			-- Bounce off top or bottom of the screen
			if ( (ball_y_pos >= CONV_STD_LOGIC_VECTOR(479,10) - size) ) then
				ball_y_motion <= - CONV_STD_LOGIC_VECTOR(2,10);
			elsif (ball_y_pos <= size) then 
				ball_y_motion <= CONV_STD_LOGIC_VECTOR(2,10);
			end if;
			-- Compute next ball Y position
			ball_y_pos <= ball_y_pos + ball_y_motion;
			
			if (mbL = '1') then
				ball_x_pos <= ball_x_pos + "1";
			end if;
			if (mbR = '1') then
				ball_x_pos <= ball_x_pos - "1";
			end if;
		end if;
		

		
	end process;
END behavior;

