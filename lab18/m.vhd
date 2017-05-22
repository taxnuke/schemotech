LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY m IS
PORT(a:IN std_logic_vector(0 to 1);
	 d:IN std_logic;
	 c:IN std_logic;
	 q:OUT std_logic_vector(0 to 3));
	 
END m;

ARCHITECTURE behavior OF m IS
BEGIN
PROCESS(d, c, a)
BEGIN
	IF (c'event and c='1') THEN
		IF(a(0)='0' and a(1)='0') THEN
			q(0) <= d;
		END IF;
		IF(a(0)='1' and a(1)='0') THEN
			q(2) <= d;
		END IF;
		IF(a(0)='0' and a(1)='1') THEN
			q(1) <= d;
		END IF;
		IF(a(0)='1' and a(1)='1') THEN
			q(3) <= d;
		END IF;
	END IF;
END PROCESS;
END behavior;
