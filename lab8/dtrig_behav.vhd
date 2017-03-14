-- MAX+plus II VHDL Template
-- Clearable flipflop with enable

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dtrig_behav IS

    PORT
    (
        d  : IN    STD_LOGIC;
        l  : IN    STD_LOGIC;
        q  : INOUT     STD_LOGIC;
        qb : INOUT     STD_LOGIC
    );

END dtrig_behav;

ARCHITECTURE behav OF dtrig_behav IS

BEGIN

    PROCESS (d, l)
    BEGIN

        IF d = '1' THEN

            IF l = '1' THEN
            q <='1';
            qb <= '1';
            ELSE q <= '1';
            qb <= '0';
            END IF;

        ELSE
IF l<='1' THEN
q <= '0';
qb <= '1';
        END IF;
END IF;
    END PROCESS;
END behav;

