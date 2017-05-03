library ieee;
use ieee.std_logic_1164.all;

entity hpri_8_3_vhdl is
port(r:in std_logic_vector(0 to 7);
    ei:in std_logic;
     g:out std_logic;
    eo:out std_logic;
     a:out std_logic_vector(0 to 2));
end hpri_8_3_vhdl;

architecture behavior of hpri_8_3_vhdl is
begin
process(r, ei)
begin
    a(0)<=(r(7) or (not(r(6)) and r(5)) or (not(r(6)) and not(r(4)) and r(3)) or (not(r(6)) and not(r(4)) and not(r(2)) and r(1))) and ei;
    a(1)<=(r(7) or r(6) or (not(r(5)) and not(r(4)) and r(3)) or (not(r(5)) and not(r(4)) and r(2))) and ei;
    a(2)<=(r(7) or r(6) or r(5) or r(4)) and ei;
    g<=(r(0) or r(1) or r(2) or r(3) or r(4) or r(5) or r(6) or r(7));
    eo<=not(r(0) or r(1) or r(2) or r(3) or r(4) or r(5) or r(6) or r(7));
end process;
end behavior;
