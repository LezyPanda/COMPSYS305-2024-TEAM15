LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_SIGNED.all;

entity bird is 
			
	-- idk if we are adding a reset button
	port(signal pb1, pb2, clk : in std_logic;
		  signal state :in std_logic_vector(1 downto 0)
		  signal red, green, blue : out std_logic;
		  signal pixel_row, pixel_column : out std_logic_vector(9 downto 0);