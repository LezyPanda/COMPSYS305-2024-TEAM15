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
	
	constant JUMP_SPEED : std_logic_vector(9 downto 0) := conv_std_logic_vector(15, 10);
	constant TERMINAL_VELOCITY : std_logic_vector(9 downto 0) := conv_std_logic_vector(6, 10);
	constant FALLING_ACCELERATION : std_logic_vector(9 downto 0) := conv_std_logic_vector(1, 10);
	constant DEFAULT_BALL_Y : std_logic_vector(9 DOWNTO 0) 	:= CONV_STD_LOGIC_VECTOR(480 / 2 - 40, 10);
	
	signal initial_click : std_logic := '0';
	signal prev_click : std_logic := '0';
	SIGNAL ball_on					: std_logic_vector(3 downto 0);
	SIGNAL size 					: std_logic_vector(9 DOWNTO 0)	:= CONV_STD_LOGIC_VECTOR(8, 10);  
	SiGNAL ball_x_pos				: std_logic_vector(10 DOWNTO 0)  := CONV_STD_LOGIC_VECTOR(316, 11);
	SIGNAL ball_y_pos				: std_logic_vector(9 DOWNTO 0) 	:= DEFAULT_BALL_Y;
	SIGNAL ball_y_motion			: std_logic_vector(9 DOWNTO 0);
BEGIN
	process (vertSync)
	begin
		if (rising_edge(vertSync)) then
			if (game_state = "01") then
				-- x_pos - size <= pixel_column <= x_pos + size
				if (('0' & ball_x_pos <= pixel_column + size) and ('0' & pixel_column <= ball_x_pos + size) and ('0' & ball_y_pos <= pixel_row + size) and ('0' & pixel_row <= ball_y_pos + size) ) then
					ball_on <= "1111";
					if (pipe = '1') then
						ball_y_pos <= DEFAULT_BALL_Y;
					end if;
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
					
				if (((mbL or mbR) = '1') and (prev_click = '0')) then -- prev_click is a check for whether mouse is currently being clicked or not
					-- allow ball to jump up 
					if ((game_state /= "11") and (game_state /= "10") and (game_state /= "00")) then
							if (ball_y_pos > 0) then 
								ball_y_motion <= -JUMP_SPEED; -- set jump speed
							else
								ball_y_motion <= (others => '0'); -- stop motion
							end if;
					end if;
				else
					-- apply gravity to ball when the mouse is not be clicked 
					if ((ball_y_pos < (conv_std_logic_vector(479,10) - size)) and (game_state /= "11" and game_state /= "10" and game_state /= "00")) then -- check if ball is at ground (pixel 479 = "111011111") and is only in play state
						if (ball_y_motion < TERMINAL_VELOCITY) then -- max 
							ball_y_motion <= ball_y_motion + FALLING_ACCELERATION; -- accelerating the fall downwards
						end if;
					else
						ball_y_motion <= (others => '0');
					end if;
				end if;

				ball_y_pos <= ball_y_pos + ball_y_motion;
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
			prev_click <= mbL or mbR;
		end if;
	end process Move_Ball;
END behavior;

