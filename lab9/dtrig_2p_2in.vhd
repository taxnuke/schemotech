LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY dtrig_2p_2in IS
PORT(
    d, c1, c2, r : IN std_logic;
               q : OUT std_logic
    );
END dtrig_2p_2in;

ARCHITECTURE behav OF dtrig_2p_2in IS
    SIGNAL d1, d2 : std_logic;
    BEGIN
    PROCESS (d, c1, r)
    BEGIN
        IF r='1' THEN
            IF c1='1' THEN d1<=d ;
                END IF;
        END IF;
    END PROCESS;

    PROCESS (d, c2, r)
    BEGIN
        IF r='1' THEN
            IF c2='1' THEN d2<=d1;
                END IF;
            q<=d2;
        END IF;
    END PROCESS;

END behav;
