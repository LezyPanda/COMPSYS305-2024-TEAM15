LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Testbench IS
END Testbench;

ARCHITECTURE TBarch OF Testbench IS
  COMPONENT LFSR IS
    PORT (Clk, Rst: IN std_logic;
          output: OUT std_logic_vector (5 DOWNTO 0));
  END COMPONENT;

  SIGNAL Clk_s, Rst_s: std_logic;
  SIGNAL output_s: std_logic_vector(5 DOWNTO 0);

BEGIN
  CompToTest: LFSR PORT MAP (Clk_s, Rst_s, output_s);
   
  Clk_proc: PROCESS
  BEGIN
    Clk_s <= '1';
    WAIT FOR 10 ns;
    Clk_s <= '0';
    WAIT FOR 10 ns;
  END PROCESS clk_proc;


END TBarch;