LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY dtrig_2p_1in IS
PORT(
    d: IN std_logic;
    c : IN std_logic;
    r : IN std_logic;
    q1, q2 : OUT std_logic
    );
END dtrig_2p_1in;

ARCHITECTURE behav OF dtrig_2p_1in IS

    SIGNAL d1, d2, d3, d4 : std_logic;
    BEGIN
    PROCESS (d, c, r)
        BEGIN
        IF r='0' THEN
            q1 <='0';
            q2 <='0';
        END IF;
        IF r='1' THEN
            IF c='1' THEN
                d1 <= d;
                d3 <= d2;
            ELSE
                d2 <= d1;
                d4 <= d3;
            END IF;
            q1 <= d2;
            q2 <= d4;
        END IF;
        END PROCESS;
    END behav;
