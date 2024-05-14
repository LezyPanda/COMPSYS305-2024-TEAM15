library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

entity pipes is
	Port (
		-- clk, v_sync to vga, state and mode to fsm, reset can be disconeccted
		clk,v_sync,reset,mode : in STD_LOGIC;
		state                 : in std_logic_vector(1 downto 0);
		--vga sync
		pixel_row, pixel_column	: in std_logic_vector(9 DOWNTO 0);
		-- pipe gap connected to LFSR
		pipe_gap :std_logic_vector (5 DOWNTO 0);
		-- vga
		pipe_out :out std_logic
	);
end pipes;

architecture Behavioral of pipes is
	-- Constants for display size, pipe dimensions, and number of pipes (tobe used later)
	constant DISP_WIDTH : integer := 640;
	constant DISP_HEIGHT : integer := 480;
	--constant PIPE_WIDTH : integer := 32;
	constant MIN_PIPE_HEIGHT : integer := 32;

	-- Signals for pipe positions and heights
	signal pipe_width_start : integer := 640;
	signal pipe_width_end   : integer := 672;
	signal pipe_height_gap  : integer := 192;
	signal pipe_speed       : integer := 150;

	-- check if game is running
	signal running :std_logic := '1';
	signal start_pipe, paused, dead,move_pipe: std_logic :=  '0';

	
	
begin
	-- Instantiate VGA sync and lFSR10 modules
	
pipe_process : process(move_pipe)
		begin 
		if(running = '1' and paused = '0') then 
		-- check if pipes are off the screen
			if move_pipe = '1' then
				if not( pipe_width_start = 0) then 
					pipe_width_start <= pipe_width_start - 1;
				end if;
				pipe_width_end <= pipe_width_end  - 1;
			end if;
		end if;
		
		
		pipe_out <= '0';

		-- pipe generation
		if(pipe_width_end < 1) then
				pipe_width_start <= 640;
				pipe_width_end <= 672;
				-- to be changed
				pipe_height_gap <= conv_integer(unsigned(pipe_gap)) * 4;
			end if;
		
		
		-- pipe rendering
		if(pixel_column >= CONV_STD_LOGIC_VECTOR(pipe_width_start,10) and pixel_column < CONV_STD_LOGIC_VECTOR(pipe_width_end,10))then
				if(pixel_row <= CONV_STD_LOGIC_VECTOR(pipe_height_gap,10) or pixel_row >CONV_STD_LOGIC_VECTOR(pipe_height_gap +150,10))then
					pipe_out <= '1';
				end if;
			end if;
		end process pipe_process;
-- temp clk divider		
time_process : process(clk)
				variable count : integer := 0;
				variable next_pipe_count : integer := 0;
		begin
			if(rising_edge(clk) and paused = '0') then
				if(state = "01")then	
					count := count + 1;
					move_pipe <= '0';
					
					
					if(count >= (25000000/pipe_speed)) then
						count := 0;
						move_pipe <= '1';
						next_pipe_count := next_pipe_count + 1;
					end if;
				end if;
			
			if(reset = '1')then 
				count := 0;
				next_pipe_count := 0;
			end if;
		end if;	
	end process time_process;
end Behavioral;
		
				
			
