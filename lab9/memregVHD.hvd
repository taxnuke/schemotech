LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY memregVHD IS
PORT(
     x1, x2, x3, x4, reset, write, read : IN std_logic;
                         q1, q2, q3, q4 : OUT std_logic
     );
END memregVHD;

ARCHITECTURE behav OF memregVHD IS
SIGNAL d1, d2, d3, d4 : std_logic;
BEGIN
PROCESS (x1, x2, x3, x4, write, reset, read)
BEGIN
   IF write='0' THEN
      q1<='0';
      q2<='0';
      q3<='0';
      q4<='0';
   END IF;
   IF reset='1' THEN
      q1<='0';
      q2<='0';
      q3<='0';
      q4<='0';
   END IF;
   IF read='0' THEN
      q1<='0';
      q2<='0';
      q3<='0';
      q4<='0';
   END IF;
   IF write = '1' THEN
      d1<=x1;
      d2<=x2;
      d3<=x3;
      d4<=x4;
   END IF;

   IF d1='1' THEN q1<=d1;
   END IF;
   IF d2='1' THEN q2<=d2;
   END IF;
   IF d3='1' THEN q3<=d3;
   END IF;
   IF d4='1' THEN q4<=d4;
   END IF;
END PROCESS;

END behav;

