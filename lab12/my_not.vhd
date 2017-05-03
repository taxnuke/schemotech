library ieee;
use ieee.std_logic_1164.all;

entity my_not is
port(d:in std_logic;
    nd:out std_logic);
end my_not;

architecture behavior of my_not is
begin
process(d)
begin
    nd<=not d;
end process;
end behavior;
