library ieee;
use ieee.std_logic_1164.all;

entity my_or2 is
port(a:in std_logic;
     b:in std_logic;
     c:out std_logic);
end my_or2;

architecture behavior of my_or2 is
begin
process(a, b)
begin
    c <= a or b;
end process;
end behavior;
