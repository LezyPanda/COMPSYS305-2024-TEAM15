LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_SIGNED.all;

ENTITY ball IS
	PORT( 
		clk, vertSync 				: in std_logic;
		mbL, mbR					: in std_logic;
		game_state					: in std_logic_vector(1 downto 0);
		pixel_row, pixel_column		: in std_logic_vector(9 downto 0);
		displayText, pipe 			: in std_logic;
		red, green, blue 			: out std_logic_vector(3 downto 0)
	);		
END ball;

architecture behavior of ball is
	
	constant JUMP_HEIGHT : std_logic_vector(9 downto 0) 	:= conv_std_logic_vector(15, 10);
	constant MAX_SPEED : std_logic_vector(9 downto 0) 		:= conv_std_logic_vector(6, 10);
	constant GRAVITY : std_logic_vector(9 downto 0) 		:= conv_std_logic_vector(1, 10);
	constant DEFAULT_BALL_X : std_logic_vector(10 downto 0) := conv_std_logic_vector(20, 11);
	constant DEFAULT_BALL_Y : std_logic_vector(9 downto 0) 	:= conv_std_logic_vector(480 / 2, 10);
	constant BALL_SIZE		: std_logic_vector(9 downto 0)	:= conv_std_logic_vector(8, 10);
	constant SKY_BOUND 		: std_logic_vector(9 downto 0) 	:= conv_std_logic_vector(0, 10);
	constant GROUND_BOUND 	: std_logic_vector(9 downto 0) 	:= conv_std_logic_vector(480, 10) - BALL_SIZE;
	constant ZERO_MOTION 	: std_logic_vector(9 downto 0) 	:= conv_std_logic_vector(0, 10);
	
	
	signal mouseClicked 	: std_logic 					:= '0';
	signal ballY			: std_logic_vector(9 downto 0) 	:= DEFAULT_BALL_Y;
	signal ballYMotion		: std_logic_vector(9 downto 0)	:= ZERO_MOTION;
BEGin
	
	-- Rendering
	process(ballY, pixel_column, pixel_row, displayText, pipe)
		variable r, g, b : std_logic_vector(3 downto 0) := "0000";
	begin
	
		-- Default Background Colours
		r := "0010";
		b := "0110";
		g := "0001";
		
		-- Playing
		if (game_state = "01") then
		
			-- Pipe Colours
			if (pipe = '1') then
				r := "0010";
				g := "1100";
				b := "0010";
			end if;
			
			-- Ball Colours
			if (('0' & DEFAULT_BALL_X <= pixel_column + BALL_SIZE) and 
				('0' & pixel_column <= DEFAULT_BALL_X + BALL_SIZE) and 
				('0' & ballY <= pixel_row + BALL_SIZE) and 
				('0' & pixel_row <= ballY + BALL_SIZE) ) then
				r := "1111";
				g := "1111";
				b := "0000";
			end if;
		end if;
		
		-- Text Colours
		if (displayText = '1') then
			r := "1111";
			b := "1111";
			g := "0001";
		end if;
		
		red <= r;
		green <= g;
		blue <= b;

	end process;
	
	
	-- Frame Tick
	process (vertSync)
		variable newBallY : std_logic_vector(9 downto 0);
	begin
		if (rising_edge(vertSync)) then
			-- Playing
			if (game_state = "01") then
				
				-- On-Click
				if ((mbL or mbR) = '1' and (mouseClicked = '0')) then
					-- Jump
					ballYMotion <= -JUMP_HEIGHT;
				else
					-- Apply gravity if not yet reached max speed
					if (ballYMotion < MAX_SPEED) then
						ballYMotion <= ballYMotion + GRAVITY;
					end if;
				end if;
			
				-- New Ball Position
				newBallY := newBallY + ballYMotion;
				
				-- On Above Sky
				if (newBallY < SKY_BOUND) then
					newBallY := SKY_BOUND;
				-- On Below Ground
				elsif (newBallY > GROUND_BOUND) then
					newBallY := GROUND_BOUND;
					ballYMotion <= ZERO_MOTION;
				end if;
				
				ballY <= ballY + ballYMotion;
			end if;
			
			mouseClicked <= mbL or mbR;
		end if;
	end process;
END behavior;

