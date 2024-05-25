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
		-- timecheck to check for time and change speed accordingly
		timecheck : in std_logic_vector(11 DOWNTO 0);
		-- pipe gap connected to LFSR
		pipe_gap :in std_logic_vector (5 DOWNTO 0);
		-- vga
		pipe_out :out std_logic;
		-- health item 
		healthx : out integer;
		healthy : out integer
		
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
	
	signal pipe_width_start2 : integer := 800;
	signal pipe_width_end2   : integer := 832;
	
	signal pipe_height_gap2  : integer := 222;
	signal pipe_height_gap  : integer := 222;
	
	signal pipe_speed       : integer := 150;
	
	-- health item
	signal vhealthx : integer := 736;
	signal vhealthy : integer := 128;
	signal healthpicked :std_logic := '0';

	
	-- check if game is running
	signal running :std_logic := '1';
	signal start_pipe, paused, dead,move_pipe: std_logic :=  '0';

	
	
begin
	-- Instantiate VGA sync and lFSR10 modules

pipe_process : process(move_pipe)
		variable vhealth : std_logic_vector(5 downto 0) := CONV_STD_LOGIC_VECTOR(34, 6);

		begin 
	
		if(running = '1' and paused = '0') then 
		-- check if pipes are off the screen
			if move_pipe = '1' then
				if not( pipe_width_start = 0) then 
					pipe_width_start <= pipe_width_start - 1;
				end if;
				pipe_width_end <= pipe_width_end  - 1;
				
				
				if not(pipe_width_start2 = 0) then 
					pipe_width_start2 <= pipe_width_start2 - 1;
				end if;
				pipe_width_end2 <= pipe_width_end2 - 1;
					
			
				if not(vhealthx = 0) then 
					vhealthx <= vhealthx - 1;
				end if;
			end if;
		end if;
		
		
		pipe_out <= '0';

		-- pipe generation
		if(pipe_width_end < 1) then
				pipe_width_start <= 640;
				pipe_width_end <= 672;
				-- to be changed
				pipe_height_gap <= 180;
			end if;
		if(pipe_width_end2 < 1) then
				pipe_width_start2 <= 640;
				pipe_width_end2 <= 672;
				-- to be changed
				pipe_height_gap2 <= 180;
			end if;
			
			
		if(vhealthx < 1 or healthpicked = '1') then
				vhealthx <= 640;
				vhealthy <= 128;
			end if;
		healthpicked <= '0';	
			
		-- pipe rendering
		if(pixel_column >= CONV_STD_LOGIC_VECTOR(pipe_width_start,10) and pixel_column < CONV_STD_LOGIC_VECTOR(pipe_width_end,10))then
				if(pixel_row <= CONV_STD_LOGIC_VECTOR(pipe_height_gap,10) or pixel_row >CONV_STD_LOGIC_VECTOR(pipe_height_gap,10) + 150)then
					pipe_out <= '1';
				end if;
			end if;
		if(pixel_column >= CONV_STD_LOGIC_VECTOR(pipe_width_start2,10) and pixel_column < CONV_STD_LOGIC_VECTOR(pipe_width_end2,10))then
				if(pixel_row <= CONV_STD_LOGIC_VECTOR(pipe_height_gap2,10) or pixel_row >CONV_STD_LOGIC_VECTOR(pipe_height_gap2,10)+ 150)then
					pipe_out <= '1';
				end if;
			end if;
		healthx <= vhealthx;
		healthy <= vhealthy;

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
		
				
			
