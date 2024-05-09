LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;

ENTITY pipes IS
	PORT
		( pb1, pb2, clk, vert_sync	: IN std_logic;
          pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
		  red, green, blue 			: OUT std_logic);		
END pipes;


architecture behavior of pipes is

SIGNAL top_pipe_on						: std_logic;
sIGNAL bottom_pipe_on	: std_logic;
SIGNAL top_pipe_size 			: std_logic_vector(9 DOWNTO 0);  
SIGNAL bottom_pipe_size  		: std_logic_vector(9 DOWNTO 0);
SiGNAL top_pipe_y_pos			: std_logic_vector(9 DOWNTO 0);
SiGNAL bottom_pipe_y_pos		: std_logic_vector(9 DOWNTO 0);
SIGNAL pipe_x_pos					: std_logic_vector(10 DOWNTO 0);
SIGNAL pipe_x_motion		    	: std_logic_vector(9 DOWNTO 0);

BEGIN
-- change size
SIGNAL top_pipe_size 			CONV_STD_LOGIC_VECTOR(15,10);  
SIGNAL bottom_pipe_size  		CONV_STD_LOGIC_VECTOR(80,40);

ball_on <= '1' when ( ('0' & ball_x_pos <= '0' & pixel_column + size) and ('0' & pixel_column <= '0' & ball_x_pos + size) 	-- x_pos - size <= pixel_column <= x_pos + size
					and ('0' & ball_y_pos <= pixel_row + size) and ('0' & pixel_row <= ball_y_pos + size) )  else	-- y_pos - size <= pixel_row <= y_pos + size

					-- Colours for pixel data on video signal
-- Changing the background and ball colour by pushbuttons
Red <=  pb1;
Green <= (not pb2) and (not ball_on);
Blue <=  not ball_on;


Move_Pipe: process (vert_sync)
begin
	-- Move pipe once every vertical sync
	if (rising_edge(vert_sync)) then			
		pipe_x_pos <= pipe_x_pos + pipe_x_motion;
	end if;
end process Move_Ball;

END behavior;