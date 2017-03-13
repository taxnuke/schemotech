LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY dtrig_struct IS
PORT(
  d : IN std_logic;
  l : IN std_logic;
  q : OUT std_logic;
  qb: OUT std_logic
  );
END dtrig_struct;

ARCHITECTURE behav OF dtrig_struct IS

COMPONENT my_nand
PORT(
  a : IN std_logic;
  b : IN std_logic;
  c : INOUT std_logic
  );
END COMPONENT;

COMPONENT rstrig_my_nand
PORT(
  s : IN std_logic;
  r : IN std_logic;
  q : OUT std_logic;
  qb: OUT std_logic
  );
END COMPONENT;

signal s1: std_logic;
signal s2: std_logic;

BEGIN
u1 : my_nand
  PORT MAP (d, l, s1);
u2 : my_nand
  PORT MAP (s1, l, s2);
u3 : rstrig_my_nand
  PORT MAP (s1, s2, q, qb);
END behav;
CONFIGURATION con OF dtrig_struct IS
  FOR behav
   FOR u1, u2: my_nand
     USE ENTITY work.my_nand (behavior);
  END FOR;
  FOR u3: rstrig_my_nand
    USE ENTITY work.rstrig_my_nand (behavior);
END FOR;
END FOR;
END con;

