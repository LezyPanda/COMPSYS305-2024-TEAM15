library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity pipes is
	port (
		-- clk, v_sync to vga, state and mode to fsm, reset can be disconeccted
		clk, v_sync, reset, mode: in std_logic;
		state                 	: in std_logic_vector(1 downto 0);
		--vga sync
		pixel_row, pixel_column	: in std_logic_vector(9 DOWNTO 0);
		-- timecheck to check for time and change speed accordingly
		timecheck 				: in std_logic_vector(11 DOWNTO 0);
		-- pipe gap connected to LFSR
		pipe_gap 				: in std_logic_vector (5 DOWNTO 0);
		-- Ball Y Pos
		ballY					: in std_logic_vector(9 downto 0);
		-- vga
		pipe_out 				: out std_logic;
		-- Ball Collision
		ballHit					: out std_logic;
		-- health item 
		healthx 				: out integer;
		healthy 				: out integer
	);
end pipes;

architecture Behavioral of pipes is

	-- Constants
	constant DISP_WIDTH 		: integer 	:= 640;
	constant DISP_HEIGHT 		: integer 	:= 480;
	constant MIN_PIPE_HEIGHT 	: integer 	:= 32;
	constant VALID_GAP_Y_BOT 	: integer  	:= DISP_HEIGHT - 80;
	constant GAP_HEIGHT 		: integer  	:= 150;
	constant PIPE_WIDTH 		: integer 	:= 32;
	constant PIPE_SPACING		: integer 	:= 160;
	constant DEFAULT_BALL_X : std_logic_vector(10 downto 0) := conv_std_logic_vector(190, 11);
	constant DEFAULT_BALL_X2 : std_logic_vector(10 downto 0) := conv_std_logic_vector(206, 11);
	constant BALL_SIZE		: std_logic_vector(9 downto 0)	:= conv_std_logic_vector(16, 10);

	
	-- Pipes
	signal pipeX				: std_logic_vector(10 downto 0) 	:= conv_std_logic_vector(600 + PIPE_SPACING * 0, 11);
	signal pipe2X 				: std_logic_vector(10 downto 0) 	:= conv_std_logic_vector(600 + PIPE_SPACING * 1, 11);
	signal pipe3X 				: std_logic_vector(10 downto 0) 	:= conv_std_logic_vector(600 + PIPE_SPACING * 2, 11);
	signal pipe4X 				: std_logic_vector(10 downto 0) 	:= conv_std_logic_vector(600 + PIPE_SPACING * 3, 11);
	signal pipe5X 				: std_logic_vector(10 downto 0) 	:= conv_std_logic_vector(600 + PIPE_SPACING * 4, 11);
	signal pipeX2				: std_logic_vector(10 downto 0) 	:= conv_std_logic_vector(600 + PIPE_SPACING * 0 + PIPE_WIDTH, 11);
	signal pipe2X2 				: std_logic_vector(10 downto 0) 	:= conv_std_logic_vector(600 + PIPE_SPACING * 1 + PIPE_WIDTH, 11);
	signal pipe3X2 				: std_logic_vector(10 downto 0) 	:= conv_std_logic_vector(600 + PIPE_SPACING * 2 + PIPE_WIDTH, 11);
	signal pipe4X2 				: std_logic_vector(10 downto 0) 	:= conv_std_logic_vector(600 + PIPE_SPACING * 3 + PIPE_WIDTH, 11);
	signal pipe5X2 				: std_logic_vector(10 downto 0) 	:= conv_std_logic_vector(600 + PIPE_SPACING * 4 + PIPE_WIDTH, 11);
	signal pipeY  				: std_logic_vector(9 downto 0)  := conv_std_logic_vector(240, 10);
	signal pipe2Y  				: std_logic_vector(9 downto 0)  := conv_std_logic_vector(240, 10);
	signal pipe3Y  				: std_logic_vector(9 downto 0)  := conv_std_logic_vector(240, 10);
	signal pipe4Y  				: std_logic_vector(9 downto 0)  := conv_std_logic_vector(240, 10);
	signal pipe5Y  				: std_logic_vector(9 downto 0)  := conv_std_logic_vector(240, 10);
	
	-- Game
	signal pipeSpeed       		: std_logic_vector(10 downto 0) := conv_std_logic_vector(2, 11);
	signal leftBound       		: std_logic_vector(10 downto 0) := conv_std_logic_vector(3, 11);
	
	-- health item
	signal vhealthx 			: integer 	:= 736;
	signal vhealthy 			: integer 	:= 128;
	signal healthpicked 		: std_logic := '0';
