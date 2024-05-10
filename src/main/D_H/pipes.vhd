library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PipeGame is
	Port (
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		h_sync, v_sync : out STD_LOGIC;
		red, green, blue : OUT std_logic
	);
end PipeGame;

architecture Behavioral of PipeGame is
	-- Constants for display size, pipe dimensions, and number of pipes
	constant DISP_WIDTH : integer := 640;
	constant DISP_HEIGHT : integer := 480;
	constant PIPE_WIDTH : integer := 32;
	constant PIPE_GAP : integer := 96;
	constant MIN_PIPE_HEIGHT : integer := 32;
	constant NUM_PIPES : integer := 6;

	-- Signals for pipe positions and heights
	type PipeArray is array (0 to NUM_PIPES-1) of integer;
	signal pipe_x : PipeArray := (others => DISP_WIDTH);
	signal top_pipe_height : PipeArray := (others => DISP_HEIGHT / 2);
	signal bottom_pipe_height : PipeArray := (others => DISP_HEIGHT / 2);

	-- Instantiate VGA sync and lFSR10 modules
	component vga_sync is
		Port (
			clock_25Mhz, red, green, blue : in STD_LOGIC;
			red_out, green_out, blue_out, horiz_sync_out, vert_sync_out : out STD_LOGIC;
			pixel_row, pixel_column : out STD_LOGIC_VECTOR (9 downto 0)
		);
	end component;

	component LFSR8 is
		Port (
			Clk, Rst : in std_logic;
			output : out std_logic_vector (5 downto 0)
		);
	end component;

	signal lfsr_output : std_logic_vector(5 downto 0);

begin
	-- Instantiate VGA sync and lFSR10 modules
	vga_inst : vga_sync
		port map (
			clock_25Mhz => clk,
			red => '0',
			green => '1', -- Set green to '1' to make the pipes green
			blue => '0',
			red_out => open,
			green_out => open,
			blue_out => open,
			horiz_sync_out => h_sync,
			vert_sync_out => v_sync,
			pixel_row => open,
			pixel_column => open
		);

	lfsr_inst : LFSR8
		port map (
			Clk => clk,
			Rst => reset,
			output => lfsr_output
		);

	pipe_gen_proc : process(clk)
	begin
		if rising_edge(clk) then
			-- Move the pipes to the left and generate new ones as necessary
			for i in 0 to NUM_PIPES-1 loop
				pipe_x(i) <= pipe_x(i) - 1;

				-- If a pipe has moved off the screen, generate a new one
				if pipe_x(i) < 0 then
					pipe_x(i) <= DISP_WIDTH;

					-- Generate random heights for the pipes, ensuring they are at least MIN_PIPE_HEIGHT
					-- and there is a gap of PIPE_GAP between them
					top_pipe_height(i) <= to_integer(unsigned(lfsr_output)) mod (DISP_HEIGHT - PIPE_GAP - MIN_PIPE_HEIGHT) + MIN_PIPE_HEIGHT;
					bottom_pipe_height(i) <= DISP_HEIGHT - top_pipe_height(i) - PIPE_GAP;
				end if;
			end loop;
		end if;
	end process;
end Behavioral;
