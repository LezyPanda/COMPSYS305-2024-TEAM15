LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_SIGNED.all;

ENTITY ball IS
	PORT( 
		clk, vertSync, reset		: in std_logic;
		mbL, mbR, mode				: in std_logic;
		game_state					: in std_logic_vector(1 downto 0);
		pixel_row, pixel_column		: in std_logic_vector(9 downto 0);
		displayText, pipe, pickup	: in std_logic;
		ballHit, pickupHit			: in std_logic;
		ballY						: out std_logic_vector(9 downto 0);
		lives						: out std_logic_vector(2 downto 0);
		red, green, blue 			: out std_logic_vector(3 downto 0)
	);		
END ball;

architecture behavior of ball is
	constant JUMP_HEIGHT : std_logic_vector(9 downto 0) 	:= conv_std_logic_vector(12, 10);
	constant MAX_SPEED : std_logic_vector(9 downto 0) 		:= conv_std_logic_vector(6, 10);
	constant GRAVITY : std_logic_vector(9 downto 0) 		:= conv_std_logic_vector(1, 10);
	constant DEFAULT_BALL_X : std_logic_vector(10 downto 0) := conv_std_logic_vector(190, 11);
	constant DEFAULT_BALL_Y : std_logic_vector(9 downto 0) 	:= conv_std_logic_vector(480 / 2, 10);
	constant BALL_SIZE		: std_logic_vector(9 downto 0)	:= conv_std_logic_vector(16, 10);
	constant SKY_BOUND 		: std_logic_vector(9 downto 0) 	:= conv_std_logic_vector(32, 10);
	constant GROUND_BOUND 	: std_logic_vector(9 downto 0) 	:= conv_std_logic_vector(480 - 24, 10);
	constant ZERO_MOTION 	: std_logic_vector(9 downto 0) 	:= conv_std_logic_vector(0, 10);
	
	
	signal vBallY			: std_logic_vector(9 downto 0) 	:= DEFAULT_BALL_Y;
BEGin
	
	-- Rendering
	process(game_state, vBallY, pixel_column, pixel_row, displayText, pipe)
		variable r, g, b : std_logic_vector(3 downto 0) := "0000";
	begin
	
		-- Background Rendering
		-- Playing Screen
		if (game_state /= "00") then
			-- Space
			if ('0' & pixel_row <= SKY_BOUND) then
				r := "0001";
				g := "0001";
				b := "1000";
			-- Sky
			elsif ('0' & pixel_row <= GROUND_BOUND) then
				r := "0111";
				g := "1111";
				b := "1111";
			-- Ground
			else
				r := "1011";
				g := "1000";
				b := "0000";
			end if;
		-- Other Screens
		else
			r := "0010";
			g := "0001";
			b := "0110";
		end if;

		
		-- Playing
		if (game_state /= "00") then
		
			-- Pipe Colours
			if (pipe = '1') then
				r := "0010";
				g := "1100";
				b := "0010";
			end if;
			
			-- Ball Colours
			if (('0' & DEFAULT_BALL_X <= pixel_column) and 
				('0' & pixel_column <= DEFAULT_BALL_X + BALL_SIZE) and 
				(vBallY <= pixel_row) and 
				('0' & pixel_row <= vBallY + BALL_SIZE) ) then
				r := "1111";
				g := "1111";
				b := "0000";
			end if;
			
			-- Pickups
			if (pickup = '1') then
				r := "1100";
				g := "0001";
				b := "1000";
			end if;
		end if;
		
		-- Text Colours
		if (displayText = '1') then
			r := "1111";
			g := "0001";
			b := "1111";
		end if;
		
		red <= r;
		green <= g;
		blue <= b;

	end process;
	
	
	-- Frame Tick
	process (vertSync, reset, mode, ballHit, pickupHit)
		variable newBallY 		: std_logic_vector(9 downto 0);
		variable hitPipes		: std_logic := '0';
		variable hitPickups		: std_logic := '0';
		variable vLives			: std_logic_vector(2 downto 0)	:= conv_std_logic_vector(5, 3);
		variable mouseClicked 	: std_logic 					:= '0';
		variable vBallY			: std_logic_vector(9 downto 0) 	:= DEFAULT_BALL_Y;
		variable ballYMotion	: std_logic_vector(9 downto 0)	:= ZERO_MOTION;
	begin
		if (reset = '1') then
			if (mode = '1') then
				vLives := "101";
			else
				vLives := "011";
			end if;
			newBallY := DEFAULT_BALL_Y;
		elsif (rising_edge(vertSync)) then

			-- Playing
			if (game_state = "01") then
				
				-- On-Click
				if ((mbL or mbR) = '1' and (mouseClicked = '0')) then
					-- Jump
					ballYMotion := -JUMP_HEIGHT;
				else
					-- Apply gravity if not yet reached max speed
					if (ballYMotion < MAX_SPEED) then
						ballYMotion := ballYMotion + GRAVITY;
					end if;
				end if;
			
				-- New Ball Position
				newBallY := newBallY + ballYMotion;
				
				-- On Above Sky
				if (newBallY <= SKY_BOUND) then
					newBallY := DEFAULT_BALL_Y;
					vLives := vLives - 1;
				-- On Below Ground
				elsif (newBallY + BALL_SIZE >= '0' & GROUND_BOUND) then
					newBallY := DEFAULT_BALL_Y;
					ballYMotion := ZERO_MOTION;
					vLives := vLives - 1;
				-- On Hit-Pipe
				end if;
				
				if (ballHit = '1') then
					if (hitPipes = '0') then
						hitPipes := '1';
						vLives := vLives - 1;
					end if;
				else
					hitPipes := '0';
				end if;
					
				if (pickupHit = '1') then
					if (hitPickups = '0') then
						hitPickups := '1';
						if ((unsigned(vLives) < 5 and mode = '1') or (unsigned(vLives) < 3 and mode = '0')) then
							vLives := vLives + 1;
						end if;
					end if;
				else
					hitPickups := '0';
				end if;
				
				vBallY := newBallY;
			end if;
			
			mouseClicked := mbL or mbR;
		end if;
		lives <= vLives;
		ballY <= vBallY;
	end process;
END behavior;

