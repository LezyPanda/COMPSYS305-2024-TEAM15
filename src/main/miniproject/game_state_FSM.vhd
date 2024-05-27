library ieee;
use ieee.std_logic_1164.all; 

entity game_state_FSM is
	port(
		vSync		        					: in std_logic;
		mbL, mbR								: in std_logic;
		button1, button2, button3, button4, SW0	: in std_logic;
		lives									: in std_logic_vector(2 downto 0);
		state_out         						: out std_logic_vector(1 downto 0);
		mode									: out std_logic	:= '0';
		timer									: out std_logic	:= '0';
		reset									: out std_logic
	);
end game_state_FSM;

architecture FSM of game_state_FSM is
	type game_state_type is(intro, play, dead, pause);
begin 
	process(vSync, button1, button2, button3, button4, mbL, mbR, lives, SW0)
		variable state : game_state_type := intro;
		variable bWasDown : std_logic := '0';
		variable b2WasDown : std_logic := '0';
		variable b3WasDown : std_logic := '0';
		variable b4WasDown : std_logic := '0';
		variable bPress	: std_logic := '0';
		variable b2Press	: std_logic := '0';
		variable b3Press	: std_logic := '0';
		variable b4Press	: std_logic := '0';
		variable vMode		: std_logic := '0';
	begin	
		if (rising_edge(vSync)) then
		
			if (button1 = '0') then
				if (bWasDown = '0') then
					bPress := '1';
				else
					bPress := '0';
				bWasDown := '1';
				end if;
			else
				bWasDown := '0';
				bPress := '0';
			end if;
			
			if (button2 = '0') then
				if (b2WasDown = '0') then
					b2Press := '1';
				else
					b2Press := '0';
				b2WasDown := '1';
				end if;
			else
				b2WasDown := '0';
				b2Press := '0';
			end if;
		
			if (button3 = '0') then
				if (b3WasDown = '0') then
					b3Press := '1';
				else
					b3Press := '0';
				b3WasDown := '1';
				end if;
			else
				b3WasDown := '0';
				b3Press := '0';
			end if;

			if (button4 = '0') then
				if (b4WasDown = '0') then
					b4Press := '1';
				else
					b4Press := '0';
				b4WasDown := '1';
				end if;
			else
				b4WasDown := '0';
				b4Press := '0';
			end if;
			
			case state is
				when intro => 
					if (bPress = '1') then
						reset <= '1';
						if (vMode = '0') then
							timer <= '1';
						end if;
						state := play;
					end if;
				when play =>
					reset <= '0';
					if (lives <= "000") then
						timer <= '0';
						state := dead;
					elsif (b3Press = '1') then
						timer <= '0';
						state := pause;
					end if;						
				when pause =>
					if (bPress = '1') then
						if (vMode = '0') then
							timer <= '1';
						end if;
						state := play;
					elsif (b2Press = '1') then
						timer <= '0';
						state := intro;
					end if;
				when dead =>
					if (bPress = '1') then
						state := play;
						reset <= '1';
						if (vMode = '0') then
							timer <= '1';
						end if;
					elsif (b2Press = '1') then
						state := intro;
					end if;
			end case; 
		
			case state is
				when intro =>
					state_out <= "00";
					mode <= vMode;
				when play =>  
					state_out <= "01";
				when pause => 
					state_out <= "10";
				when dead => 
					state_out <= "11";
			end case;
		end if;
		vMode := SW0;
	end process;
end architecture FSM;
					
					
					
					
					
					
					