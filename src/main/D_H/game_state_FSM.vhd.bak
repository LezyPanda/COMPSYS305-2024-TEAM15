library ieee;
use ieee.std_logic_1164.all; 

entity game_state_FSM is
port(
	clk        							:in std_logic;
	button2, button3, check_dead  : in std_logic;
	mode_select			: in std_logic;
	next_state         		: out std_logic_vector(1 downto 0);
	reset					: out std_logic;
	mode					: out std_logic;
	is_pause				: out std_logic);
end game_state_FSM;

architecture FSM of game_state_FSM is
	type game_state_type is(intro,play,dead,pause);
	signal state: game_state_type := intro;
	
	begin 
	process(clk)
		begin
			if rising_edge(clk) then 
		-- current state is intro if button is pressed, game will reset to beginning and go to start screen
			case state is 
				when intro =>
				
					if button3 = '1' then 
					reset <= '1';
					state <= play;
				end if;
				-- button pressed goto pause, if dead goto dead screen, idk if we are adding a reset button
				when play =>
					reset <= '0'
					
					if button2 = '0' then 
					is_paused <= '1'
					state <= pause
					
					elsif check_dead <= '1' then 
					state = dead;
					end if 
				-- button 2 to play again, 4 to goto start, idk if we are adding a reset button
				when pause => 
					if button2 = '0' then
						is_paused = '0';
						state <= play;
					elsif button4 = '0' then 
						is_paused = '0'
						state <= start;
					end if;
				-- button press goto start screen, idk if we are adding a reset
				when dead =>
					if button4 = '0' then
							state <= start;
					end if;
				end case	
			end if
		end process;
		
		-- mode select
		process(state, mode_select)
		begin
			case state is
				when start => mode <= 0;
					if mode_select = '1' then 
						mode <= '1';
					else 
						mode <= '0';
					end if;
					state_out <= "00";
					
				when play =>  
					state_out <= "01";
					
				when pause => 
					state_out <= "10";
					
				when dead => 
					state_out <= "11";
					
				end case; 
			end process;
					
					
					
					
					
					
					