LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_SIGNED.all;

entity bird is 
			
	-- idk if we are adding a reset button
	port(mbL, mbR, clk, vert_sync : in std_logic;
		state :in std_logic_vector(1 downto 0);
		pixel_row, pixel_column : in std_logic_vector(9 downto 0); -- "
		red, green, blue : out std_logic_vector(3 downto 0)); -- bird rbg
end bird;

architecture behaviour of bird is
	signal prev_click : std_logic := '0';
	signal size : std_logic_vector(9 DOWNTO 0) := conv_std_logic_vector(8, 10);  
	signal ball_x_pos : std_logic_vector(10 DOWNTO 0);
	signal ball_y_pos : std_logic_vector(9 DOWNTO 0);
	signal ball_y_motion : std_logic_vector(9 DOWNTO 0);

	constant JUMP_SPEED : std_logic_vector := conv_std_logic_vector(10, 10);
	constant MAX_FALLING_SPEED : std_logic_vector := conv_std_logic_vector(10, 10);
	constant FALLING_ACCELERATION : std_logic_vector := conv_std_logic_vector(2, 10);
begin
	

	Move_Bird : process (vert_sync)
	begin
		if (rising_edge(vert_sync)) then
			if (((mbL or mbR) = '1') and (prev_click = '0')) then -- prev_click is a check for whether mouse is currently being clicked or not
				-- allow bird to jump up 
				if ((state /= "11") or (state /= "10") or (state /= "00")) then
						if (bird_y_pos > 0) then 
							bird_y_motion <= -JUMP_SPEED: -- set jump speed
						else
							bird_y_motion <= (others => '0'); -- stop motion
						end if;
				end if;
			else
				-- apply gravity to bird when the mouse is not be clicked 
				if (bird_y_pos < ("111011111" - size) and ((state /= "11") or (state /= "10") or (state /= "00")) then -- check if bird is at ground (pixel 479 = "111011111") and is only in play state
					if (bird_y_motion < MAX_FALLING_SPEED) then -- max 
						bird_y_motion <= bird_y_motion + FALLING_ACCELERATION; -- accelerating the fall downwards
					end if;
				else
					bird_y_motion <= (others => '0');
				end if;
			end if;

			-- setting position of bird
			if (state = "00") then
				bird_y_pos <=  CONV_STD_LOGIC_VECTOR(240, 10);
			elsif (state = "10") then
				bird_y_pos <= bird_y_pos; -- pause bird in idle position
			else 
				bird_y_pos <= bird_y_pos + bird_y_motion;
			end if;
			prev_click <= mbL or mbR;
		end if;
	end process Move_Bird;

	process (vertSync, ball_x_pos, ball_y_pos)  	
	begin
		-- Move ball once every vertical sync
		if (rising_edge(vertSync)) then			
			if (game_state = "01") then
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
		end if;
		
		
	end process;
end behaviour;
				