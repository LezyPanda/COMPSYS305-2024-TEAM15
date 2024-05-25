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
		-- vga
		pipe_out 				: out std_logic;
		-- health item 
		healthx 				: out integer;
		healthy 				: out integer
	);
end pipes;

architecture Behavioral of pipes is

  COMPONENT LFSR IS
  port (
    clk		: in std_logic;
    output	: out std_logic_vector (5 downto 0)
  );
  END COMPONENT;
  
	-- Constants
	constant DISP_WIDTH 		: integer 	:= 640;
	constant DISP_HEIGHT 		: integer 	:= 480;
	constant MIN_PIPE_HEIGHT 	: integer 	:= 32;
	constant VALID_GAP_Y_BOT 	: integer  	:= DISP_HEIGHT - 64;
	constant GAP_HEIGHT 		: integer  	:= 150;
	constant LEFT_BOUND 		: std_logic_vector(9 downto 0) 	:= conv_std_logic_vector(0, 10);
	constant PIPE_WIDTH 		: std_logic_vector(9 downto 0) 	:= conv_std_logic_vector(32, 10);
	constant PIPES_SPACING		: integer 	:= 200;

	
	-- Pipes
	signal pipeX				: std_logic_vector(9 downto 0) 	:= conv_std_logic_vector(600 + PIPES_SPACING * 0, 10);
	signal pipe2X 				: std_logic_vector(9 downto 0) 	:= conv_std_logic_vector(600 + PIPES_SPACING * 1, 10);
	signal pipe3X 				: std_logic_vector(9 downto 0) 	:= conv_std_logic_vector(600 + PIPES_SPACING * 2, 10);
	signal pipeY  				: std_logic_vector(9 downto 0)  := conv_std_logic_vector(240, 10);
	signal pipe2Y  				: std_logic_vector(9 downto 0)  := conv_std_logic_vector(240, 10);
	signal pipe3Y  				: std_logic_vector(9 downto 0)  := conv_std_logic_vector(240, 10);
	
	-- Game
	signal pipeSpeed       		: std_logic_vector(9 downto 0) := conv_std_logic_vector(3, 10);
	
	-- health item
	signal vhealthx 			: integer 	:= 736;
	signal vhealthy 			: integer 	:= 128;
	signal healthpicked 		: std_logic := '0';

	-- check if game is running
	signal running 				: std_logic := '1';
	signal start_pipe, paused, dead : std_logic := '0';
	
	SIGNAL output_s: std_logic_vector(5 DOWNTO 0);
begin
 CompToTest: LFSR PORT MAP (v_sync, output_s);
 
	-- Rendering
	process(state, pipeX, pipe2X, pixel_column, pixel_row)
		variable r, g, b : std_logic_vector(3 downto 0) := "0000";
		variable vPipeOut : std_logic := '0';
	begin
		vPipeOut := '0';
		
		-- Pipe 1
		if (
			(pipeX <= pixel_column) and ('0' & pixel_column <= pipeX + PIPE_WIDTH) and 
			(('0' & pixel_row <= pipeY - GAP_HEIGHT) or (pixel_row >= pipeY))
			) then
			vPipeOut := '1';
		end if;
		
		-- Pipe 2
		if (
			(pipe2X <= pixel_column) and ('0' & pixel_column <= pipe2X + PIPE_WIDTH) and 
			(('0' & pixel_row <= pipe2Y - GAP_HEIGHT) or (pixel_row >= pipe2Y))
			) then
			vPipeOut := '1';
		end if;
		
		-- Pipe 3
		if (
			(pipe3X <= pixel_column) and ('0' & pixel_column <= pipe3X + PIPE_WIDTH) and 
			(('0' & pixel_row <= pipe3Y - GAP_HEIGHT) or (pixel_row >= pipe3Y))
			) then
			vPipeOut := '1';
		end if;
		
		pipe_out <= vPipeOut;

	end process;
	
	
	process(v_sync)
		variable randY			: std_logic_vector(9 downto 0) := conv_std_logic_vector(64, 10);
		variable pipeActive, pipe2Active : std_logic := '1';
		variable vhealth : std_logic_vector(5 downto 0) := conv_std_logic_vector(34, 6);
	begin 
		-- Playing
		if (rising_edge(v_sync) and state = "01") then 
			
			-- Random Height
			randY := VALID_GAP_Y_BOT - ("0000" & output_s);
			
			
			-- If Pipe 1 Out-of-Bound, Resets, Otherwise Move
			if (pipeX + PIPE_WIDTH < LEFT_BOUND) then
				pipeX <= conv_std_logic_vector(DISP_WIDTH, 10);
				pipeY <= randY;
			else
				pipeX <= pipeX - pipeSpeed;
			end if;
			
			-- If Pipe 2 Out-of-Bound, Resets, Otherwise Move
			if (pipe2X + PIPE_WIDTH < LEFT_BOUND) then
				pipe2X <= conv_std_logic_vector(DISP_WIDTH, 10);
				pipe2Y <= randY;
			else
				pipe2X <= pipe2X - pipeSpeed;
			end if;
			
			-- If Pipe 2 Out-of-Bound, Resets, Otherwise Move
			if (pipe3X + PIPE_WIDTH < LEFT_BOUND) then
				pipe3X <= conv_std_logic_vector(DISP_WIDTH, 10);
				pipe3Y <= randY;
			else
				pipe3X <= pipe3X - pipeSpeed;
			end if;
								
			if (vhealthx < 1 or healthpicked = '1') then
				vhealthx <= 640;
				vhealthy <= 128;
			end if;
			
			healthpicked <= '0';	
			healthx <= vhealthx;
			healthy <= vhealthy;
		end if;
	end process;
end Behavioral;
		
				
			
