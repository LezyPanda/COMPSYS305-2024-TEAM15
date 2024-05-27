LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Testbench IS
END Testbench;

ARCHITECTURE TBarch OF Testbench IS
  COMPONENT LFSR IS
  port (
    clk		: in std_logic;
    output	: out std_logic_vector (5 downto 0)
  );
  END COMPONENT;

  SIGNAL Clk_s: std_logic;
  SIGNAL output_s: std_logic_vector(5 DOWNTO 0);

BEGIN
  CompToTest: LFSR PORT MAP (Clk_s, output_s);
   
  Clk_proc: PROCESS
  BEGIN
    Clk_s <= '1';
    WAIT FOR 10 ns;
    Clk_s <= '0';
    WAIT FOR 10 ns;
  END PROCESS clk_proc;


END TBarch;