begin
 
	-- Rendering
	process(state, pipeX, pipe2X, pipe3X, pipe4x, pipe5x, pixel_column, pixel_row)
		variable r, g, b : std_logic_vector(3 downto 0) := "0000";
		variable vPipeOut : std_logic := '0';
	begin
		vPipeOut := '0';
		
		if (state = "01" or state = "10") then
			-- Pipe 1
			if (
				(pipeX <= '0' & pixel_column) and ('0' & pixel_column <= pipeX2) 
				and 
				(('0' & pixel_row <= pipeY - GAP_HEIGHT) or (pixel_row >= pipeY))
				) then
				vPipeOut := '1';
			end if;
			
			-- Pipe 2
			if (
				(pipe2X <= '0' & pixel_column) and ('0' & pixel_column <= pipe2X2) 
				and 
				(('0' & pixel_row <= pipe2Y - GAP_HEIGHT) or (pixel_row >= pipe2Y))
				) then
				vPipeOut := '1';
			end if;
			
			-- Pipe 3
			if (
				(pipe3X <= '0' & pixel_column) and ('0' & pixel_column <= pipe3X2) 
				and 
				(('0' & pixel_row <= pipe3Y - GAP_HEIGHT) or (pixel_row >= pipe3Y))
				) then
				vPipeOut := '1';
			end if;
			
			-- Pipe 4
			if (
				(pipe4X <= '0' & pixel_column) and ('0' & pixel_column <= pipe4X2) 
				and 
				(('0' & pixel_row <= pipe4Y - GAP_HEIGHT) or (pixel_row >= pipe4Y))
				) then
				vPipeOut := '1';
			end if;
			
			-- Pipe 5
			if (
				(pipe5X <= '0' & pixel_column) and ('0' & pixel_column <= pipe5X2) 
				and 
				(('0' & pixel_row <= pipe5Y - GAP_HEIGHT) or (pixel_row >= pipe5Y))
				) then
				vPipeOut := '1';
			end if;
		end if;
		
		pipe_out <= vPipeOut;

	end process;
	
	
	process(v_sync)
		variable randY		: std_logic_vector(9 downto 0) 	:= conv_std_logic_vector(64, 10);
		variable vhealth 	: std_logic_vector(5 downto 0) 	:= conv_std_logic_vector(34, 6);
		variable vBallHit 	: std_logic						:= '0';
		variable ballY2 	: std_logic_vector(9 downto 0) 	:= conv_std_logic_vector(0, 10);
	begin 
		-- Playing
		if (rising_edge(v_sync)) then
			if (reset = '1') then
				pipeX 	<= conv_std_logic_vector(600 + PIPE_SPACING * 0, 11);
				pipe2X 	<= conv_std_logic_vector(600 + PIPE_SPACING * 1, 11);
				pipe3X 	<= conv_std_logic_vector(600 + PIPE_SPACING * 2, 11);
				pipe4X 	<= conv_std_logic_vector(600 + PIPE_SPACING * 3, 11);
				pipe5X 	<= conv_std_logic_vector(600 + PIPE_SPACING * 4, 11);
				pipeX	<= conv_std_logic_vector(600 + PIPE_SPACING * 0, 11);
				pipe2X 	<= conv_std_logic_vector(600 + PIPE_SPACING * 1, 11);
				pipe3X 	<= conv_std_logic_vector(600 + PIPE_SPACING * 2, 11);
				pipe4X 	<= conv_std_logic_vector(600 + PIPE_SPACING * 3, 11);
				pipe5X 	<= conv_std_logic_vector(600 + PIPE_SPACING * 4, 11);
				pipeX2	<= conv_std_logic_vector(600 + PIPE_SPACING * 0 + PIPE_WIDTH, 11);
				pipe2X2 <= conv_std_logic_vector(600 + PIPE_SPACING * 1 + PIPE_WIDTH, 11);
				pipe3X2 <= conv_std_logic_vector(600 + PIPE_SPACING * 2 + PIPE_WIDTH, 11);
				pipe4X2 <= conv_std_logic_vector(600 + PIPE_SPACING * 3 + PIPE_WIDTH, 11);
				pipe5X2 <= conv_std_logic_vector(600 + PIPE_SPACING * 4 + PIPE_WIDTH, 11);
				pipeY  	<= conv_std_logic_vector(240, 10);
				pipe2Y  <= conv_std_logic_vector(240, 10);
				pipe3Y  <= conv_std_logic_vector(240, 10);
				pipe4Y  <= conv_std_logic_vector(240, 10);
				pipe5Y  <= conv_std_logic_vector(240, 10);
			elsif (state = "01") then
				-- Random Height
				randY := VALID_GAP_Y_BOT - (("0000" & pipe_gap) + ("0000" & pipe_gap));
				
				if (state = "01") then
					-- If Pipe 1 Out-of-Bound, Resets, Otherwise Move
					if (pipeX2 <= leftBound) then
						pipeX <= conv_std_logic_vector(DISP_WIDTH + PIPE_SPACING - PIPE_WIDTH, 11);
						pipeX2 <= conv_std_logic_vector(DISP_WIDTH + PIPE_SPACING, 11);
						pipeY <= randY;
					else
						pipeX <= pipeX - pipeSpeed;
						pipeX2 <= pipeX2 - pipeSpeed;
					end if;
					-- If Pipe 2 Out-of-Bound, Resets, Otherwise Move
					if (pipe2X2 <= leftBound) then
						pipe2X <= conv_std_logic_vector(DISP_WIDTH + PIPE_SPACING - PIPE_WIDTH, 11);
						pipe2X2 <= conv_std_logic_vector(DISP_WIDTH + PIPE_SPACING, 11);
						pipe2Y <= randY;
					else
						pipe2X <= pipe2X - pipeSpeed;
						pipe2X2 <= pipe2X2 - pipeSpeed;
					end if;
					-- If Pipe 3 Out-of-Bound, Resets, Otherwise Move
					if (pipe3X2 <= leftBound) then
						pipe3X <= conv_std_logic_vector(DISP_WIDTH + PIPE_SPACING - PIPE_WIDTH, 11);
						pipe3X2 <= conv_std_logic_vector(DISP_WIDTH + PIPE_SPACING, 11);
						pipe3Y <= randY;
					else
						pipe3X <= pipe3X - pipeSpeed;
						pipe3X2 <= pipe3X2 - pipeSpeed;
					end if;
					-- If Pipe 4 Out-of-Bound, Resets, Otherwise Move
					if (pipe4X2 <= leftBound) then
						pipe4X <= conv_std_logic_vector(DISP_WIDTH + PIPE_SPACING - PIPE_WIDTH, 11);
						pipe4X2 <= conv_std_logic_vector(DISP_WIDTH + PIPE_SPACING, 11);
						pipe4Y <= randY;
					else
						pipe4X <= pipe4X - pipeSpeed;
						pipe4X2 <= pipe4X2 - pipeSpeed;
					end if;
					-- If Pipe 5 Out-of-Bound, Resets, Otherwise Move
					if (pipe5X2 <= leftBound) then
						pipe5X <= conv_std_logic_vector(DISP_WIDTH + PIPE_SPACING - PIPE_WIDTH, 11);
						pipe5X2 <= conv_std_logic_vector(DISP_WIDTH + PIPE_SPACING, 11);
						pipe5Y <= randY;
					else
						pipe5X <= pipe5X - pipeSpeed;
						pipe5X2 <= pipe5X2 - pipeSpeed;
					end if;
				
					-- Ball Collision
					vBallHit 	:= '0';
					ballY2		:= ballY + BALL_SIZE;
					-- Pipe 1
					if (
						(('0' & pipeY <= ballY2) or (pipeY - GAP_HEIGHT >= ballY))
						and
						(DEFAULT_BALL_X2 >= pipeX and DEFAULT_BALL_X <= pipeX2)
						) then
						vBallHit := '1';
					end if;
					-- Pipe 2
					if (
						(('0' & pipe2Y <= ballY2) or (pipe2Y - GAP_HEIGHT >= ballY))
						and
						(DEFAULT_BALL_X2 >= pipe2X and DEFAULT_BALL_X <= pipe2X2)
						) then
						vBallHit := '1';
					end if;
					-- Pipe 3
					if (
						(('0' & pipe3Y <= ballY2) or (pipe3Y - GAP_HEIGHT >= ballY))
						and
						(DEFAULT_BALL_X2 >= pipe3X and DEFAULT_BALL_X <= pipe3X2)
						) then
						vBallHit := '1';
					end if;
					-- Pipe 4
					if (
						(('0' & pipe4Y <= ballY2) or (pipe4Y - GAP_HEIGHT >= ballY))
						and
						(DEFAULT_BALL_X2 >= pipe4X and DEFAULT_BALL_X <= pipe4X2)
						) then
						vBallHit := '1';
					end if;
					-- Pipe 5
					if (
						(('0' & pipe5Y <= ballY2) or (pipe5Y - GAP_HEIGHT >= ballY))
						and
						(DEFAULT_BALL_X2 >= pipe5X and DEFAULT_BALL_X <= pipe5X2)
						) then
						vBallHit := '1';
					end if;
				end if;
				
				ballHit <= vBallHit;
									
									
				if (vhealthx < 1 or healthpicked = '1') then
					vhealthx <= 640;
					vhealthy <= 128;
				end if;
				
				healthpicked <= '0';	
				healthx <= vhealthx;
				healthy <= vhealthy;
			end if;
		end if;
	end process;
end Behavioral;
		
				
			
