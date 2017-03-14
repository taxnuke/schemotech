LIBRARY ieee;                -- подключение библиотеки ieee
USE ieee.std_logic_1164.ALL; -- использование библиотечного
                             -- модуля, содержащего
                             -- дополнительные типы переменных.
ENTITY my_nand IS
PORT(
        a : IN std_logic;
        b : IN std_logic;
        c : INOUT std_logic
    );
END my_nand;
-- описание входов и выходов -- устройства (IN — вход, OUT —
-- выход, INOUT — двунаправленный -- сигнал)
ARCHITECTURE behavior OF my_nand IS
BEGIN
    C <= NOT ( a AND b );
END behavior;
