-- MAX+plus II VHDL Template
-- Clearable flipflop with enable

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY rstrig_behav IS

    PORT
    (
        s: IN  STD_LOGIC;
        r: IN  STD_LOGIC;
        q: OUT STD_LOGIC
    );

END rstrig_behav;

ARCHITECTURE behav OF rstrig_behav IS

    SIGNAL qs: std_logic;
BEGIN

    PROCESS (s, r)
    BEGIN
        IF s = '1' THEN
            IF r = '1' THEN
                qs <=qs;
            ELSE
                qs <= '0';
            END IF;
        ELSE
            qs<='1';
        END IF;
    END PROCESS;
    q<=qs;
END behav;
