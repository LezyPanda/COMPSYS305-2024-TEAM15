LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY LFSR IS
  PORT (Clk, Rst: IN std_logic;
        output: OUT std_logic_vector ( 5 DOWNTO 0));
END LFSR;

ARCHITECTURE LFSR_beh OF LFSR IS
  SIGNAL Currstate, Nextstate: std_logic_vector (5 DOWNTO 0);
  SIGNAL feedback: std_logic;
BEGIN

  StateReg: PROCESS (Clk,Rst)
  BEGIN
    IF (Rst = '1') THEN
      Currstate <= (0 => '1', OTHERS =>'0');
    ELSIF (Clk = '1' AND Clk'EVENT) THEN
      Currstate <= Nextstate;
    END IF;
  END PROCESS;
  
  feedback <= Currstate(4) XOR Currstate(3) XOR Currstate(2) XOR Currstate(0);
  Nextstate <= feedback & Currstate(5 DOWNTO 1);
  output <= Currstate;

END LFSR_beh;