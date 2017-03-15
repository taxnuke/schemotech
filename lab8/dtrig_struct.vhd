LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dtrig_struct IS
  PORT(
    d  : IN STD_LOGIC;
    l  : IN STD_LOGIC;
    q  : OUT STD_LOGIC;
    qb : OUT STD_LOGIC
  );
END dtrig_struct;

ARCHITECTURE behav OF dtrig_struct IS

  COMPONENT my_nand
  PORT(
    a : IN STD_LOGIC;
    b : IN STD_LOGIC;
    c : INOUT STD_LOGIC
    );
  END COMPONENT;

  COMPONENT rstrig_my_nand
  PORT(
    s  : IN STD_LOGIC;
    r  : IN STD_LOGIC;
    q  : OUT STD_LOGIC;
    qb : OUT STD_LOGIC
    );
  END COMPONENT;

  signal s1, s2 : STD_LOGIC;

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

