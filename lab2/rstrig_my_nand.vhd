LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY rstrig_my_nand IS
    PORT(
            s  : IN std_logic;
            r  : IN std_logic;
            q  : INOUT std_logic;
            qb : INOUT std_logic
        );
END rstrig_my_nand;

ARCHITECTURE behav OF rstrig_my_nand IS
    COMPONENT my_nand -- описание используемого компонента
    PORT(
            a : IN std_logic;
            b : IN std_logic;
            c : INOUT std_logic
        );
    END COMPONENT;
    BEGIN
    u1 : my_nand -- указание u1, как компонента my_nand
        PORT MAP (s, qb, q); -- указание входов и выхода для u1
    u2 : my_nand
        PORT MAP (q, r, qb);
END behav;

CONFIGURATION con OF rstrig_my_nand IS
    FOR behav
        FOR u1, u2: my_nand
            USE ENTITY work.my_nand (behavior); -- ?????????? ??????????
        END FOR; -- ? ?????? ?????????? my_nand
    END FOR;
END con;
