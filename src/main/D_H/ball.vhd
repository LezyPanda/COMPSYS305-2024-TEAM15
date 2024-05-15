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
		displayText, pipe : in std_logic;
		red, green, blue 			: out std_logic_vector(3 downto 0)
	);		
END ball;

architecture behavior of ball is
	
	signal prev_click : std_logic := '0';
	SIGNAL ball_on					: std_logic_vector(3 downto 0);
	SIGNAL size 					: std_logic_vector(9 DOWNTO 0)	:= CONV_STD_LOGIC_VECTOR(8, 10);  
	SiGNAL ball_x_pos				: std_logic_vector(10 DOWNTO 0)  := CONV_STD_LOGIC_VECTOR(316, 11);
	SIGNAL ball_y_pos				: std_logic_vector(9 DOWNTO 0) 	:= CONV_STD_LOGIC_VECTOR(100, 10);
	SIGNAL ball_y_motion			: std_logic_vector(9 DOWNTO 0);

	constant JUMP_SPEED : std_logic_vector(9 downto 0) := conv_std_logic_vector(10, 10);
	constant MAX_FALLING_SPEED : std_logic_vector(9 downto 0) := conv_std_logic_vector(10, 10);
	constant FALLING_ACCELERATION : std_logic_vector(9 downto 0) := conv_std_logic_vector(2, 10);
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
			
			if (ball_on = "1111") then
				red <= ball_on;
				green <= ball_on;
				blue <= "0000";
			else
				if (displayText = '1') then
					red <= (displayText & displayText & displayText & displayText);
					green <= "0001";
					blue <= (displayText & displayText & displayText & displayText);
				else
					if (pipe = '1') then
						red <= "0010";
						green <= "1100";
						blue <= "0010";
					else
						red <= "0010";
						green <= "0001";
						blue <= "0110";
					end if;
				end if;
			end if;
			
		else
			if (displayText = '1') then
				red <= (displayText & displayText & displayText & displayText);
				blue <= (displayText & displayText & displayText & displayText);
			else
				red <= "0010";
				blue <= "0110";
			end if;
			green <= "0001";
		end if;

	end process;
	
	Move_Ball : process (vertSync)
	begin
		if (rising_edge(vertSync)) then
			if (((mbL or mbR) = '1') and (prev_click = '0')) then -- prev_click is a check for whether mouse is currently being clicked or not
				-- allow bird to jump up 
				if ((game_state /= "11") or (game_state /= "10") or (game_state /= "00")) then
						if (ball_y_pos > 0) then 
							ball_y_motion <= -JUMP_SPEED; -- set jump speed
						else
							ball_y_motion <= (others => '0'); -- stop motion
						end if;
				end if;
			else
				-- apply gravity to bird when the mouse is not be clicked 
				if ((ball_y_pos < (conv_std_logic_vector(479,10) - size)) and (game_state /= "11" or game_state /= "10" or game_state /= "00")) then -- check if bird is at ground (pixel 479 = "111011111") and is only in play state
					if (ball_y_motion < MAX_FALLING_SPEED) then -- max 
						ball_y_motion <= ball_y_motion + FALLING_ACCELERATION; -- accelerating the fall downwards
					end if;
				else
					ball_y_motion <= (others => '0');
				end if;
			end if;

			-- Bounce off top or bottom of the screen
			if ( (ball_y_pos >= CONV_STD_LOGIC_VECTOR(479,10) - size) ) then
				ball_y_motion <= -conv_std_logic_vector(2, 10);
			elsif (ball_y_pos <= size) then 
				ball_y_motion <= CONV_STD_LOGIC_VECTOR(2,10);
			end if;

			-- setting position of bird
			if (game_state = "10") then -- pause state
				ball_y_pos <= ball_y_pos; -- pause bird in idle position
			else 
				ball_y_pos <= ball_y_pos + ball_y_motion;
			end if;
			prev_click <= mbL or mbR;
		end if;
	end process Move_Ball;
END behavior;

